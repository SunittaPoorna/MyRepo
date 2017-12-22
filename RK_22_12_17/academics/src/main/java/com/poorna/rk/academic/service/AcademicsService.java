/**
 * 
 */
package com.poorna.rk.academic.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.poorna.rk.academic.domain.Academics;
import com.poorna.rk.academic.repository.AcademicsRepository;




/**
 * @author SunittaT
 *
 */
@SpringBootApplication
public class AcademicsService {
	
	@Autowired
	AcademicsRepository academicsRepository;
	

	public Academics addNew(Academics academics) {
		
		academicsRepository.save(academics);
		return academics;
	}

	public List<Academics> getAcademics() {
		List<Academics> academics = new ArrayList<>();
		academicsRepository.findAll()
		.forEach(academics::add);
		return academics;
	}
	public void updateAcademics(Academics academics, String id) {
		academicsRepository.save(academics);	
		
		
	}
	
	public void deleteAcademics(String id) {
			academicsRepository.delete(id);
	}
	

	}
	

