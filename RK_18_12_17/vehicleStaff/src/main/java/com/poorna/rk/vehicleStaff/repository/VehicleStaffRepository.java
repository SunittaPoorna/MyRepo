/**
 * 
 */
package com.poorna.rk.vehicleStaff.repository;

import java.util.Collection;

import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.poorna.rk.vehicleStaff.domain.VehiclesStaff;

/**
 * @author SunittaT
 *
 */

public interface VehicleStaffRepository extends MongoRepository<VehiclesStaff, Long> {
	

	//Notifications findByEmployeeId(Long employeeId);
	Collection<VehiclesStaff> findAll(Query query);
}
