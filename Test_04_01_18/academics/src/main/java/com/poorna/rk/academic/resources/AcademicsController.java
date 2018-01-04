/**
 * 
 */
package com.poorna.rk.academic.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.poorna.rk.academic.domain.Academics;
import com.poorna.rk.academic.service.AcademicsService;





/**
 * @author SunittaT
 *
 */

@RestController
public class AcademicsController {
	
	@Autowired
	AcademicsService academicsService;
	
//All Academics
	@RequestMapping("/academics")	
	public List<Academics> listAcademics()
	{

      return academicsService.getAcademics();

	}
	//New Academics
	@RequestMapping(value = "/academics", method = RequestMethod.POST)
	public Academics newAcademics(@RequestBody Academics academics){
		academicsService.addNew(academics);
		return academics;
	}
//Update academic
		
	@RequestMapping(value = "/academics/{id}",method = RequestMethod.PUT)
	public void updateAcademics(@RequestBody Academics academics,@PathVariable String id)
	{
		academicsService.updateAcademics(academics,id);

	}
	//delete academic	
	@RequestMapping(value = "/academics/{id}",method = RequestMethod.DELETE)
	public void deleteAcademics(@PathVariable String id)
	{
		academicsService.deleteAcademics(id);

	}
		
	
	
}
