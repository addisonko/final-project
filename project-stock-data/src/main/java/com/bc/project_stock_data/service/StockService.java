package com.bc.project_stock_data.service;

import java.time.LocalDate;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.bc.project_stock_data.dto.StockOHLCDTO;
import com.bc.project_stock_data.dto.StockProfileDTO;
import com.bc.project_stock_data.entity.StockEntity;
import com.bc.project_stock_data.mapper.DtoMapper;
import com.bc.project_stock_data.repository.StockOHLCRepository;
import com.bc.project_stock_data.repository.StockProfileRepository;
import com.bc.project_stock_data.repository.StockRepository;

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

  public List<StockEntity> getAllStock() {
    return this.stockRepository.findAll();
  }

  public List<StockProfileDTO> getAllProfiles() {
    return this.stockProfileRepository.findAll().stream()
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
    return stockProfileRepository
        .findByStockEntity_Symbol(symbol.toUpperCase())
        .map(e -> this.dtoMapper.toProfileDto(e))
        .orElse(null);
  }
}
