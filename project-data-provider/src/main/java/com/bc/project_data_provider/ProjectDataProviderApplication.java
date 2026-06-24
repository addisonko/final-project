package com.bc.project_data_provider;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class ProjectDataProviderApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectDataProviderApplication.class, args);
	}

}
