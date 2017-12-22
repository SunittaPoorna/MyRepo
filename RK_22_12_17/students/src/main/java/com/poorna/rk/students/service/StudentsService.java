/**
 * 
 */
package com.poorna.rk.students.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.poorna.rk.students.domain.Students;
import com.poorna.rk.students.repository.StudentsRepository;




/**
 * @author SunittaT
 *
 */
@SpringBootApplication
public class StudentsService {
	
	@Autowired
	StudentsRepository studentsRepository;
	

	public Students addNew(Students students) {
		
		studentsRepository.save(students);
		return students;
	}

	public List<Students> getStudents() {
		List<Students> students = new ArrayList<>();
		studentsRepository.findAll()
		.forEach(students::add);
		return students;
	}
	public void updateStudents(Students students, Long siNo) {
		studentsRepository.save(students);	
		
		
	}

	public void deleteStudents(Long siNo) {
		studentsRepository.delete(siNo);
	}
	

	}
	

