package com.poorna.rk.studentsAttendence;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class StudentsAttendanceApp {

	public static void main(String[] args) {
		SpringApplication.run(StudentsAttendanceApp.class, args);
	}
}
