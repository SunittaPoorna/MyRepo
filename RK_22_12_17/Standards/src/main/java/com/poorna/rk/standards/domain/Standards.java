/**
 * 
 */
package com.poorna.rk.standards.domain;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @author SunittaT
 *
 */
@Document(collection = "standards")
public class Standards {
	@Id
	private Long siNo;
	private String standardName;
	private String status;
	
	public Standards()
	{}
	public Standards(Long siNo, String standardName, String status) {
		super();
		this.siNo = siNo;
		this.standardName = standardName;
		this.status = status;
	}
	public Long getSiNo() {
		return siNo;
	}
	public void setSiNo(Long siNo) {
		this.siNo = siNo;
	}
	public String getStandardName() {
		return standardName;
	}
	public void setStandardName(String standardName) {
		this.standardName = standardName;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
