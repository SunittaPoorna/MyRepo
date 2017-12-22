/**
 * 
 */
package com.poorna.rk.Notifications.repository;

import java.util.Collection;

import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.poorna.rk.Notifications.domain.Notifications;

/**
 * @author SunittaT
 *
 */

public interface NotificationsRepository extends MongoRepository<Notifications, Long> {
	

	//Notifications findByEmployeeId(Long employeeId);
	Collection<Notifications> findAll(Query query);
}
