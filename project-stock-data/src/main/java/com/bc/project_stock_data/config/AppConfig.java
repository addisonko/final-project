package com.bc.project_stock_data.config;

import java.util.Collections;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.client.RestTemplate;

@Configuration
public class AppConfig {
  @Bean
  RestTemplate restTemplate() {
    RestTemplate restTemplate = new RestTemplate();

    HttpHeaders headers = new HttpHeaders();
    headers.set(HttpHeaders.USER_AGENT, "Mozilla/5.0");
    headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));

    restTemplate.getInterceptors().add((request, body, execution) -> {
      request.getHeaders().addAll(headers);
      return execution.execute(request, body);
    });

    return restTemplate;
  }

}
