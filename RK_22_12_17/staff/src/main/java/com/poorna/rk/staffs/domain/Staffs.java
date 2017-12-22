/**
 * 
 */
package com.poorna.rk.staffs.domain;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @author SunittaT
 *
 */
@Document(collection = "StaffDetails")
public class Staffs {
	@Id
	private Long siNo;
	private String firstName;
	private String lastName;
	private String staffCode;
	private String designation;
	private String userName;
	private String email;
	private String address;
	private Long phoneNo;
	private String status;
	
	public Staffs()
	{}
	public Staffs(Long siNo, String firstName, String lastName, String staffCode, String designation, String userName,
			String email, String address, Long phoneNo, String status) {
		super();
		this.siNo = siNo;
		this.firstName = firstName;
		this.lastName = lastName;
		this.staffCode = staffCode;
		this.designation = designation;
		this.userName = userName;
		this.email = email;
		this.address = address;
		this.phoneNo = phoneNo;
		this.status = status;
	}
	public Long getSiNo() {
		return siNo;
	}
	public void setSiNo(Long siNo) {
		this.siNo = siNo;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getStaffCode() {
		return staffCode;
	}
	public void setStaffCode(String staffCode) {
		this.staffCode = staffCode;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Long getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(Long phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
         
	
	
}
