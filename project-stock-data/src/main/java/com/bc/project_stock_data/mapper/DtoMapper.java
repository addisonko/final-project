package com.bc.project_stock_data.mapper;

import org.springframework.stereotype.Component;
import com.bc.project_stock_data.dto.StockProfileDTO;
import com.bc.project_stock_data.entity.StockEntity;
import com.bc.project_stock_data.entity.StockProfileEntity;

@Component
public class DtoMapper {

  public StockProfileDTO toProfileDto(StockProfileEntity profile) {
    StockEntity stock = profile.getStockEntity();
    return StockProfileDTO.builder()
        .symbol(stock.getSymbol())
        .name(stock.getName())
        .industry(profile.getIndustry())
        .marketCap(profile.getMarketCap())
        .companyName(profile.getCompanyName())
        .logo(profile.getLogo())
        .build();
  } 
}
