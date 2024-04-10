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
import ems.entities.Holidays;
import ems.entities.User;

@Controller
public class HolidayController {
	@Autowired
	private UserDao userDao;
	Holidays holiday;
	
	//this shows the holidays list in holidays page 
		@RequestMapping(value="/Holidays")
		public String Holidays(Model model,HttpSession session) {
			List<Holidays> holidays = userDao.getHolidays();
			model.addAttribute("holiday",holidays);
			String currentUserEmail = (String) session.getAttribute("email"); 
	        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
	        model.addAttribute("currentUser", currentUser);
			return "Holidays";
		}
		
		 @RequestMapping(value="/edit_holiday")
		    public String editHoliday(@RequestParam("id") int id,HttpServletRequest request,Model model,HttpSession session) {
			 String currentUserEmail = (String) session.getAttribute("email"); 
		        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
		        model.addAttribute("currentUser", currentUser);
			 Holidays hol = userDao.findHolidayById(id);
			 model.addAttribute("hol",hol); 	
		    	return "edit_holiday";
		    }
		
		//holiday button and when clicked fire add holiday(Admin)
		@RequestMapping(value="/add_new_holiday")
		public String Add_new_holiday(HttpSession session,Model model) {
			String currentUserEmail = (String) session.getAttribute("email"); 
	        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
	        model.addAttribute("currentUser", currentUser);
			return "add_holiday";
		}
		
		//this add new holiday adn return list of holidays and show to holidays page(Admin)
		@RequestMapping(value="/add_holiday",method=RequestMethod.POST)
		public RedirectView Add_holiday(@ModelAttribute Holidays holiday,Model model,HttpServletRequest request) {
			userDao.addHoliday(holiday);
			List<Holidays> holidays = userDao.getHolidays();
			model.addAttribute("holiday",holidays);
			RedirectView redirectView=new RedirectView();
			redirectView.setUrl(request.getContextPath()+"/Holidays");
			return redirectView;
		}
		
		 @RequestMapping(value="/dlt/{id}",method= {RequestMethod.GET})
		    public RedirectView deleteHoliday(@PathVariable("id") int id,HttpServletRequest request) {
		    	userDao.deleteHoliday(id, holiday);
		    	RedirectView redirectView=new RedirectView();
				redirectView.setUrl(request.getContextPath()+"/Holidays");
				return redirectView;
		    }
		 
		 @RequestMapping(value="/employee_holidays")
			public String employee_holidays(HttpSession session,Model model) {
				String currentUserEmail = (String) session.getAttribute("email"); 
		        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
		        model.addAttribute("currentUser", currentUser);
				List<Holidays> holidays = userDao.getHolidays();
				model.addAttribute("holiday",holidays);
				return "employee_holidays";
			}
}
