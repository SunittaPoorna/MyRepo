/**
 * 
 */
package com.poorna.rk.sections.repository;

import java.util.Collection;

import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.poorna.rk.sections.domain.Sections;

/**
 * @author SunittaT
 *
 */

public interface SectionsRepository extends MongoRepository<Sections, Long> {
	

	//Notifications findByEmployeeId(Long employeeId);
	Collection<Sections> findAll(Query query);
}
