/**
 * 
 */
package com.poorna.rk.Events.domain;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @author SunittaT
 *
 */
@Document(collection = "Events")
public class Events {
	/*@Id
	private String id;*/
	@Id
	private Long siNo;
	private String eventName;
	private String details;
	private String eventBanner;
	private Date eventDate;
	private String status;
	
	public Events() {}
	public Events(Long siNo, String eventName, String details, String eventBanner, Date eventDate,
			String status) {
		super();
		//this.id = id;
		this.siNo = siNo;
		this.eventName = eventName;
		this.details = details;
		this.eventBanner = eventBanner;
		this.eventDate = eventDate;
		this.status = status;
	}
	/*public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}*/
	public Long getSiNo() {
		return siNo;
	}
	public void setSiNo(Long siNo) {
		this.siNo = siNo;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public Date getEventDate() {
		return eventDate;
	}
	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getEventBanner() {
		return eventBanner;
	}
	public void setEventBanner(String eventBanner) {
		this.eventBanner = eventBanner;
	}
	
	              
	
	
}
