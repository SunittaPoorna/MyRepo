/**
 * 
 */
package com.poorna.rk.Events.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.poorna.rk.Events.domain.Events;
import com.poorna.rk.Events.repository.EventsRepository;




/**
 * @author SunittaT
 *
 */
@SpringBootApplication
public class EventsService {
	
	@Autowired
	EventsRepository eventsRepository;
	
	public List<Events> getEvents()
	{
		List<Events> events = new ArrayList<>();
		eventsRepository.findAll()
		.forEach(events::add);
		return events;
	}
	public Events addNew(Events events) {
		
		eventsRepository.save(events);
		return events;
	}
	public void updateEvents(Events events, Long siNo) {
		
		eventsRepository.save(events);		
		}

	}
	

