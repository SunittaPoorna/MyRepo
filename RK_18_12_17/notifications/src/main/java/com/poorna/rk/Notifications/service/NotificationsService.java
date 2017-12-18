/**
 * 
 */
package com.poorna.rk.Notifications.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.poorna.rk.Notifications.domain.Notifications;
import com.poorna.rk.Notifications.repository.NotificationsRepository;




/**
 * @author SunittaT
 *
 */
@SpringBootApplication
public class NotificationsService {
	
	@Autowired
	NotificationsRepository notificationsRepository;
	
	public List<Notifications> getNotification()
	{
		List<Notifications> notification = new ArrayList<>();
		notificationsRepository.findAll()
		.forEach(notification::add);
		return notification;
	}
	public Notifications addNew(Notifications notification) {
		
		notificationsRepository.save(notification);
		return notification;
	}
	public void updateNotification(Notifications notification, Long siNo) {
		
		notificationsRepository.save(notification);		
		}
	

	}
	

