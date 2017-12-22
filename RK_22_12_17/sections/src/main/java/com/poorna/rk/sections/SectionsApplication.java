package com.poorna.rk.sections;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class SectionsApplication {

	public static void main(String[] args) {
		SpringApplication.run(SectionsApplication.class, args);
	}
}
