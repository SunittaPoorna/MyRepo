/**
 * 
 */
package com.poorna.rk.classesTimeTable.repository;

import java.util.Collection;

import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.repository.MongoRepository;

import com.poorna.rk.classesTimeTable.domain.ClassesTimeTable;

/**
 * @author SunittaT
 *
 */

public interface ClassesRepository2 extends MongoRepository<ClassesTimeTable, Long> {
	

	//Notifications findByEmployeeId(Long employeeId);
	Collection<ClassesTimeTable> findAll(Query query);
}
