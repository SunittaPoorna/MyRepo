/**
 * 
 */
package com.poorna.rk.vehicle.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.poorna.rk.vehicle.domain.Vehicles;
import com.poorna.rk.vehicle.service.VehicleService;





/**
 * @author SunittaT
 *
 */

@RestController
public class VehicleController {
	
	@Autowired
	VehicleService vehicleService;
	
//All Vehicles
	@RequestMapping("/vehicles")	
	public List<Vehicles> listVehicles()
	{

      return vehicleService.getVehicles();

	}
	//New Vehicles
	@RequestMapping(value = "/vehicles", method = RequestMethod.POST)
	public Vehicles newVehicle(@RequestBody Vehicles vehicle){
		vehicleService.addNew(vehicle);
		return vehicle;
	}
//Update vehicle
		
	@RequestMapping(value = "/vehicles/{siNo}",method = RequestMethod.PUT)
	public void updateVehicle(@RequestBody Vehicles vehicle,@PathVariable Long siNo)
	{
		vehicleService.updateVehicle(vehicle,siNo);

	}
		
	//delete vehicle
	
		@RequestMapping(value = "/vehicles/{siNo}",method = RequestMethod.DELETE)
		public void deleteVehicle(@PathVariable Long siNo)
		{
			vehicleService.deleteVehicle(siNo);

		}
			
	
	
}
