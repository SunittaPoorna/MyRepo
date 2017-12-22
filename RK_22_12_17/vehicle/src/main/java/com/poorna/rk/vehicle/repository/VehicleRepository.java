/**
 * 
 */
package com.poorna.rk.vehicle.repository;

import java.util.Collection;

import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.poorna.rk.vehicle.domain.Vehicles;

/**
 * @author SunittaT
 *
 */

public interface VehicleRepository extends MongoRepository<Vehicles, Long> {
	

	//Notifications findByEmployeeId(Long employeeId);
	Collection<Vehicles> findAll(Query query);
}
