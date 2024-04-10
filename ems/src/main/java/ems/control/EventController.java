package ems.control;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import ems.dao.UserDao;
import ems.entities.Events;
import ems.entities.User;

@Controller
public class EventController {
	Events event;
	@Autowired
	private UserDao userDao;
	
	 //main event page
		@RequestMapping(value="/Events")
		public String Events(Model model,HttpSession session) {
			List<Events> events = userDao.getEvents();
			model.addAttribute("event",events);	
			String currentUserEmail = (String) session.getAttribute("email"); 
	        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
	        model.addAttribute("currentUser", currentUser);
			return "Events";
		}
		
		 @RequestMapping(value="/edit_event")
		    public String editEvent(@RequestParam("eventid") int eventid,HttpServletRequest request,Model model,HttpSession session) {
			 String currentUserEmail = (String) session.getAttribute("email"); 
		        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
		        model.addAttribute("currentUser", currentUser);
			 Events eve = userDao.findEventById(eventid);
			 model.addAttribute("eve",eve); 	
		    	return "editevent";
		    }
		 

		//add event page
		@RequestMapping(value="/add_event")
		public String Add_new_event(HttpSession session,Model model) {
			String currentUserEmail = (String) session.getAttribute("email"); 
	        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
	        model.addAttribute("currentUser", currentUser);
	        
			return "add_event";
		}

		//save the event method
		@RequestMapping(value="/add_new_event",method=RequestMethod.POST)
		public RedirectView Add_event(@ModelAttribute Events event,Model model,HttpServletRequest request) {
			userDao.addEvents(event);
			List<Events> events = userDao.getEvents();
			model.addAttribute("event",events);
			RedirectView redirectView=new RedirectView();
			redirectView.setUrl(request.getContextPath()+"/Events");
			return redirectView;
		}
		
		//delete the event method
		 @RequestMapping(value="/delt/{eventid}",method= {RequestMethod.GET})
		    public RedirectView deleteEvent(@PathVariable("eventid") int eventid,HttpServletRequest request) {
		    	userDao.deleteEvent(eventid,event );
		    	RedirectView redirectView=new RedirectView();
				redirectView.setUrl(request.getContextPath()+"/Events");
				return redirectView;
		    }
		
		 

			@RequestMapping(value="/employee_events")
			public String employee_events(HttpSession session,Model model) {
				String currentUserEmail = (String) session.getAttribute("email"); 
		        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
		        model.addAttribute("currentUser", currentUser);
				List<Events> events = userDao.getEvents();
				model.addAttribute("event",events);	
				return "employee_events";
			}
}
