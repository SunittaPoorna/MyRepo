/**
 * 
 */
package com.poorna.rk.classes.domain;

import java.util.Date;

import org.apache.tomcat.jni.Time;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @author SunittaT
 *
 */
@Document(collection = "classesTimeTable")
public class ClassesTimeTable {
	@Id
	
	private Long siNo;
	private String standard;
	private String timeTable;
	private Date status;
	
	public ClassesTimeTable()
	{}
	public ClassesTimeTable(Long siNo, String standard, String timeTable, Date status) {
		super();
		this.siNo = siNo;
		this.standard = standard;
		this.timeTable = timeTable;
		this.status = status;
	}
	public Long getSiNo() {
		return siNo;
	}
	public void setSiNo(Long siNo) {
		this.siNo = siNo;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getTimeTable() {
		return timeTable;
	}
	public void setTimeTable(String timeTable) {
		this.timeTable = timeTable;
	}
	public Date getStatus() {
		return status;
	}
	public void setStatus(Date status) {
		this.status = status;
	}
	
	
	}
