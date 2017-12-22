/**
 * 
 */
package com.poorna.rk.studentsAttendence.repository;

import java.util.Collection;

import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.poorna.rk.studentsAttendence.domain.StudentsAttendance;

/**
 * @author SunittaT
 *
 */

public interface StudentsRepository2 extends MongoRepository<StudentsAttendance, Long> {
	

	//Notifications findByEmployeeId(Long employeeId);
	Collection<StudentsAttendance> findAll(Query query);
}
