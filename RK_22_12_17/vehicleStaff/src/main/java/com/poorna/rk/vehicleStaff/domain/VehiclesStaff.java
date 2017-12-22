/**
 * 
 */
package com.poorna.rk.vehicleStaff.domain;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @author SunittaT
 *
 */
@Document(collection = "vehicleStaff")
public class VehiclesStaff {
	@Id
	private Long siNo;
	private String id;
	private String vehicleNo;
	private String staffName;
	private String travelType;
	private Date assignDate;
	private String status;
	
	public VehiclesStaff()
	{}
	public VehiclesStaff(Long siNo,String id, String vehicleNo, String staffName, String travelType,Date assignDate, String status) {
		super();
		this.siNo=siNo;
		this.id = id;
		this.vehicleNo = vehicleNo;
		this.staffName = staffName;
		this.travelType = travelType;
		this.assignDate = assignDate;
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
	public String getVehicleNo() {
		return vehicleNo;
	}
	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}
	public String getTravelType() {
		return travelType;
	}
	public void setTravelType(String travelType) {
		this.travelType = travelType;
	}
	public Date getAssignDate() {
		return assignDate;
	}
	public void setAssignDate(Date assignDate) {
		this.assignDate = assignDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
