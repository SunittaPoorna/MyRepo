/**
 * 
 */
package com.poorna.rk.classes.repository;

import java.util.Collection;

import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.poorna.rk.classes.domain.Classes;

/**
 * @author SunittaT
 *
 */

public interface ClassesRepository extends MongoRepository<Classes, String> {
	

	//Notifications findByEmployeeId(Long employeeId);
	Collection<Classes> findAll(Query query);
}
