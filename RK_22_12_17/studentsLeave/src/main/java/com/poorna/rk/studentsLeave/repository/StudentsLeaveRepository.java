/**
 * 
 */
package com.poorna.rk.studentsLeave.repository;

import java.util.Collection;

import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.poorna.rk.studentsLeave.domain.StudentsLeave;

/**
 * @author SunittaT
 *
 */

public interface StudentsLeaveRepository extends MongoRepository<StudentsLeave, Long> {
	

	//Notifications findByEmployeeId(Long employeeId);
	Collection<StudentsLeave> findAll(Query query);
}
