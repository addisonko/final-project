package com.bc.project_data_provider.service;

import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;
import com.bc.project_data_provider.dto.CompanyNewsDTO;
import com.bc.project_data_provider.dto.LastRefreshDTO;
import com.bc.project_data_provider.dto.LiveQuoteDTO;
import com.bc.project_data_provider.dto.StockSymbolResp;
import com.bc.project_data_provider.lib.RedisHelper;
import com.bc.project_data_provider.mapper.DtoMapper;
import com.bc.project_data_provider.model.CompanyNewsDto;
import com.bc.project_data_provider.model.FinnhubDto;

@Service
public class LiveDataService {
  @Autowired
  private RestTemplate restTemplate;
  @Autowired
  private DtoMapper dtoMapper;
  @Autowired
  private RedisHelper redisHelper;
  @Autowired
  private AsyncOhlcPersistenceService asyncOhlcPersistenceService;

  @Value("${finnhub.api.base-url}")
  private String domain;

  @Value("${finnhub.api.quote-path}")
  private String quotePath;

  @Value("${finnhub.api.news-path}")
  private String newsPath;

  @Value("${finnhub.api.token}")
  private String apiToken;

  @Value("${live.quote.timezone:America/New_York}")
  private String schedulerTimezone;
  @Value("${live.quote.window-start:00:01}")
  private String windowStart; // 9:30 AM
  @Value("${live.quote.window-end:23:59}")
  private String windowEnd; // 4:00 PM

  private final String stockAppURL = "http://project-data-provider-production-f081.up.railway.app/api/stocks/symbols";
  private final Object finnhubRateLimitLock = new Object();
  private static final long finnhubMinIntervalMS = 1100;
  private static final org.slf4j.Logger log =
      LoggerFactory.getLogger(LiveDataService.class);
  private final AtomicBoolean refreshInProgress = new AtomicBoolean(false);
  private static final String LAST_REFRESH_KEY = "quotes:lastRefreshedAt";


  public void runRefreshLoopUntilWindowEnd() {
    ZoneId zone = ZoneId.of(schedulerTimezone);
    int pass = 0;

    while (isInNightlyWindow(zone)) {
      pass++;
      log.info("Starting nightly refresh pass #{}", pass);
      refreshAllQuotes();

      if (!isInNightlyWindow(zone)) {
        log.info("Nightly window closed — stopping after {} passes", pass);
        break;
      }
      log.info("Pass #{} complete — waiting 6 hours before next pass", pass);
      try {
        Thread.sleep(Duration.ofHours(6));
      } catch (InterruptedException e) {
        Thread.currentThread().interrupt();
        log.info("Pass interval interrupted — stopping loop after pass #{}",
            pass);
        break;
      }
    }
  }

  public void refreshAllQuotes() {
    if (!refreshInProgress.compareAndSet(false, true)) {
      log.info("Quote refresh already in progress - skipping");
      return;
    }

    long start = System.currentTimeMillis();
    List<String> symbols = getAllSymbolsFromStockDataApp();
    int success = 0;

    try {
      for (String symbol : symbols) {
        if (refreshQuoteForSymbol(symbol)) {
          success++;
        }
      }
    } finally {
      refreshInProgress.set(false);
      long elapsed = System.currentTimeMillis() - start;
      log.info("Refreshed " + success + "/" + symbols.size() + " quotes in "
          + elapsed + "ms");
      if (success > 0) {
        redisHelper.set(LAST_REFRESH_KEY, LocalDateTime.now(),
            Duration.ofHours(12));
      }
    }
  }

  // Get one stock, fetch from Finnhub, set in Redis
  public boolean refreshQuoteForSymbol(String symbol) {
    try {
      FinnhubDto quote = fetchFromFinnhub(symbol);
      if (quote == null || quote.getCurrentPrice() == null) {
        log.warn("No quote data returned for" + " " + symbol);
        return false;
      }
      redisHelper.set(symbolKey(symbol), quote, Duration.ofHours(12));
      this.asyncOhlcPersistenceService.persistDailyOhlcAsync(symbol, quote);
      return true;
    } catch (InterruptedException e) {
      Thread.currentThread().interrupt();
      log.warn("Refresh interrupted for" + " " + symbol);
      return false;
    } catch (Exception e) {
      log.warn(
          "Failed to refresh quote for" + " " + symbol + " " + e.getMessage());
      return false;
    }
  }

