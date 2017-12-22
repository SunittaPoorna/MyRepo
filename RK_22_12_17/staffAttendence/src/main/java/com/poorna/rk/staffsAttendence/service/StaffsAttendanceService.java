/**
 * 
 */
package com.poorna.rk.staffsAttendence.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.poorna.rk.staffsAttendence.domain.StaffsAttendance;
import com.poorna.rk.staffsAttendence.repository.StaffsRepository2;




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

	public void deleteStaffAttendance(Long siNo) {
		staffsRepository.delete(siNo);
		
	}
	

	}
	

