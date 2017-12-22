/**
 * 
 */
package com.poorna.rk.classesTimeTable.domain;

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
	private String status;
	
	public ClassesTimeTable()
	{}
	public ClassesTimeTable(Long siNo, String standard, String timeTable, String status) {
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	}