  // Get all symbols from 8080
  public List<String> getAllSymbolsFromStockDataApp() {
    try {
      StockSymbolResp[] symbolsArray =
          restTemplate.getForObject(stockAppURL, StockSymbolResp[].class);

      if (symbolsArray != null) {
        return Arrays.stream(symbolsArray) //
            .map(stock -> stock.getSymbol()) //
            .toList();
      }
    } catch (Exception e) {
      log.error("Error fetching symbols from stock-data app" + e.getMessage());
    }
    return Collections.emptyList();
  }

  public List<LiveQuoteDTO> getQuotesForSymbols(List<String> symbols) {
    List<LiveQuoteDTO> quotes = new ArrayList<>();
    for (String symbol : symbols) {
      LiveQuoteDTO quote = getCachedQuote(symbol);
      if (quote != null) {
        quotes.add(quote);
      }
    }
    return quotes;
  }

  public List<LiveQuoteDTO> getAllCachedQuotes() {
    List<String> symbols = getAllSymbolsFromStockDataApp();
    return getQuotesForSymbols(symbols);
  }

  public LastRefreshDTO getLastRefreshTime() {
    LocalDateTime lastRefreshTime =
        redisHelper.get(LAST_REFRESH_KEY, LocalDateTime.class);
    return LastRefreshDTO.builder() //
        .lastRefreshTime(lastRefreshTime) //
        .build();
  }

  public List<CompanyNewsDTO> fetchCompanyNews(String symbol) {
    ZoneId zone = ZoneId.of(schedulerTimezone);
    String from = LocalDate.now(zone).minusDays(7).toString();
    String to = LocalDate.now(zone).toString();

    String url = UriComponentsBuilder.newInstance() //
        .scheme("https") //
        .host(this.domain) //
        .path(this.newsPath) //
        .queryParam("symbol", symbol) //
        .queryParam("from", from) //
        .queryParam("to", to).queryParam("token", this.apiToken) //
        .build() //
        .toString();

    synchronized (this.finnhubRateLimitLock) {
      try {
        CompanyNewsDto[] articles =
            this.restTemplate.getForObject(url, CompanyNewsDto[].class);

        if (articles == null || articles.length == 0) {
          return Collections.emptyList();
        }

        return Arrays.stream(articles) //
            .sorted(Comparator.comparing(CompanyNewsDto::getDatetime, //
                Comparator.nullsLast(Comparator.reverseOrder()))) //
            .map(e -> this.dtoMapper.map(e)).toList();
      } catch (Exception e) {
        log.warn("Failed to fetch news for " + symbol + ": " + e.getMessage());
        return Collections.emptyList();
      } finally {
        try {
          Thread.sleep(finnhubMinIntervalMS);
        } catch (InterruptedException e) {
          Thread.currentThread().interrupt();
        }
      }
    }
  }



  // ! Private methods
  private FinnhubDto fetchFromFinnhub(String symbol)
      throws InterruptedException {
    String url = UriComponentsBuilder.newInstance() //
        .scheme("https") //
        .host(this.domain) //
        .path(this.quotePath) //
        .queryParam("symbol", symbol) //
        .queryParam("token", this.apiToken) //
        .build() //
        .toString();

    synchronized (this.finnhubRateLimitLock) {
      try {
        return this.restTemplate.getForObject(url, FinnhubDto.class);
      } finally {
        Thread.sleep(finnhubMinIntervalMS);
      }
    }
  }

  private String symbolKey(String symbol) {
    return "symbol_" + symbol.toUpperCase();
  }

  private LiveQuoteDTO getCachedQuote(String symbol) {
    FinnhubDto cached = redisHelper.get(symbolKey(symbol), FinnhubDto.class);
    if (cached == null) {
      return null;
    }
    return dtoMapper.map(symbol, cached);
  }

  public boolean isInNightlyWindow() {
    return isInNightlyWindow(ZoneId.of(schedulerTimezone));
  }

  private boolean isInNightlyWindow(ZoneId zone) {
    LocalTime now = LocalTime.now(zone);
    LocalTime start = LocalTime.parse(windowStart); // "09:30"
    LocalTime end = LocalTime.parse(windowEnd); // "16:00"
    return !now.isBefore(start) && now.isBefore(end);
  }

}
