/**
 * 
 */
package com.poorna.rk.designations.domain;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @author SunittaT
 *
 */
@Document(collection = "designations")
public class Designations {
	@Id
	private Long siNo;
	private String name;
	private String status;
	
	public Designations()
	{}
	public Designations(Long siNo, String name, String status) {
		super();
		this.siNo = siNo;
		this.name = name;
		this.status = status;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
