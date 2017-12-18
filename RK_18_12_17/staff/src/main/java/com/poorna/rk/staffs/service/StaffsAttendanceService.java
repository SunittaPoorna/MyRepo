/**
 * 
 */
package com.poorna.rk.staffs.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.poorna.rk.staffs.domain.Staffs;
import com.poorna.rk.staffs.domain.StaffsAttendance;
import com.poorna.rk.staffs.repository.StaffsRepository;
import com.poorna.rk.staffs.repository.StaffsRepository2;




/**
 * @author SunittaT
 *
 */
@SpringBootApplication
public class StaffsAttendanceService {
	
	@Autowired
	StaffsRepository2 staffsRepository;
	

	public StaffsAttendance addNew(StaffsAttendance staff) {
		
		staffsRepository.save(staff);
		return staff;
	}

	public List<StaffsAttendance> getstaffAttendance() {
		List<StaffsAttendance> staff = new ArrayList<>();
		staffsRepository.findAll()
		.forEach(staff::add);
		return staff;
	}

	public void updatestaffAttendance(StaffsAttendance staff, Long siNo) {
		staffsRepository.save(staff);	
		
	}
	

	}
	

