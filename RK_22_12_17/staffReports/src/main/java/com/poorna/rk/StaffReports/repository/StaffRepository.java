/**
 * 
 */
package com.poorna.rk.StaffReports.repository;

import java.util.Collection;

import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.poorna.rk.StaffReports.domain.StaffReports;

/**
 * @author SunittaT
 *
 */

public interface StaffRepository extends MongoRepository<StaffReports, Long> {
	

	//Notifications findByEmployeeId(Long employeeId);
	Collection<StaffReports> findAll(Query query);
}
