/**
 * 
 */
package com.poorna.rk.Events.repository;

import java.util.Collection;

import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.poorna.rk.Events.domain.Events;

/**
 * @author SunittaT
 *
 */

public interface EventsRepository extends MongoRepository<Events, Long> {
	

	//Events findByEmployeeId(Long employeeId);
	Collection<Events> findAll(Query query);
}
