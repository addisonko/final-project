package com.bc.project_data_provider.dto;

import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Builder
public class LastRefreshDTO {
  private LocalDateTime lastRefreshTime;
  
}
