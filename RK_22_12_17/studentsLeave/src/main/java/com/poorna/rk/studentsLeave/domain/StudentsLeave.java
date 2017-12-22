/**
 * 
 */
package com.poorna.rk.studentsLeave.domain;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @author SunittaT
 *
 */
@Document(collection = "studentsLeave")
public class StudentsLeave {
	@Id
	private Long siNo;
	private String admissionNo;
	private String name;
	private String standard;
	private String heading;
	private String reason;
	private String details;
	private String fromDate;
	private String toDate;
	private String approval;
	
	public StudentsLeave()
	{}
	public StudentsLeave(Long siNo, String admissionNo, String name, String standard, String heading, String reason,
			String details, String fromDate, String toDate, String approval) {
		super();
		this.siNo = siNo;
		this.admissionNo = admissionNo;
		this.name = name;
		this.standard = standard;
		this.heading = heading;
		this.reason = reason;
		this.details = details;
		this.fromDate = fromDate;
		this.toDate = toDate;
		this.approval = approval;
	}
	public Long getSiNo() {
		return siNo;
	}
	public void setSiNo(Long siNo) {
		this.siNo = siNo;
	}
	public String getAdmissionNo() {
		return admissionNo;
	}
	public void setAdmissionNo(String admissionNo) {
		this.admissionNo = admissionNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getHeading() {
		return heading;
	}
	public void setHeading(String heading) {
		this.heading = heading;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public String getApproval() {
		return approval;
	}
	public void setApproval(String approval) {
		this.approval = approval;
	}
	
	
}
