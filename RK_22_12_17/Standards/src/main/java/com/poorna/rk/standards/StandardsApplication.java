package com.poorna.rk.standards;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class StandardsApplication {

	public static void main(String[] args) {
		SpringApplication.run(StandardsApplication.class, args);
	}
}
