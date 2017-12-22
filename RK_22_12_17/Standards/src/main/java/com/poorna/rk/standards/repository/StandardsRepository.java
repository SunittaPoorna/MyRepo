/**
 * 
 */
package com.poorna.rk.standards.repository;

import java.util.Collection;

import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.poorna.rk.standards.domain.Standards;

/**
 * @author SunittaT
 *
 */

public interface StandardsRepository extends MongoRepository<Standards, Long> {
	

	//Notifications findByEmployeeId(Long employeeId);
	Collection<Standards> findAll(Query query);
}
