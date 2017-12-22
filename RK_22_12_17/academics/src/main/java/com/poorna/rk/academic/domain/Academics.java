/**
 * 
 */
package com.poorna.rk.academic.domain;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @author SunittaT
 *
 */
@Document(collection = "academics")
public class Academics {
	@Id
	private String id;
	private String academicYear;
	private String startDate;
	private String endDate;
	private String workingDays;
	private String status;
	
	public Academics()
	{}
	public Academics(String id, String academicYear, String startDate, String endDate, String workingDays,
			String status) {
		super();
		this.id = id;
		this.academicYear = academicYear;
		this.startDate = startDate;
		this.endDate = endDate;
		this.workingDays = workingDays;
		this.status = status;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAcademicYear() {
		return academicYear;
	}
	public void setAcademicYear(String academicYear) {
		this.academicYear = academicYear;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getWorkingDays() {
		return workingDays;
	}
	public void setWorkingDays(String workingDays) {
		this.workingDays = workingDays;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
