/**
 * 
 */
package com.poorna.rk.vehicle.domain;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @author SunittaT
 *
 */
@Document(collection = "vehicles")
public class Vehicles {
	@Id
	private Long siNo;
	private String id;
	private String registrationNo;
	private String vehicleNo;
	private String vehicleType;
	private String status;
	
	public Vehicles()
	{}
	public Vehicles(Long siNo,String id, String registrationNo, String vehicleNo, String vehicleType, String status) {
		super();
		this.siNo=siNo;
		this.id = id;
		this.registrationNo = registrationNo;
		this.vehicleNo = vehicleNo;
		this.vehicleType = vehicleType;
		this.status = status;
	}
	
	public Long getSiNo() {
		return siNo;
	}
	public void setSiNo(Long siNo) {
		this.siNo = siNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRegistrationNo() {
		return registrationNo;
	}
	public void setRegistrationNo(String registrationNo) {
		this.registrationNo = registrationNo;
	}
	public String getVehicleNo() {
		return vehicleNo;
	}
	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}
	public String getVehicleType() {
		return vehicleType;
	}
	public void setVehicleType(String vehicleType) {
		this.vehicleType = vehicleType;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
    
	
	
}
