/**
 * 
 */
package com.poorna.rk.studentsReports.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.poorna.rk.studentsReports.domain.StudentsReports;
import com.poorna.rk.studentsReports.service.StudentsService;





/**
 * @author SunittaT
 *
 */

@RestController
public class StudentsController {
	
	@Autowired
	StudentsService studentsService;
	
//All StudentsReports
	@RequestMapping("/studentsreports/{classSection}")	
	public List<StudentsReports> listStudents()
	{

      return studentsService.getStudents();

	}
//Single StudentsReports
		
	@RequestMapping(value = "/studentsreports/{siNo}")
	public List<StudentsReports> listSingleStudents(@PathVariable Long siNo)
	{

      return studentsService.getSingleStudents(siNo);

	}
	
	
	@RequestMapping(value = "/studentsreports/{siNo}",method = RequestMethod.DELETE)
	public void deleteStudentsReports(@PathVariable Long siNo)
	{
		studentsService.deleteStudentsReports(siNo);

	}

}
