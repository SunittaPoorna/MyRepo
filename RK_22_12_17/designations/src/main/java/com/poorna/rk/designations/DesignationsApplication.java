package com.poorna.rk.designations;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class DesignationsApplication {

	public static void main(String[] args) {
		SpringApplication.run(DesignationsApplication.class, args);
	}
}
