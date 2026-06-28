package com.bc.project_stock_data.entity;

import java.math.BigDecimal;
import java.time.LocalDate;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import jakarta.persistence.UniqueConstraint;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(
  name = "stock_ohlc_data", 
  uniqueConstraints = @UniqueConstraint(
    name = "us_stock_ohlc_stock_id_trade_date",
    columnNames = {"stock_id", "trade_date"}))
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
@Setter
public class StockOHLCEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(name = "trade_date", nullable = false)
  private LocalDate tradeDate;
  @Column(precision = 10, scale = 4, nullable = false)
  private BigDecimal open;
  @Column(precision = 10, scale = 4, nullable = false)
  private BigDecimal high;
  @Column(precision = 10, scale = 4, nullable = false)
  private BigDecimal low;
  @Column(precision = 10, scale = 4, nullable = false)
  private BigDecimal close;
  @Column(nullable = false)
  private Long volume;

  @ManyToOne
  @JoinColumn(name = "stock_id", nullable = false)
  @Setter
  private StockEntity stockEntity;
  
}
