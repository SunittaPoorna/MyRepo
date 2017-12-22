/**
 * 
 */
package com.poorna.rk.StaffReports.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.poorna.rk.StaffReports.domain.StaffReports;
import com.poorna.rk.StaffReports.repository.StaffRepository;




/**
 * @author SunittaT
 *
 */
@SpringBootApplication
public class StaffService {
	
	@Autowired
	StaffRepository staffRepository;
	


	public List<StaffReports> getStaffAttendance() {
		List<StaffReports> staff = new ArrayList<>();
		staffRepository.findAll()
		.forEach(staff::add);
		return staff;
	}

	public List<StaffReports> SingleAttendance(Long siNo) {
		List<StaffReports> staff = new ArrayList<>();
		staffRepository.findAll()
		.forEach(staff::add);
		return staff;
		
	}

	public void deleteStaffReports(Long siNo) {
		
		staffRepository.delete(siNo);
	}
	

	}
	

