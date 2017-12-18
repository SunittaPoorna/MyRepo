/**
 * 
 */
package com.poorna.rk.students.domain;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @author SunittaT
 *
 */
@Document(collection = "students")
public class Students {
	@Id
	private String id;
	private Long admissionNo;
	private String name;
	private String classSection;
	private String inTime;
	private String outTime;
	private String fatherName;
	private String fatherEmail;
	private Long fatherPphoneNo;
	private String motherName;
	private String motherEmail;
	private Long motherPphoneNo;
	private String guardianName;
	private String guardianEmail;
	private Long guardianPphoneNo;
	private String photo;
	private String status;
	
	public Students() {}
	
	public Students(String id, Long admissionNo, String name, String classSection, String inTime, String outTime,
			String fatherName, String fatherEmail, Long fatherPphoneNo, String motherName, String motherEmail,
			Long motherPphoneNo, String guardianName, String guardianEmail, Long guardianPphoneNo, String photo,
			String status) {
		super();
		this.id = id;
		this.admissionNo = admissionNo;
		this.name = name;
		this.classSection = classSection;
		this.inTime = inTime;
		this.outTime = outTime;
		this.fatherName = fatherName;
		this.fatherEmail = fatherEmail;
		this.fatherPphoneNo = fatherPphoneNo;
		this.motherName = motherName;
		this.motherEmail = motherEmail;
		this.motherPphoneNo = motherPphoneNo;
		this.guardianName = guardianName;
		this.guardianEmail = guardianEmail;
		this.guardianPphoneNo = guardianPphoneNo;
		this.photo = photo;
		this.status = status;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Long getAdmissionNo() {
		return admissionNo;
	}
	public void setAdmissionNo(Long admissionNo) {
		this.admissionNo = admissionNo;
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
	public String getInTime() {
		return inTime;
	}
	public void setInTime(String inTime) {
		this.inTime = inTime;
	}
	public String getOutTime() {
		return outTime;
	}
	public void setOutTime(String outTime) {
		this.outTime = outTime;
	}
	public String getFatherName() {
		return fatherName;
	}
	public void setFatherName(String fatherName) {
		this.fatherName = fatherName;
	}
	public String getFatherEmail() {
		return fatherEmail;
	}
	public void setFatherEmail(String fatherEmail) {
		this.fatherEmail = fatherEmail;
	}
	public Long getFatherPphoneNo() {
		return fatherPphoneNo;
	}
	public void setFatherPphoneNo(Long fatherPphoneNo) {
		this.fatherPphoneNo = fatherPphoneNo;
	}
	public String getMotherName() {
		return motherName;
	}
	public void setMotherName(String motherName) {
		this.motherName = motherName;
	}
	public String getMotherEmail() {
		return motherEmail;
	}
	public void setMotherEmail(String motherEmail) {
		this.motherEmail = motherEmail;
	}
	public Long getMotherPphoneNo() {
		return motherPphoneNo;
	}
	public void setMotherPphoneNo(Long motherPphoneNo) {
		this.motherPphoneNo = motherPphoneNo;
	}
	public String getGuardianName() {
		return guardianName;
	}
	public void setGuardianName(String guardianName) {
		this.guardianName = guardianName;
	}
	public String getGuardianEmail() {
		return guardianEmail;
	}
	public void setGuardianEmail(String guardianEmail) {
		this.guardianEmail = guardianEmail;
	}
	public Long getGuardianPphoneNo() {
		return guardianPphoneNo;
	}
	public void setGuardianPphoneNo(Long guardianPphoneNo) {
		this.guardianPphoneNo = guardianPphoneNo;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	 
	

	
	
}
