/**
 * 
 */
package com.poorna.rk.staffs.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.poorna.rk.staffs.domain.Staffs;
import com.poorna.rk.staffs.repository.StaffsRepository;




/**
 * @author SunittaT
 *
 */
@SpringBootApplication
public class StaffsService {
	
	@Autowired
	StaffsRepository staffsRepository;
	

	public Staffs addNew(Staffs staff) {
		
		staffsRepository.save(staff);
		return staff;
	}

	public List<Staffs> getstaff() {
		List<Staffs> staff = new ArrayList<>();
		staffsRepository.findAll()
		.forEach(staff::add);
		return staff;
	}
	public void updatestaff(Staffs staff, Long siNo) {
		staffsRepository.save(staff);	
		
		
	}

	public void deletestaff(Long siNo) {
		staffsRepository.delete(siNo);
		
	}
	

	}
	

