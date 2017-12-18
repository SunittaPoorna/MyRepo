/**
 * 
 */
package com.poorna.rk.classes.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.poorna.rk.classes.domain.Classes;
import com.poorna.rk.classes.domain.ClassesTimeTable;
import com.poorna.rk.classes.service.ClassesTTService;
import com.poorna.rk.classes.service.ClassesService;





/**
 * @author SunittaT
 *
 */

@RestController
public class ClassesTTController {
	
	@Autowired
	ClassesTTService classesTTService;
	
//All staffs attendance
	@RequestMapping("/classes/timetable")	
	public List<ClassesTimeTable> listTimeTable()
	{

      return classesTTService.getTimeTable();

	}
	//New staffs attendance
	@RequestMapping(value = "/classes/timetable", method = RequestMethod.POST)
	public ClassesTimeTable newTimeTable(@RequestBody ClassesTimeTable timeTable){
		classesTTService.addNew(timeTable);
		return timeTable;
	}
//Update staffs
		
	@RequestMapping(value = "/classes/timetable/{siNo}",method = RequestMethod.PUT)
	public void updateTimeTable(@RequestBody ClassesTimeTable timeTable,@PathVariable Long siNo)
	{
		classesTTService.updateTimeTable(timeTable,siNo);

	}
		
	
	
}
