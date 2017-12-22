/**
 * 
 */
package com.poorna.rk.studentsAttendence.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.poorna.rk.studentsAttendence.domain.StudentsAttendance;
import com.poorna.rk.studentsAttendence.service.StudentsAttendanceService;






/**
 * @author SunittaT
 *
 */

@RestController
public class StudentsAttendanceController {
	
	@Autowired
	StudentsAttendanceService studentsAttendanceService;
	
//All students attendance
	@RequestMapping("/students/attendance")	
	public List<StudentsAttendance> listAttendance()
	{

      return studentsAttendanceService.getStdAttendance();

	}
	//New students attendance
	@RequestMapping(value = "/students/attendance", method = RequestMethod.POST)
	public StudentsAttendance newAttendance(@RequestBody StudentsAttendance students){
		studentsAttendanceService.addNew(students);
		return students;
	}
//Update students
		
	@RequestMapping(value = "/students/attendance/{siNo}",method = RequestMethod.PUT)
	public void updateAttendance(@RequestBody StudentsAttendance students,@PathVariable Long siNo)
	{
		studentsAttendanceService.updateAttendance(students,siNo);

	}
	//delete students
	
		@RequestMapping(value = "/students/attendance/{siNo}",method = RequestMethod.DELETE)
		public void deleteAttendance(@PathVariable Long siNo)
		{
			studentsAttendanceService.deleteAttendance(siNo);

		}	
	
	
}
