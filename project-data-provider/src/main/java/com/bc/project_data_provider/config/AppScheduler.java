package com.bc.project_data_provider.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import com.bc.project_data_provider.service.LiveDataService;

@Component
public class AppScheduler {
  @Autowired
  private LiveDataService liveDataService;

  private static final Logger log = LoggerFactory.getLogger(AppScheduler.class);

  @Scheduled(cron = "0 30 09 * * MON-FRI",
      zone = "${live.quote.timezone:America/New_York}")
  public void marketOpenRefresh() {
    liveDataService.refreshAllQuotes();
  }

  @Scheduled(cron = "0 00 13 * * MON-FRI",
      zone = "${live.quote.timezone:America/New_York}")
  public void marketMidDayRefresh() {
    liveDataService.refreshAllQuotes();
  }

  @Scheduled(cron = "0 00 16 * * MON-FRI",
      zone = "${live.quote.timezone:America/New_York}")
  public void marketCloseRefresh() {
    liveDataService.refreshAllQuotes();
  }
}
