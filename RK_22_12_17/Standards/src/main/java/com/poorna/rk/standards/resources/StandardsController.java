/**
 * 
 */
package com.poorna.rk.standards.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.poorna.rk.standards.domain.Standards;
import com.poorna.rk.standards.service.StandardsService;





/**
 * @author SunittaT
 *
 */

@RestController
public class StandardsController {
	
	@Autowired
	StandardsService standardsService;
	
//All Standards
	@RequestMapping("/standards")	
	public List<Standards> listStandards()
	{

      return standardsService.getStandards();

	}
	//New Standards
	@RequestMapping(value = "/standards", method = RequestMethod.POST)
	public Standards newStandards(@RequestBody Standards standards){
		standardsService.addNew(standards);
		return standards;
	}
//Update vehicle
		
	@RequestMapping(value = "/standards/{siNo}",method = RequestMethod.PUT)
	public void updateStandards(@RequestBody Standards standards,@PathVariable Long siNo)
	{
		standardsService.updateStandards(standards,siNo);

	}
	//delete vehicle
	
		@RequestMapping(value = "/standards/{siNo}",method = RequestMethod.DELETE)
		public void deleteStandards(@PathVariable Long siNo)
		{
			standardsService.deleteStandards(siNo);

		}	
	
	
}
