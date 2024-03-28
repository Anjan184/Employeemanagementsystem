package ems.control;


import java.sql.Date;
import java.sql.Time;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import ems.entities.*;

@Controller
public class MainController {
	
	@Autowired
	private UserDao userDao;
	
	User user;
	Holidays holiday;
	PunchIn punchIn;
	PunchOut punchOut;
	Events event;
	Leaves leave;
	
	@RequestMapping(value="/")
	public String def(Model m) {
		return "login";
	}
	
	//For authentication purpose of login
	@RequestMapping(value="/Dashboard", method= {RequestMethod.GET,RequestMethod.POST})
	public String admin(@RequestParam String email, @RequestParam String password, @RequestParam String role,Model model,@ModelAttribute User user,HttpSession session) {
		session.setAttribute("email", email);		
		model.addAttribute("error", ""); // or model.remove("error");
		 if (userDao.authenticateUser(email, password, role)) {     
	            if ("employee".equals(role)) {
	                return "employee_dashboard";
	            }           
	            else if ("admin".equals(role)) {
	            	 List<User> employees = userDao.getAllEmployees();
	                 model.addAttribute("employees", employees);
	                 return "index";
	            }  
	        }
			model.addAttribute("error","Invalid details");
			return "login";
	}
	
	//this redirect to add new employee page when clicked on add new employee button(Admin)
	@RequestMapping(value="/add_new_employee")
	public String add_new_employee() {
		return "add_new_employee";
	}
	
	//this add the employee to the db name User and return list of employees and show it to dashboard(Admin) 
	@RequestMapping(value="/submit_employee",method=RequestMethod.POST)
	public RedirectView submit_employee(@ModelAttribute User user,Model model,HttpServletRequest request) {
		 List<User> employees = userDao.getAllEmployees();
         model.addAttribute("employees", employees);
         userDao.createUser(user);
		 RedirectView redirectView=new RedirectView();
			redirectView.setUrl(request.getContextPath()+"/index");
			return redirectView;
	}
	
	//this is admin dashboard where we get session and get list of employees(Admin)
	@RequestMapping(value="/index")
	public String index(Model model,HttpSession session) {
			List<User> employees = userDao.getAllEmployees();
			String currentUserEmail = (String) session.getAttribute("email"); 
	        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
	        model.addAttribute("currentUser", currentUser);
	        model.addAttribute("employees", employees);
	        return "index";
	}
	
	//this is button of edit and when clicked fire the link of change details(Admin)
	@RequestMapping(value="/edit_employee/{id}",method= RequestMethod.GET)
    public String edit_employee(@PathVariable("id") int id, Model model) {
        User employee = userDao.getEmployee(id);
        model.addAttribute("employee", employee);
        return "edit_employee";
    }
    
	//this is to change employee details(Admin)
    @RequestMapping(value="/change_details/{id}",method= RequestMethod.POST)
    public RedirectView change_details(@PathVariable("id") int id,@ModelAttribute User user, Model model,HttpServletRequest request) {
    	userDao.updateEmployee(id, user);
        List<User> employees = userDao.getAllEmployees();
        model.addAttribute("employees", employees);
        RedirectView redirectView=new RedirectView();
		redirectView.setUrl(request.getContextPath()+"/index");
		return redirectView;
    }
    
    //this deletes the employee by the id of employee(Admin)
    @RequestMapping(value="/delete/{id}",method= {RequestMethod.GET,RequestMethod.POST})
    public RedirectView deleteEmployee(@PathVariable("id") int id,HttpServletRequest request) {
    	userDao.deleteUser(id, user);
    	RedirectView redirectView=new RedirectView();
		redirectView.setUrl(request.getContextPath()+"/index");
		return redirectView;
    }
	
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
	
