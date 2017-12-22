package com.poorna.rk.staffsAttendence;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class StaffsAttendanceApp {

	public static void main(String[] args) {
		SpringApplication.run(StaffsAttendanceApp.class, args);
	}
}
