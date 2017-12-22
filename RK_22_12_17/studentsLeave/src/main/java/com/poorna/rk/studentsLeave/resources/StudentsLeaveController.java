/**
 * 
 */
package com.poorna.rk.studentsLeave.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.poorna.rk.studentsLeave.domain.StudentsLeave;
import com.poorna.rk.studentsLeave.service.StudentsLeaveService;





/**
 * @author SunittaT
 *
 */

@RestController
public class StudentsLeaveController {
	
	@Autowired
	StudentsLeaveService studentsLeaveService;
	
//All StudentsLeave
	@RequestMapping("/studentsleave")	
	public List<StudentsLeave> listStudentsLeave()
	{

      return studentsLeaveService.getStudentsLeave();

	}
	//New StudentsLeave
	@RequestMapping(value = "/studentsleave", method = RequestMethod.POST)
	public StudentsLeave newStudentsLeave(@RequestBody StudentsLeave studentsLeave){
		studentsLeaveService.addNew(studentsLeave);
		return studentsLeave;
	}
//Update StudentsLeave
		
	@RequestMapping(value = "/studentsleave/{siNo}",method = RequestMethod.PUT)
	public void updateStudentsLeave(@RequestBody StudentsLeave studentsLeave,@PathVariable Long siNo)
	{
		studentsLeaveService.updateStudentsLeave(studentsLeave,siNo);

	}
	//delete StudentsLeave
	
		@RequestMapping(value = "/studentsleave/{siNo}",method = RequestMethod.DELETE)
		public void deleteStudentsLeave(@PathVariable Long siNo)
		{
			studentsLeaveService.deleteStudentsLeave(siNo);

		}
		
	
	
}
