/**
 * 
 */
package com.poorna.rk.vehicleStaff.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.poorna.rk.vehicleStaff.domain.VehiclesStaff;
import com.poorna.rk.vehicleStaff.service.VehicleStaffService;





/**
 * @author SunittaT
 *
 */

@RestController
public class VehicleStaffController {
	
	@Autowired
	VehicleStaffService vehicleStaffService;
	
//All VehiclesStaff
	@RequestMapping("/vehiclesstaff")	
	public List<VehiclesStaff> listVehiclesStaff()
	{

      return vehicleStaffService.getVehiclesStaff();

	}
	//New VehiclesStaff
	@RequestMapping(value = "/vehiclesstaff", method = RequestMethod.POST)
	public VehiclesStaff newVehicleStaff(@RequestBody VehiclesStaff vehicleStaff){
		vehicleStaffService.addNew(vehicleStaff);
		return vehicleStaff;
	}
//Update vehicle
		
	@RequestMapping(value = "/vehiclesstaff/{siNo}",method = RequestMethod.PUT)
	public void updateVehicleStaff(@RequestBody VehiclesStaff vehicleStaff,@PathVariable Long siNo)
	{
		vehicleStaffService.updateVehicleStaff(vehicleStaff,siNo);

	}
		
	
	
}
