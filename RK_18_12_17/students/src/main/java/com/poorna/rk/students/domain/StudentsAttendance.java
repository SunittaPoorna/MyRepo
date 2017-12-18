/**
 * 
 */
package com.poorna.rk.students.domain;

import java.util.Date;

import org.apache.tomcat.jni.Time;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @author SunittaT
 *
 */
@Document(collection = "studentsAttendance")
public class StudentsAttendance {
	@Id
	private String id;
	private Long siNo;
	private String name;
	private String classSection;
	private Date date;
	private String log;
	private Time time;
	private String attendance;
	private String remarks;
	
	public StudentsAttendance()
	{}
	
	public StudentsAttendance(String id, Long siNo, String name, String classSection, Date date, String log, Time time,
			String attendance, String remarks) {
		super();
		this.id = id;
		this.siNo = siNo;
		this.name = name;
		this.classSection = classSection;
		this.date = date;
		this.log = log;
		this.time = time;
		this.attendance = attendance;
		this.remarks = remarks;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Long getSiNo() {
		return siNo;
	}
	public void setSiNo(Long siNo) {
		this.siNo = siNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getClassSection() {
		return classSection;
	}
	public void setClassSection(String classSection) {
		this.classSection = classSection;
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
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	
	
	}
