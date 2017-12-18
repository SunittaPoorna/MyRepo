/**
 * 
 */
package com.poorna.rk.staffs.repository;

import java.util.Collection;

import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.poorna.rk.staffs.domain.StaffsAttendance;

/**
 * @author SunittaT
 *
 */

public interface StaffsRepository2 extends MongoRepository<StaffsAttendance, Long> {
	

	//Notifications findByEmployeeId(Long employeeId);
	Collection<StaffsAttendance> findAll(Query query);
}
