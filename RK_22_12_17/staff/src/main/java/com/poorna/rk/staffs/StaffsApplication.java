package com.poorna.rk.staffs;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class StaffsApplication {

	public static void main(String[] args) {
		SpringApplication.run(StaffsApplication.class, args);
	}
}
