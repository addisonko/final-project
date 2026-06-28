package com.bc.project_data_provider.config;

import java.util.concurrent.atomic.AtomicBoolean;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import com.bc.project_data_provider.service.LiveDataService;

@Component
public class AppScheduler {
  @Autowired
  private LiveDataService liveDataService;

  private static final Logger log = LoggerFactory.getLogger(AppScheduler.class);
  private final AtomicBoolean nightlyLoopRunning = new AtomicBoolean(false);

  @Scheduled(cron = "0 30 09 * * MON-FRI",
      zone = "${live.quote.timezone:America/New_York}")
  public void scheduledRefresh() {
    this.startLoopIfNotRunning("cron trigger");
  }

  /** If app restarts mid-window (e.g. 11 PM), resume the loop. */
  @EventListener(ApplicationReadyEvent.class)
  public void onStartup() {
    startLoopIfNotRunning("startup");
  }

  private void startLoopIfNotRunning(String reason) {
    if (!this.liveDataService.isInNightlyWindow()) {
      return;
    }
    if (!nightlyLoopRunning.compareAndSet(false, true)) {
      log.info("Nightly refresh loop already running " + reason);
      return;
    }

    Thread.startVirtualThread(() -> {
      try {
        log.info("Nightly refresh loop started " + reason);
        liveDataService.runRefreshLoopUntilWindowEnd();
      } finally {
        nightlyLoopRunning.set(false);
        log.info("Nightly refresh loop finished " + reason);
      }
    });
  }

}
