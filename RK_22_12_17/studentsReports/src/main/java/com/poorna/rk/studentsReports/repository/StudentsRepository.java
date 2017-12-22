/**
 * 
 */
package com.poorna.rk.studentsReports.repository;

import java.util.Collection;

import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.poorna.rk.studentsReports.domain.StudentsReports;

/**
 * @author SunittaT
 *
 */

public interface StudentsRepository extends MongoRepository<StudentsReports, Long> {
	

	//Notifications findByEmployeeId(Long employeeId);
	Collection<StudentsReports> findAll(Query query);
}
