/**
 * 
 */
package com.poorna.rk.Notifications.domain;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * @author SunittaT
 *
 */
@Document(collection = "Notifications")
public class Notifications {
	@Id
	private Long siNo;
	private String type;
	private String heading;
	private String content;
	private Date sentDate;
	private String status;
	
	public Notifications()
	{}
	public Notifications(Long siNo, String type, String heading, String content, Date sentDate, String status) {
		super();
		this.siNo = siNo;
		this.type = type;
		this.heading = heading;
		this.content = content;
		this.sentDate = sentDate;
		this.status = status;
	}
	public Long getSiNo() {
		return siNo;
	}
	public void setSiNo(Long siNo) {
		this.siNo = siNo;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getHeading() {
		return heading;
	}
	public void setHeading(String heading) {
		this.heading = heading;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getSentDate() {
		return sentDate;
	}
	public void setSentDate(Date sentDate) {
		this.sentDate = sentDate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
         
	
	
}
