package com.bc.project_stock_data.service;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import com.bc.project_stock_data.dto.CompanyNewsDTO;
import com.bc.project_stock_data.dto.StockOHLCDTO;
import com.bc.project_stock_data.dto.StockProfileDTO;
import com.bc.project_stock_data.dto.UpsertDailyOhlcReq;
import com.bc.project_stock_data.entity.StockEntity;
import com.bc.project_stock_data.entity.StockOHLCEntity;
import com.bc.project_stock_data.mapper.DtoMapper;
import com.bc.project_stock_data.repository.StockOHLCRepository;
import com.bc.project_stock_data.repository.StockProfileRepository;
import com.bc.project_stock_data.repository.StockRepository;
import jakarta.transaction.Transactional;

@Service
public class StockService {
  @Autowired
  StockRepository stockRepository;
  @Autowired
  StockProfileRepository stockProfileRepository;
  @Autowired
  StockOHLCRepository stockOHLCRepository;
  @Autowired
  DtoMapper dtoMapper;
  @Autowired
  RestTemplate restTemplate;

  @Value("${live-data.base-url}")
  private String liveDataBaseUrl;

  private static final ZoneId US_MARKET = ZoneId.of("America/New_York");

  public List<StockEntity> getAllStock() {
    return this.stockRepository.findAll();
  }

  public List<StockProfileDTO> getAllProfiles() {
    return this.stockProfileRepository.findAllWithStock().stream()
        .map(e -> this.dtoMapper.toProfileDto(e)).toList();
  }

  public List<StockOHLCDTO> getHistoricalOhlc(String symbol, int years) {
    String normalizedSymbol = symbol.toUpperCase();
    LocalDate fromDate = LocalDate.now().minusYears(years);

    return this.stockOHLCRepository
        .findByStockEntity_SymbolAndTradeDateGreaterThanEqualOrderByTradeDateAsc(
            normalizedSymbol, fromDate)
        .stream().map(e -> StockOHLCDTO.builder() //
            .tradeDate(e.getTradeDate()) //
            .open(e.getOpen()) //
            .high(e.getHigh()) //
            .low(e.getLow()) //
            .close(e.getClose()) //
            .build())
        .toList();
  }

  public StockProfileDTO getProfileBySymbol(String symbol) {
    return stockProfileRepository.findByStockEntity_Symbol(symbol.toUpperCase())
        .map(e -> this.dtoMapper.toProfileDto(e)).orElse(null);
  }

  @Transactional
  public void upsertDailyOhlc(String symbol, UpsertDailyOhlcReq request) {
    String normalized = symbol.toUpperCase();
    LocalDate tradeDate =
        request.getTradeDate() != null ? request.getTradeDate()
            : LocalDate.now(US_MARKET);

    StockEntity stock = stockRepository.findBySymbol(normalized) //
        .orElseThrow(() -> new IllegalArgumentException(
            "Unknown symbol: " + normalized));

    Optional<StockOHLCEntity> existing = stockOHLCRepository
        .findByStockEntity_SymbolAndTradeDate(normalized, tradeDate);
    if (existing.isPresent()) {
      StockOHLCEntity row = existing.get();
      row.setOpen(request.getOpen());
      row.setHigh(request.getHigh());
      row.setLow(request.getLow());
      row.setClose(request.getClose());
      stockOHLCRepository.save(row);
      return;
    }

    stockOHLCRepository.save(StockOHLCEntity.builder() //
        .stockEntity(stock) //
        .tradeDate(tradeDate) //
        .open(request.getOpen()) //
        .high(request.getHigh()) //
        .low(request.getLow()) //
        .close(request.getClose()) //
        .volume(0L) //
        .build());
  }

  public List<CompanyNewsDTO> getCompanyNews(String symbol) {
    String url = liveDataBaseUrl + "/api/liveData/stocks/"
        + URLEncoder.encode(symbol.toUpperCase(), StandardCharsets.UTF_8)
        + "/news";
    CompanyNewsDTO[] articles =
        restTemplate.getForObject(url, CompanyNewsDTO[].class);
    return articles != null ? List.of(articles) : List.of();
  }
}
