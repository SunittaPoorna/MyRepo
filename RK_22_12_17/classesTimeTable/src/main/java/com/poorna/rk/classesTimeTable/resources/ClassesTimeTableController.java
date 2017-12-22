/**
 * 
 */
package com.poorna.rk.classesTimeTable.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.poorna.rk.classesTimeTable.domain.ClassesTimeTable;
import com.poorna.rk.classesTimeTable.service.ClassesTimeTableService;





/**
 * @author SunittaT
 *
 */

@RestController
public class ClassesTimeTableController {
	
	@Autowired
	ClassesTimeTableService classesTimeTableService;
	
//All staffs attendance
	@RequestMapping("/classes/timetable")	
	public List<ClassesTimeTable> listTimeTable()
	{

      return classesTimeTableService.getTimeTable();

	}
	//New staffs attendance
	@RequestMapping(value = "/classes/timetable", method = RequestMethod.POST)
	public ClassesTimeTable newTimeTable(@RequestBody ClassesTimeTable timeTable){
		classesTimeTableService.addNew(timeTable);
		return timeTable;
	}
//Update staffs
		
	@RequestMapping(value = "/classes/timetable/{siNo}",method = RequestMethod.PUT)
	public void updateTimeTable(@RequestBody ClassesTimeTable timeTable,@PathVariable Long siNo)
	{
		classesTimeTableService.updateTimeTable(timeTable,siNo);

	}
		
	@RequestMapping(value = "/classes/timetable/{siNo}",method = RequestMethod.DELETE)
	public void deleteTimeTable(@PathVariable Long siNo)
	{
		classesTimeTableService.deleteTimeTable(siNo);

	}
	
}
