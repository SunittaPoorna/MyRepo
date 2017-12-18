/**
 * 
 */
package com.poorna.rk.staffs.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.poorna.rk.staffs.domain.Staffs;
import com.poorna.rk.staffs.service.StaffsService;





/**
 * @author SunittaT
 *
 */

@RestController
public class StaffsController {
	
	@Autowired
	StaffsService staffsService;
	
//All staffs
	@RequestMapping("/staffs")	
	public List<Staffs> listStaffs()
	{

      return staffsService.getstaff();

	}
	//New staffs
	@RequestMapping(value = "/staffs", method = RequestMethod.POST)
	public Staffs newStaffs(@RequestBody Staffs staff){
		staffsService.addNew(staff);
		return staff;
	}
//Update staffs
		
	@RequestMapping(value = "/staffs/{siNo}",method = RequestMethod.PUT)
	public void updatestaff(@RequestBody Staffs staff,@PathVariable Long siNo)
	{
		staffsService.updatestaff(staff,siNo);

	}
		
	
	
}
