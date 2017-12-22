/**
 * 
 */
package com.poorna.rk.designations.repository;

import java.util.Collection;

import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.poorna.rk.designations.domain.Designations;

/**
 * @author SunittaT
 *
 */

public interface DesignationsRepository extends MongoRepository<Designations, Long> {
	

	//Notifications findByEmployeeId(Long employeeId);
	Collection<Designations> findAll(Query query);
}
