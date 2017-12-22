/**
 * 
 */
package com.poorna.rk.studentsReports.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.poorna.rk.studentsReports.domain.StudentsReports;
import com.poorna.rk.studentsReports.repository.StudentsRepository;




/**
 * @author SunittaT
 *
 */
@SpringBootApplication
public class StudentsService {
	
	@Autowired
	StudentsRepository studentsRepository;

	public List<StudentsReports> getStudents() {
		List<StudentsReports> studentsReports = new ArrayList<>();
		studentsRepository.findAll()
		.forEach(studentsReports::add);
		return studentsReports;
	}
	public List<StudentsReports> getSingleStudents(Long siNo) {
		List<StudentsReports> studentsReports = new ArrayList<>();
		studentsRepository.findAll()
		.forEach(studentsReports::add);
		return studentsReports;
		
	}
	public void deleteStudentsReports(Long siNo) {
		studentsRepository.delete(siNo);
		
	}
	

	}
	

