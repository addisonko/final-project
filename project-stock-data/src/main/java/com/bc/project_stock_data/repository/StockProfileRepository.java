package com.bc.project_stock_data.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.bc.project_stock_data.entity.StockProfileEntity;

@Repository
public interface StockProfileRepository extends JpaRepository<StockProfileEntity, Long> {

  Optional<StockProfileEntity> findByStockEntity_Symbol(String symbol);

}
