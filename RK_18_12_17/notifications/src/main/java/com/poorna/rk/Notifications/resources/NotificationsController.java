/**
 * 
 */
package com.poorna.rk.Notifications.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.poorna.rk.Notifications.domain.Notifications;
import com.poorna.rk.Notifications.service.NotificationsService;





/**
 * @author SunittaT
 *
 */

@RestController
public class NotificationsController {
	
	@Autowired
	NotificationsService notificationService;
	
//All Notifications
	@RequestMapping("/notifications")	
	public List<Notifications> listNotification()
	{

      return notificationService.getNotification();

	}
	//New notification
	@RequestMapping(value = "/notifications", method = RequestMethod.POST)
	public Notifications newNotification(@RequestBody Notifications notice){
		notificationService.addNew(notice);
		return notice;
	}
//Update notification
		
	@RequestMapping(value = "/notifications/{siNo}",method = RequestMethod.PUT)
	public void updateNotification(@RequestBody Notifications notification,@PathVariable Long siNo)
	{
		notificationService.updateNotification(notification,siNo);

	}
		
	
	
}
