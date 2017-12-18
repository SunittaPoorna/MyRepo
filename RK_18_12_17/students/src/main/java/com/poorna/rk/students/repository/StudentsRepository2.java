/**
 * 
 */
package com.poorna.rk.students.repository;

import java.util.Collection;

import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.poorna.rk.students.domain.StudentsAttendance;

/**
 * @author SunittaT
 *
 */

public interface StudentsRepository2 extends MongoRepository<StudentsAttendance, Long> {
	

	//Notifications findByEmployeeId(Long employeeId);
	Collection<StudentsAttendance> findAll(Query query);
}
