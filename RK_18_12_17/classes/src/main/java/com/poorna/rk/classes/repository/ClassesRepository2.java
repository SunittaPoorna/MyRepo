/**
 * 
 */
package com.poorna.rk.classes.repository;

import java.util.Collection;

import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.poorna.rk.classes.domain.ClassesTimeTable;

/**
 * @author SunittaT
 *
 */

public interface ClassesRepository2 extends MongoRepository<ClassesTimeTable, Long> {
	

	//Notifications findByEmployeeId(Long employeeId);
	Collection<ClassesTimeTable> findAll(Query query);
}
