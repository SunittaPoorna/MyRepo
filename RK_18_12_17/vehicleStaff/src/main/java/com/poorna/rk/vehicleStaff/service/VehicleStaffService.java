/**
 * 
 */
package com.poorna.rk.vehicleStaff.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.poorna.rk.vehicleStaff.domain.VehiclesStaff;
import com.poorna.rk.vehicleStaff.repository.VehicleStaffRepository;




/**
 * @author SunittaT
 *
 */
@SpringBootApplication
public class VehicleStaffService {
	
	@Autowired
	VehicleStaffRepository vehicleStaffRepository;
	

	public VehiclesStaff addNew(VehiclesStaff vehicle) {
		
		vehicleStaffRepository.save(vehicle);
		return vehicle;
	}

	

	public void updateVehicleStaff(VehiclesStaff vehicleStaff, Long siNo) {
		vehicleStaffRepository.save(vehicleStaff);	
		
	}

	public List<VehiclesStaff> getVehiclesStaff() {
		List<VehiclesStaff> vehiclesStaff = new ArrayList<>();
		vehicleStaffRepository.findAll()
		.forEach(vehiclesStaff::add);
		return vehiclesStaff;
	}



	}
	

