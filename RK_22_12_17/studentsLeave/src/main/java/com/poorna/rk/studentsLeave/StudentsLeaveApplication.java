package com.poorna.rk.studentsLeave;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class StudentsLeaveApplication {

	public static void main(String[] args) {
		SpringApplication.run(StudentsLeaveApplication.class, args);
	}
}
