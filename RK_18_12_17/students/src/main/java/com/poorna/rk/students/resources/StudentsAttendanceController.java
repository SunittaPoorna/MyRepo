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
import com.poorna.rk.students.domain.StudentsAttendance;
import com.poorna.rk.students.service.StudentsAttendanceService;
import com.poorna.rk.students.service.StudentsService;





/**
 * @author SunittaT
 *
 */

@RestController
public class StudentsAttendanceController {
	
	@Autowired
	StudentsAttendanceService studentsAttendanceService;
	
//All staffs attendance
	@RequestMapping("/students/attendance")	
	public List<StudentsAttendance> listAttendance()
	{

      return studentsAttendanceService.getStdAttendance();

	}
	//New staffs attendance
	@RequestMapping(value = "/students/attendance", method = RequestMethod.POST)
	public StudentsAttendance newAttendance(@RequestBody StudentsAttendance students){
		studentsAttendanceService.addNew(students);
		return students;
	}
//Update staffs
		
	@RequestMapping(value = "/students/attendance/{siNo}",method = RequestMethod.PUT)
	public void updateAttendance(@RequestBody StudentsAttendance students,@PathVariable Long siNo)
	{
		studentsAttendanceService.updateAttendance(students,siNo);

	}
		
	
	
}
