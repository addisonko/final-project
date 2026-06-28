package com.bc.project_data_provider.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public class CompanyNewsDto {
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
