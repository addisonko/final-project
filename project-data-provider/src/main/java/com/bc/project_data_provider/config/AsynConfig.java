package com.bc.project_data_provider.config;

import java.util.concurrent.Executor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.concurrent.ThreadPoolTaskExecutor;

@Configuration
@EnableAsync
public class AsynConfig {

  @Bean(name = "databaseWriteExecutor")
  public Executor databaseWriteExecutor() {
    ThreadPoolTaskExecutor executor = new ThreadPoolTaskExecutor();
    executor.setCorePoolSize(5);
    executor.setMaxPoolSize(10);
    executor.setQueueCapacity(600);
    executor.setThreadNamePrefix("db-write-");
    executor.initialize();
    return executor;
  }

}
