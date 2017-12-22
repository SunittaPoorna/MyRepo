/**
 * 
 */
package com.poorna.rk.students.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.poorna.rk.students.domain.Students;
import com.poorna.rk.students.service.StudentsService;





/**
 * @author SunittaT
 *
 */

@RestController
public class StudentsController {
	
	@Autowired
	StudentsService studentsService;
	
//All Students
	@RequestMapping("/students")	
	public List<Students> listStudents()
	{

      return studentsService.getStudents();

	}
	//New Students
	@RequestMapping(value = "/students", method = RequestMethod.POST)
	public Students newStudents(@RequestBody Students students){
		studentsService.addNew(students);
		return students;
	}
//Update Students
		
	@RequestMapping(value = "/students/{siNo}",method = RequestMethod.PUT)
	public void updateStudents(@RequestBody Students students,@PathVariable Long siNo)
	{
		studentsService.updateStudents(students,siNo);

	}
		
	
	//delete Students
	
		@RequestMapping(value = "/students/{siNo}",method = RequestMethod.DELETE)
		public void deleteStudents(@PathVariable Long siNo)
		{
			studentsService.deleteStudents(siNo);

		}
			
}
