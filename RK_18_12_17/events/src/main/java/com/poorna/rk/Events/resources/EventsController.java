/**
 * 
 */
package com.poorna.rk.Events.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.poorna.rk.Events.domain.Events;
import com.poorna.rk.Events.service.EventsService;






/**
 * @author Sunitta
 *
 */

@RestController
public class EventsController {
	
	@Autowired
	EventsService eventsService;
	
//All Events
	@RequestMapping("/events")	
	public List<Events> listevents()
	{

      return eventsService.getEvents();

	}
	//New event
	@RequestMapping(value = "/events", method = RequestMethod.POST)
	public Events newEvents(@RequestBody Events events){
		eventsService.addNew(events);
		return events;
	}
//Update event
		
	@RequestMapping(value = "/events/{siNo}",method = RequestMethod.PUT)
	public void updateEvent(@RequestBody Events events,@PathVariable Long siNo)
	{
		eventsService.updateEvents(events,siNo);

	}
		
	
	
}
