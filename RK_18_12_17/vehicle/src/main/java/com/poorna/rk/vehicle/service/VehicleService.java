/**
 * 
 */
package com.poorna.rk.vehicle.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.poorna.rk.vehicle.domain.Vehicles;
import com.poorna.rk.vehicle.repository.VehicleRepository;




/**
 * @author SunittaT
 *
 */
@SpringBootApplication
public class VehicleService {
	
	@Autowired
	VehicleRepository vehicleRepository;
	

	public Vehicles addNew(Vehicles vehicle) {
		
		vehicleRepository.save(vehicle);
		return vehicle;
	}

	public List<Vehicles> getVehicles() {
		List<Vehicles> vehicles = new ArrayList<>();
		vehicleRepository.findAll()
		.forEach(vehicles::add);
		return vehicles;
	}
	public void updateVehicle(Vehicles vehicles, Long siNo) {
		vehicleRepository.save(vehicles);	
		
		
	}
	

	}
	

