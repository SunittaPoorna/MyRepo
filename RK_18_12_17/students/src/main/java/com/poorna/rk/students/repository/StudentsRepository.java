/**
 * 
 */
package com.poorna.rk.students.repository;

import java.util.Collection;

import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.poorna.rk.students.domain.Students;

/**
 * @author SunittaT
 *
 */

public interface StudentsRepository extends MongoRepository<Students, Long> {
	

	//Notifications findByEmployeeId(Long employeeId);
	Collection<Students> findAll(Query query);
}
