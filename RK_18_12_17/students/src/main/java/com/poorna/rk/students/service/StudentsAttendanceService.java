/**
 * 
 */
package com.poorna.rk.students.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.poorna.rk.students.domain.Students;
import com.poorna.rk.students.domain.StudentsAttendance;
import com.poorna.rk.students.repository.StudentsRepository;
import com.poorna.rk.students.repository.StudentsRepository2;




/**
 * @author SunittaT
 *
 */
@SpringBootApplication
public class StudentsAttendanceService {
	
	@Autowired
	StudentsRepository2 studentsRepository;
	

	public StudentsAttendance addNew(StudentsAttendance students) {
		
		studentsRepository.save(students);
		return students;
	}

	public List<StudentsAttendance> getStdAttendance() {
		List<StudentsAttendance> students = new ArrayList<>();
		studentsRepository.findAll()
		.forEach(students::add);
		return students;
	}

	public void updateAttendance(StudentsAttendance students, Long siNo) {
		studentsRepository.save(students);	
		
	}
	

	}
	

