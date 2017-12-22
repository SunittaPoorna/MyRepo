/**
 * 
 */
package com.poorna.rk.designations.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.poorna.rk.designations.domain.Designations;
import com.poorna.rk.designations.repository.DesignationsRepository;




/**
 * @author SunittaT
 *
 */
@SpringBootApplication
public class DesignationsService {
	
	@Autowired
	DesignationsRepository designationsRepository;
	

	public Designations addNew(Designations designations) {
		
		designationsRepository.save(designations);
		return designations;
	}

	public List<Designations> getDesignations() {
		List<Designations> designations = new ArrayList<>();
		designationsRepository.findAll()
		.forEach(designations::add);
		return designations;
	}
	public void updateDesignations(Designations designations, Long siNo) {
		designationsRepository.save(designations);	
		
		
	}

	public void deleteDesignations(Long siNo) {
		designationsRepository.delete(siNo);
		
	}
	

	}
	

