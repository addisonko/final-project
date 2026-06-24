package com.bc.project_stock_data.repository;

import java.time.LocalDate;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.bc.project_stock_data.entity.StockOHLCEntity;

@Repository
public interface StockOHLCRepository
    extends JpaRepository<StockOHLCEntity, Long> {
  List<StockOHLCEntity> findByStockEntity_SymbolAndTradeDateGreaterThanEqualOrderByTradeDateAsc(
      String symbol, LocalDate fromDate);
}
