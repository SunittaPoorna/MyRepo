/**
 * 
 */
package com.poorna.rk.standards.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.poorna.rk.standards.domain.Standards;
import com.poorna.rk.standards.repository.StandardsRepository;




/**
 * @author SunittaT
 *
 */
@SpringBootApplication
public class StandardsService {
	
	@Autowired
	StandardsRepository standardsRepository;
	

	public Standards addNew(Standards standards) {
		
		standardsRepository.save(standards);
		return standards;
	}

	public List<Standards> getStandards() {
		List<Standards> standards = new ArrayList<>();
		standardsRepository.findAll()
		.forEach(standards::add);
		return standards;
	}
	public void updateStandards(Standards standards, Long siNo) {
		standardsRepository.save(standards);	
		
		
	}

	public void deleteStandards(Long siNo) {
		standardsRepository.delete(siNo);
		
	}
	

	}
	

