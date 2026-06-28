package com.bc.project_stock_data.dto;

import java.math.BigDecimal;
import java.time.LocalDate;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UpsertDailyOhlcReq {
  private LocalDate tradeDate;
  private BigDecimal open;
  private BigDecimal high;
  private BigDecimal low;
  private BigDecimal close;
}
