package com.bc.project_data_provider.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class FinnhubDto {
  @JsonProperty(value = "c")
  private Double currentPrice;
  @JsonProperty(value = "d")
  private Double change;
  @JsonProperty(value = "dp")
  private Double percentChange;
  @JsonProperty(value = "h")
  private Double highPrice;
  @JsonProperty(value = "l")
  private Double lowPrice;
  @JsonProperty(value = "o")
  private Double openPrice;
  @JsonProperty(value = "pc")
  private Double prevClosePrice;
  @JsonProperty(value = "t")
  private Long tradeVolume;  
}
