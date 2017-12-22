/**
 * 
 */
package com.poorna.rk.studentsAttendence.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.poorna.rk.studentsAttendence.domain.StudentsAttendance;
import com.poorna.rk.studentsAttendence.repository.StudentsRepository2;




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

	public void deleteAttendance(Long siNo) {
		studentsRepository.delete(siNo);
		
	}
	

	}
	

