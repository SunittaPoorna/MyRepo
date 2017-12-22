/**
 * 
 */
package com.poorna.rk.designations.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.poorna.rk.designations.domain.Designations;
import com.poorna.rk.designations.service.DesignationsService;





/**
 * @author SunittaT
 *
 */

@RestController
public class DesignationsController {
	
	@Autowired
	DesignationsService designationsService;
	
//All Designations
	@RequestMapping("/designations")	
	public List<Designations> listDesignations()
	{

      return designationsService.getDesignations();

	}
	//New Designations
	@RequestMapping(value = "/designations", method = RequestMethod.POST)
	public Designations newDesignations(@RequestBody Designations designations){
		designationsService.addNew(designations);
		return designations;
	}
//Update vehicle
		
	@RequestMapping(value = "/designations/{siNo}",method = RequestMethod.PUT)
	public void updateDesignations(@RequestBody Designations designations,@PathVariable Long siNo)
	{
		designationsService.updateDesignations(designations,siNo);

	}
	
	//delete vehicle
	
		@RequestMapping(value = "/designations/{siNo}",method = RequestMethod.DELETE)
		public void deleteDesignations(@PathVariable Long siNo)
		{
			designationsService.deleteDesignations(siNo);

		}
		
	
	
}
