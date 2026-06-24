package com.bc.project_stock_data.dto;

import java.math.BigDecimal;
import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class StockProfileDTO {
  private String symbol;
  private String name;
  private String industry;
  private BigDecimal marketCap;
  private String companyName;
  private String logo;
}
