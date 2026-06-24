package com.bc.project_data_provider.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class LiveQuoteDTO {
  private String symbol;
  private Double currentPrice;
  private Double change;
  private Double percentChange;
  private Double highPrice;
  private Double lowPrice;
  private Double openPrice;
  private Double prevClosePrice;
  private Long tradeVolume;  
}
