package com.bc.project_stock_data.entity;

import java.math.BigDecimal;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "stock_profiles")
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Getter
public class StockProfileEntity {
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column(nullable = false)
  private String industry;
  @Column(name = "market_cap", nullable = false)
  private BigDecimal marketCap;
  private String logo;
  @Column(name = "company_name", nullable = false)
  private String companyName;
  @Column(nullable = false)
  private BigDecimal shares;

  @OneToOne
  @JoinColumn(name = "stock_id", nullable = false)
  @Setter
  private StockEntity stockEntity;
  
}
