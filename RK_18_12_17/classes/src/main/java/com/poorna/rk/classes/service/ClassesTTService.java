/**
 * 
 */
package com.poorna.rk.classes.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.poorna.rk.classes.domain.Classes;
import com.poorna.rk.classes.domain.ClassesTimeTable;
import com.poorna.rk.classes.repository.ClassesRepository;
import com.poorna.rk.classes.repository.ClassesRepository2;




/**
 * @author SunittaT
 *
 */
@SpringBootApplication
public class ClassesTTService {
	
	@Autowired
	ClassesRepository2 studentsRepository;
	

	public ClassesTimeTable addNew(ClassesTimeTable classesTT) {
		
		studentsRepository.save(classesTT);
		return classesTT;
	}

	public List<ClassesTimeTable> getTimeTable() {
		List<ClassesTimeTable> classesTT = new ArrayList<>();
		studentsRepository.findAll()
		.forEach(classesTT::add);
		return classesTT;
	}

	public void updateTimeTable(ClassesTimeTable classesTT, Long siNo) {
		studentsRepository.save(classesTT);	
		
	}
	

	}
	

