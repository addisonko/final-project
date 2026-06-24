package com.bc.project_stock_data.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.bc.project_stock_data.dto.StockOHLCDTO;
import com.bc.project_stock_data.dto.StockProfileDTO;
import com.bc.project_stock_data.entity.StockEntity;
import com.bc.project_stock_data.service.StockService;

@RestController
@RequestMapping("/api/stocks")
public class StockController {
  @Autowired
  private StockService stockService;

  @GetMapping("/symbols")
  public List<StockEntity> getAllStocks() {
    return this.stockService.getAllStock();
  }

  @GetMapping("/profiles")
  public List<StockProfileDTO> getAllProfiles() {
    return this.stockService.getAllProfiles();
  }

  @GetMapping("/{symbol}/ohlc")
  public List<StockOHLCDTO> getHistoricalOhlc(@PathVariable String symbol,
      @RequestParam(defaultValue = "10") int years) {
    return this.stockService.getHistoricalOhlc(symbol, years);
  }

  @GetMapping("/{symbol}/profile")
  public StockProfileDTO getProfile(@PathVariable String symbol) {
    return stockService.getProfileBySymbol(symbol);
  }
}
