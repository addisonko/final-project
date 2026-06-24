package com.bc.project_data_provider.mapper;

import org.springframework.stereotype.Component;
import com.bc.project_data_provider.dto.LiveQuoteDTO;
import com.bc.project_data_provider.model.FinnhubDto;

@Component
public class DtoMapper {

  public LiveQuoteDTO map(String symbol, FinnhubDto stockQuoteDto) {
    return LiveQuoteDTO.builder()
        .symbol(symbol)
        .currentPrice(stockQuoteDto.getCurrentPrice())
        .change(stockQuoteDto.getChange())
        .percentChange(stockQuoteDto.getPercentChange())
        .highPrice(stockQuoteDto.getHighPrice())
        .lowPrice(stockQuoteDto.getLowPrice())
        .openPrice(stockQuoteDto.getOpenPrice())
        .prevClosePrice(stockQuoteDto.getPrevClosePrice())
        .tradeVolume(stockQuoteDto.getTradeVolume())
        .build();
  }
}
