/**
 * 
 */
package com.poorna.rk.academic.repository;

import java.util.Collection;

import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.poorna.rk.academic.domain.Academics;

/**
 * @author SunittaT
 *
 */

public interface AcademicsRepository extends MongoRepository<Academics, String> {
	

	//Notifications findByEmployeeId(Long employeeId);
	Collection<Academics> findAll(Query query);
}
