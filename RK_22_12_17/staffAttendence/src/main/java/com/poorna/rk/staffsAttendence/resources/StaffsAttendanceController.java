/**
 * 
 */
package com.poorna.rk.staffsAttendence.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.poorna.rk.staffsAttendence.domain.StaffsAttendance;
import com.poorna.rk.staffsAttendence.service.StaffsAttendanceService;





/**
 * @author SunittaT
 *
 */

@RestController
public class StaffsAttendanceController {
	
	@Autowired
	StaffsAttendanceService staffsAttendanceService;
	
//All staffs attendance
	@RequestMapping("/staffs/attendance")	
	public List<StaffsAttendance> listAttendance()
	{

      return staffsAttendanceService.getstaffAttendance();

	}
	//New staffs attendance
	@RequestMapping(value = "/staffs/attendance", method = RequestMethod.POST)
	public StaffsAttendance newAttendance(@RequestBody StaffsAttendance staff){
		staffsAttendanceService.addNew(staff);
		return staff;
	}
//Update staffs
		
	@RequestMapping(value = "/staffs/attendance/{siNo}",method = RequestMethod.PUT)
	public void updateAttendance(@RequestBody StaffsAttendance staff,@PathVariable Long siNo)
	{
		staffsAttendanceService.updatestaffAttendance(staff,siNo);

	}
		
	//delete staffs
	
		@RequestMapping(value = "/staffs/attendance/{siNo}",method = RequestMethod.DELETE)
		public void deleteAttendance(@PathVariable Long siNo)
		{
			staffsAttendanceService.deleteStaffAttendance(siNo);

		}
			
	
}
