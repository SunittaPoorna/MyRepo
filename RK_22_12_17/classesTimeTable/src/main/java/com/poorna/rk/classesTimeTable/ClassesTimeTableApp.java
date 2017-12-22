package com.poorna.rk.classesTimeTable;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class ClassesTimeTableApp {

	public static void main(String[] args) {
		SpringApplication.run(ClassesTimeTableApp.class, args);
	}
}
