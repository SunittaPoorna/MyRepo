package com.poorna.rk.vehicleStaff;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication
@EnableEurekaClient
public class VehicleStaffApplication {

	public static void main(String[] args) {
		SpringApplication.run(VehicleStaffApplication.class, args);
	}
}
