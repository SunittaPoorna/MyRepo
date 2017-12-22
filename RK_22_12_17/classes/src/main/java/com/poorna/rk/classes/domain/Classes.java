/**
 * 
 */
package com.poorna.rk.classes.domain;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @author SunittaT
 *
 */
@Document(collection = "classes")
public class Classes {
	@Id
	private String id;	
	private String standard;
	private String section;
	private String staff;
	private String status;
	
	public Classes()
	{}
	public Classes(String id, String standard, String section, String staff, String status) {
		super();
		this.id = id;
		this.standard = standard;
		this.section = section;
		this.staff = staff;
		this.status = status;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getStandard() {
		return standard;
	}
	public void setStandard(String standard) {
		this.standard = standard;
	}
	public String getSection() {
		return section;
	}
	public void setSection(String section) {
		this.section = section;
	}
	public String getStaff() {
		return staff;
	}
	public void setStaff(String staff) {
		this.staff = staff;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	

	
	
}
