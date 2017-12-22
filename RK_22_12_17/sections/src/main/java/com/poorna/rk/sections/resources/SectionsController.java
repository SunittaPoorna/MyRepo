/**
 * 
 */
package com.poorna.rk.sections.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.poorna.rk.sections.domain.Sections;
import com.poorna.rk.sections.service.SectionsService;





/**
 * @author SunittaT
 *
 */

@RestController
public class SectionsController {
	
	@Autowired
	SectionsService sectionsService;
	
//All Sections
	@RequestMapping("/sections")	
	public List<Sections> listSections()
	{

      return sectionsService.getSections();

	}
	//New Sections
	@RequestMapping(value = "/sections", method = RequestMethod.POST)
	public Sections newSections(@RequestBody Sections sections){
		sectionsService.addNew(sections);
		return sections;
	}
//Update Section
		
	@RequestMapping(value = "/sections/{siNo}",method = RequestMethod.PUT)
	public void updateSections(@RequestBody Sections sections,@PathVariable Long siNo)
	{
		sectionsService.updateSections(sections,siNo);

	}
		
	
	//Delete Section
	
		@RequestMapping(value = "/sections/{siNo}",method = RequestMethod.DELETE)
		public void deleteSections(@PathVariable Long siNo)
		{
			sectionsService.deleteSections(siNo);

		}
			
	
	
}
