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
import com.poorna.rk.classes.service.ClassesService;





/**
 * @author SunittaT
 *
 */

@RestController
public class ClassesController {
	
	@Autowired
	ClassesService classesService;
	
//All Classes
	@RequestMapping("/classes")	
	public List<Classes> listStudents()
	{

      return classesService.getClasses();

	}
	//New Classes
	@RequestMapping(value = "/classes", method = RequestMethod.POST)
	public Classes newClass(@RequestBody Classes classes){
		classesService.addNew(classes);
		return classes;
	}
//Update Classes
		
	@RequestMapping(value = "/classes/{id}",method = RequestMethod.PUT)
	public void updateClasses(@RequestBody Classes classes,@PathVariable String id)
	{
		classesService.updateClasses(classes,id);

	}
		
	//delete classes
	@RequestMapping(value = "/classes/{id}",method = RequestMethod.DELETE)
	public void deleteClasses(@PathVariable String id)
	{
		classesService.deleteClasses(id);

	}
	
	
	
}
