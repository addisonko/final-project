package com.bc.project_data_provider.service;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.ZoneId;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import com.bc.project_data_provider.dto.UpsertDailyOhlcReq;
import com.bc.project_data_provider.model.FinnhubDto;

@Service
public class AsyncOhlcPersistenceService {
  @Autowired
  private RestTemplate restTemplate;
  private static final ZoneId US_MARKET = ZoneId.of("America/New_York");
  private static final org.slf4j.Logger log =
      LoggerFactory.getLogger(LiveDataService.class);
  private final String ohlcUpsertUrl =
      "http://project-data-provider-production-f081.up.railway.app/api/stocks/{symbol}/ohlc/daily";


  @Async("databaseWriteExecutor")
  public void persistDailyOhlcAsync(String symbol, FinnhubDto quote) {
    if (quote.getOpenPrice() == null || quote.getHighPrice() == null
        || quote.getLowPrice() == null || quote.getCurrentPrice() == null) {
      log.warn("Incomplete OHLC for {} — skipping DB persist", symbol);
      return;
    }

    UpsertDailyOhlcReq request =
        UpsertDailyOhlcReq.builder().tradeDate(LocalDate.now(US_MARKET))
            .open(BigDecimal.valueOf(quote.getOpenPrice()))
            .high(BigDecimal.valueOf(quote.getHighPrice()))
            .low(BigDecimal.valueOf(quote.getLowPrice()))
            .close(BigDecimal.valueOf(quote.getCurrentPrice())).build();

    try {
      restTemplate.put(ohlcUpsertUrl, request, symbol.toUpperCase());
    } catch (Exception e) {
      log.warn("Failed to persist daily OHLC for {}: {}", symbol,
          e.getMessage());
    }
  }
}
