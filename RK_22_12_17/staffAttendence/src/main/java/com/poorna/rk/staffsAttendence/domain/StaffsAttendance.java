/**
 * 
 */
package com.poorna.rk.staffsAttendence.domain;

import java.util.Date;

import org.apache.tomcat.jni.Time;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @author SunittaT
 *
 */
@Document(collection = "StaffAttendance")
public class StaffsAttendance {
	@Id
	private Long siNo;
	private String firstName;
	private String lastName;
	private String designation;
	private Date date;
	private String log;
	private Time time;
	private String attendance;
	
	public StaffsAttendance()
	{}
	public StaffsAttendance(Long siNo, String firstName, String lastName, String designation, Date date, String log,
			Time time, String attendance) {
		super();
		this.siNo = siNo;
		this.firstName = firstName;
		this.lastName = lastName;
		this.designation = designation;
		this.date = date;
		this.log = log;
		this.time = time;
		this.attendance = attendance;
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
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getLog() {
		return log;
	}
	public void setLog(String log) {
		this.log = log;
	}
	public Time getTime() {
		return time;
	}
	public void setTime(Time time) {
		this.time = time;
	}
	public String getAttendance() {
		return attendance;
	}
	public void setAttendance(String attendance) {
		this.attendance = attendance;
	}
	
	
	}
