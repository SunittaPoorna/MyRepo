/**
 * 
 */
package com.poorna.rk.sections.domain;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @author SunittaT
 *
 */
@Document(collection = "sections")
public class Sections {
	@Id
	private Long siNo;
	private String sections;
	private String status;
	
	public Sections()
	{}
	public Sections(Long siNo, String sections, String status) {
		super();
		this.siNo = siNo;
		this.sections = sections;
		this.status = status;
	}
	public Long getSiNo() {
		return siNo;
	}
	public void setSiNo(Long siNo) {
		this.siNo = siNo;
	}
	public String getSections() {
		return sections;
	}
	public void setSections(String sections) {
		this.sections = sections;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
