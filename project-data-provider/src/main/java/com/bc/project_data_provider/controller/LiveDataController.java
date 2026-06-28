package com.bc.project_data_provider.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.bc.project_data_provider.dto.CompanyNewsDTO;
import com.bc.project_data_provider.dto.LastRefreshDTO;
import com.bc.project_data_provider.dto.LiveQuoteDTO;
import com.bc.project_data_provider.service.LiveDataService;

@RestController
@RequestMapping("/api/liveData")
public class LiveDataController {
  @Autowired
  private LiveDataService liveDataService;

  @GetMapping("/symbols")
  public List<String> getAllSymbols() {
    return this.liveDataService.getAllSymbolsFromStockDataApp();
  }

  @GetMapping("/quotes")
  public List<LiveQuoteDTO> getLiveData(@RequestParam List<String> symbols) {
    return this.liveDataService.getQuotesForSymbols(symbols);
  }

  @GetMapping("/quotes/all")
  public List<LiveQuoteDTO> getAllQuotes() {
    return this.liveDataService.getAllCachedQuotes();
  }

  @GetMapping("/quotes/lastRefresh")
  public LastRefreshDTO getLastRefresh() {
    return liveDataService.getLastRefreshTime();
  }

  @GetMapping("/stocks/{symbol}/news")
  public List<CompanyNewsDTO> getCompanyNews(@PathVariable String symbol) {
    return liveDataService.fetchCompanyNews(symbol);
  }
}
