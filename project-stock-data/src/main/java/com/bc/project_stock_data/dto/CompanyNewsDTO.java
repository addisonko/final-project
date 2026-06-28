package com.bc.project_stock_data.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Builder
public class CompanyNewsDTO {
  private String category;
  private Long datetime;
  private String headline;
  private Long id;
  private String image;
  private String related;
  private String source;
  private String summary;
  private String url;

}
