package com.poorna.rk.studentsReports;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class StudentsReportsApplication {

	public static void main(String[] args) {
		SpringApplication.run(StudentsReportsApplication.class, args);
	}
}