	//add event page
	@RequestMapping(value="/add_event")
	public String Add_new_event() {
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
	
	//holiday button and when clicked fire add holiday(Admin)
	@RequestMapping(value="/add_new_holiday")
	public String Add_new_holiday() {
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
	
	
	@RequestMapping(value="/Attendance_correction")
	public String Attendance_correction(HttpSession session,Model model) {	
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
    	List<PunchIn> showFirstAdmin=userDao.showFirstInAdmin();
		model.addAttribute("showFirstAdmin",showFirstAdmin);
		List<PunchOut> showLast=userDao.showLastOutAdmin();
		model.addAttribute("showLastAdmin",showLast);
		return "Attendance_correction";
	}
	
	@RequestMapping(value="/Leave_application",method=RequestMethod.GET)
	public String Leave_application(HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
       
        List<Leaves> Allleaves=userDao.getAllLeaves();
        model.addAttribute("all",Allleaves);
      
		return "Leave_application";
	}
	
	@RequestMapping(value="/process_leave_approval/{leave_Id}",method=RequestMethod.POST)
	public RedirectView process_leave_approval(@PathVariable("leave_Id") int leave_Id,@ModelAttribute Leaves leave, @RequestParam String status,HttpServletRequest request) {
		
		if("approve".equals(status)){
	    leave.setStatus(status);
	    userDao.add_status(leave_Id,status);
        }
		
		else if("reject".equals(status)) {
			leave.setStatus(status);
			userDao.add_status(leave_Id,status);
		}
		RedirectView redirectView=new RedirectView();
		redirectView.setUrl(request.getContextPath()+"/Leave_application");
		return redirectView;
	}
	
	@RequestMapping(value="/approved_application",method=RequestMethod.GET)
	public String Approved_application(HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        
        List<Leaves> Approvedleaves=userDao.getApprovedLeaves();
        model.addAttribute("Approved",Approvedleaves); 
        
		return "approved_application";
	}
	
	@RequestMapping(value="/rejected_application",method=RequestMethod.GET)
	public String Rejected_application(HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        
        List<Leaves> Rejectedleaves=userDao.getRejectedLeaves();
        model.addAttribute("Rejected",Rejectedleaves);
  
        return "rejected_application";
	}
	
	
	//this is help in showing profile of user(Admin,Employee)
	@RequestMapping(value="/users-profile")
	public String users_profile(Model model,HttpSession session) {
		 String currentUserEmail = (String) session.getAttribute("email"); 
	        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
	        model.addAttribute("currentUser", currentUser);
	      
	        
		return "users-profile";
	}
	
	@RequestMapping(value="/pages-contact")
	public String pages_contact(HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
		return "pages-contact";
	}
	
	@RequestMapping(value="/employee_dashboard")
	public String employee_dashboard(HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        
        String selectedDate =LocalDate.now().toString();
  
        List<PunchIn> punchindetails=userDao.showPunchIn(selectedDate,currentUser);
        model.addAttribute("punchindetails", punchindetails);
        List<PunchOut> punchoutdetails=userDao.showPunchOut(currentUser);
        model.addAttribute("punchoutdetails", punchoutdetails);     
        String TotalTime=calculateTotalWork(punchindetails, punchoutdetails, selectedDate);
        model.addAttribute("totalTime", TotalTime);
        
		return "employee_dashboard";
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
	
	@RequestMapping(value="/employee_holidays")
	public String employee_holidays(HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
		List<Holidays> holidays = userDao.getHolidays();
		model.addAttribute("holiday",holidays);
		return "employee_holidays";
	}
	
	// Punchin method
	@RequestMapping(value="/punchin", method=RequestMethod.GET)
	public String punchIn(HttpSession session) {    
	    String currentUserEmail = (String) session.getAttribute("email"); 
	    User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
	    PunchIn punchIn = new PunchIn();
	    punchIn.setPunchIn(Time.valueOf(LocalTime.now()));
	    punchIn.setPunchIn_Date(Date.valueOf(LocalDate.now()));
	    punchIn.setUser(currentUser);
	    userDao.addpunchin(punchIn,currentUser);
	    session.setAttribute("punchInFlag", true);
	    
	    return "employee_dashboard";    
	}

	// Punchout method
	@RequestMapping(value="/punchout", method=RequestMethod.GET)
	public String punchOut(HttpSession session) {
	    String currentUserEmail = (String) session.getAttribute("email"); 
	    User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
	    Boolean punchInFlag = (Boolean) session.getAttribute("punchInFlag");
	    if (punchInFlag == null || !punchInFlag) {
	        return "redirect:/employee_dashboard?Please punch in first";
	    }
	    PunchOut punchOut = new PunchOut();
	    punchOut.setPunchOut(Time.valueOf(LocalTime.now()));
	    punchOut.setPunchOut_Date(Date.valueOf(LocalDate.now()));
	    punchOut.setUser(currentUser);
	    userDao.addpunchout(punchOut,currentUser);
	    session.removeAttribute("punchInFlag");
	    
	    return "employee_dashboard";
	}

	
	//employee attendance main page 
	@RequestMapping(value = "/employee_attendance",method=RequestMethod.GET)
	public String showPunch(HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
		List<PunchIn> showFirst=userDao.showFirstIn(currentUser);
		model.addAttribute("showFirst",showFirst);
		List<PunchOut> showLast=userDao.showLastOut(currentUser);
		model.addAttribute("showLast",showLast);
		List<PunchIn> punchindetails=userDao.showPunchInOne(currentUser);
        model.addAttribute("punchindetails", punchindetails);
        List<PunchOut> punchoutdetails=userDao.showPunchOut(currentUser);
        model.addAttribute("punchoutdetails", punchoutdetails);  
		return "employee_attendance";
	}
	
	//employee attendance details page
	@RequestMapping(value="/employee_attendance_details/{selectedDate}")
		public String showPunchDetails(@PathVariable("selectedDate") String selectedDate,Model model,HttpSession session) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        
		List<PunchIn> punchindetails=userDao.showPunchIn(selectedDate,currentUser);
        model.addAttribute("punchindetails", punchindetails);
              
        List<PunchOut> punchoutdetails=userDao.showPunchOutOne(selectedDate,currentUser);
        model.addAttribute("punchoutdetails", punchoutdetails);
        
        List<String> elapsedTimes = calculateElapsedTimes(punchindetails, punchoutdetails,selectedDate);
        model.addAttribute("elapsedTimes", elapsedTimes);
        
        String TotalTime=calculateTotalWork(punchindetails, punchoutdetails, selectedDate);
        model.addAttribute("totalTime", TotalTime);
       
        return "employee_attendance_details";
		}
	
	//method to calculate work done between particular punchin and punchout
	  private List<String> calculateElapsedTimes(List<PunchIn> punchInDetails, List<PunchOut> punchOutDetails,String selectedDate) {
	        List<String> formattedElapsedTimes = new ArrayList<>();       
	        for (int i = 0; i < Math.min(punchInDetails.size(), punchOutDetails.size()); i++) {
	            PunchIn punchIn = punchInDetails.get(i);
	            PunchOut punchOut = punchOutDetails.get(i);
	            long elapsedTimeMillis = Duration.between(punchIn.getPunchIn().toLocalTime(), punchOut.getPunchOut().toLocalTime()).toMillis();
	            long hours = elapsedTimeMillis / 3600000;
	            long minutes = (elapsedTimeMillis % 3600000) / 60000;
	            long seconds = (elapsedTimeMillis % 60000) / 1000;
	            String formattedTime = String.format("%02d:%02d:%02d", hours, minutes, seconds);
	            formattedElapsedTimes.add(formattedTime);
	        }  
	        return formattedElapsedTimes;
	    }
	  
	  public String calculateTotalWork(List<PunchIn> punchInDetails,List<PunchOut> punchOutDetails,String selectedDate){
			 long totalMilliseconds = 0;
			for (int i = 0; i < Math.min(punchInDetails.size(), punchOutDetails.size()); i++) {
	            PunchIn punchIn = punchInDetails.get(i);
	            PunchOut punchOut = punchOutDetails.get(i);
	            if(punchIn.getPunchIn_Date().toString().equals(selectedDate)) {	
	            	 long elapsedTimeMillis = Duration.between(punchIn.getPunchIn().toLocalTime(), punchOut.getPunchOut().toLocalTime()).toMillis();
	                 totalMilliseconds += elapsedTimeMillis;
	            }
				}
			long totalHours = totalMilliseconds / 3600000;
		    long totalMinutes = (totalMilliseconds % 3600000) / 60000;
		    long totalSeconds = (totalMilliseconds % 60000) / 1000;    
		    long extraHours = 0;  
		    if (totalHours > 7 || (totalHours == 7 && totalMinutes >= 30)) {
		        extraHours = totalHours - 7;
		        if (totalMinutes < 30) {
		            extraHours -= 1;
		            totalMinutes += 60;
		        }
		        totalMinutes -= 30; 
		    }
		    return String.format("%02d:%02d:%02d Extra Work: %02d:%02d", totalHours, totalMinutes, totalSeconds, extraHours, totalMinutes);
		}


	
	@RequestMapping(value="/employee_leave",method=RequestMethod.GET)
	public String employee_leave(HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
    	List<Leaves> leaves = userDao.getLeaves(currentUser);
		model.addAttribute("leaves",leaves);
		return "employee_leave";
	}
	
	@RequestMapping(value="/add_new_leave" ,method=RequestMethod.GET)
	public String add_new_leave(HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
		return "add_new_leave";
	}
	
	@RequestMapping(value="/process_leave",method=RequestMethod.POST)
	public String add_leave(@ModelAttribute Leaves leave,Model model,HttpServletRequest request,HttpSession session) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
		userDao.addLeaves(leave,currentUser);
		
		List<Leaves> leaves = userDao.getLeaves(currentUser);
		model.addAttribute("leaves",leaves);
		
		return "employee_leave";
		
	}
	
	@RequestMapping(value="/deleted/{leave_Id}",method=RequestMethod.GET)
	public RedirectView delete_leave(@PathVariable("leave_Id") int leave_Id,HttpServletRequest request) {
		userDao.delete_leave(leave_Id, leave);	
		RedirectView redirectView=new RedirectView();
		redirectView.setUrl(request.getContextPath()+"/employee_leave");
		return redirectView;
	}
	
	
	
	@RequestMapping(value="/employee_profile")
	public String employee_profile(HttpSession session,Model model){
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
		return "employee_profile";
	}
	
	@RequestMapping(value="/employee_contact")
	public String employee_contact(HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
		return "employee_contact";
	}
	
	@RequestMapping(value="/signout",method=RequestMethod.GET)
	public String signout(HttpSession session,HttpServletResponse response) {
		session.invalidate();
		return "login";
	}

	}
