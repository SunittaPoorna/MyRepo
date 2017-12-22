/**
 * 
 */
package com.poorna.rk.StaffReports.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.poorna.rk.StaffReports.domain.StaffReports;
import com.poorna.rk.StaffReports.service.StaffService;





/**
 * @author SunittaT
 *
 */

@RestController
public class StaffController {
	
	@Autowired
	StaffService staffService;
	
//All staffs attendance
	@RequestMapping("/staffsreports")	
	public List<StaffReports> listAttendance()
	{

      return staffService.getStaffAttendance();

	}

	@RequestMapping(value = "/staffsreports/{siNo}")
	public void getSingleAttendance(@PathVariable Long siNo)
	{
		staffService.SingleAttendance(siNo);

	}
	@RequestMapping(value = "/staffsreports/{siNo}",method = RequestMethod.DELETE)
	public void deleteStaffReports(@PathVariable Long siNo)
	{
		staffService.deleteStaffReports(siNo);

	}

	
	
}
