/**
 * 
 */
package com.poorna.rk.studentsLeave.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.poorna.rk.studentsLeave.domain.StudentsLeave;
import com.poorna.rk.studentsLeave.repository.StudentsLeaveRepository;




/**
 * @author SunittaT
 *
 */
@SpringBootApplication
public class StudentsLeaveService {
	
	@Autowired
	StudentsLeaveRepository studentsLeaveRepository;
	

	public StudentsLeave addNew(StudentsLeave studentsLeave) {
		
		studentsLeaveRepository.save(studentsLeave);
		return studentsLeave;
	}

	public List<StudentsLeave> getStudentsLeave() {
		List<StudentsLeave> studentsLeave = new ArrayList<>();
		studentsLeaveRepository.findAll()
		.forEach(studentsLeave::add);
		return studentsLeave;
	}
	public void updateStudentsLeave(StudentsLeave studentsLeave, Long siNo) {
		studentsLeaveRepository.save(studentsLeave);	
		
		
	}

	public void deleteStudentsLeave(Long siNo) {
		studentsLeaveRepository.delete(siNo);
		
	}
	

	}
	

