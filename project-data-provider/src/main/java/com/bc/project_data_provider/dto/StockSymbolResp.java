package com.bc.project_data_provider.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class StockSymbolResp {
  private Long id;
  private String symbol;
  private String name;
  
}
