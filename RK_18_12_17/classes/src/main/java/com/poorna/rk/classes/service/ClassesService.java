/**
 * 
 */
package com.poorna.rk.classes.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.poorna.rk.classes.domain.Classes;
import com.poorna.rk.classes.repository.ClassesRepository;




/**
 * @author SunittaT
 *
 */
@SpringBootApplication
public class ClassesService {
	
	@Autowired
	ClassesRepository classesRepository;
	

	public Classes addNew(Classes classes) {
		
		classesRepository.save(classes);
		return classes;
	}

	public List<Classes> getClasses() {
		List<Classes> classes = new ArrayList<>();
		classesRepository.findAll()
		.forEach(classes::add);
		return classes;
	}
	public void updateClasses(Classes classes, Long siNo) {
		classesRepository.save(classes);	
		
		
	}
	

	}
	

