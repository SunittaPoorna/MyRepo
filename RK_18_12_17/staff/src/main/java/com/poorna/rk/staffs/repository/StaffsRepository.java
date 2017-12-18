/**
 * 
 */
package com.poorna.rk.staffs.repository;

import java.util.Collection;

import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.poorna.rk.staffs.domain.Staffs;

/**
 * @author SunittaT
 *
 */

public interface StaffsRepository extends MongoRepository<Staffs, Long> {
	

	//Notifications findByEmployeeId(Long employeeId);
	Collection<Staffs> findAll(Query query);
}
