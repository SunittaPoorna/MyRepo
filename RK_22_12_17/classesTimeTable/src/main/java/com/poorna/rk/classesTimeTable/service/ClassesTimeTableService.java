/**
 * 
 */
package com.poorna.rk.classesTimeTable.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.poorna.rk.classesTimeTable.domain.ClassesTimeTable;
import com.poorna.rk.classesTimeTable.repository.ClassesRepository2;




/**
 * @author SunittaT
 *
 */
@SpringBootApplication
public class ClassesTimeTableService {
	
	@Autowired
	ClassesRepository2 classesRepository;
	

	public ClassesTimeTable addNew(ClassesTimeTable classesTT) {
		
		classesRepository.save(classesTT);
		return classesTT;
	}

	public List<ClassesTimeTable> getTimeTable() {
		List<ClassesTimeTable> classesTT = new ArrayList<>();
		classesRepository.findAll()
		.forEach(classesTT::add);
		return classesTT;
	}

	public void updateTimeTable(ClassesTimeTable classesTT, Long siNo) {
		classesRepository.save(classesTT);	
		
	}

	public void deleteTimeTable(Long siNo) {
		classesRepository.delete(siNo);
		
	}
	

	}
	

