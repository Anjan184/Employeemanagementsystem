package ems.control;

import java.sql.Date;
import java.sql.Time;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import ems.dao.UserDao;
import ems.entities.PunchIn;
import ems.entities.PunchOut;
import ems.entities.User;

@Controller
public class AttendanceController {
	@Autowired
	private UserDao userDao;
	
	@RequestMapping(value="/Attendance_correction")
	public String Attendance_correction(HttpSession session,Model model) {	
		 String currentUserEmail = (String) session.getAttribute("email"); 
	        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
	        model.addAttribute("currentUser", currentUser);
	        List<User> employees = userDao.getAllAttendanceEmployees();
	        model.addAttribute("employees", employees);

		return "Attendance_correction";
	}
	
	@RequestMapping(value="attendance_admin")
	public String Attendance_admin(@RequestParam("id") int id,HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
		User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
		model.addAttribute("currentUser", currentUser);
		
			List<PunchIn> showFirstAdmin=userDao.showFirstInAdmin(id);
			model.addAttribute("showFirstAdmin",showFirstAdmin);
			
			List<PunchOut> showLast=userDao.showLastOutAdmin(id);
			model.addAttribute("showLastAdmin",showLast);	
			
			List<Object[]> TotalTime=userDao.TotalTime(id);
			model.addAttribute("TotalTime",TotalTime);
			
			List<Object[]> BreakTime=userDao.BreakTime(id);
			model.addAttribute("BreakTime",BreakTime);
			
			
			
			return "attendance_admin";
	}
	
	
	// Punchin method
		@RequestMapping(value="/punchin", method=RequestMethod.GET)
		public RedirectView punchIn(HttpSession session,HttpServletRequest request) {    
		    String currentUserEmail = (String) session.getAttribute("email"); 
		    User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
		    PunchIn punchIn = new PunchIn();
		    punchIn.setPunchIn(Time.valueOf(LocalTime.now()));
		    punchIn.setPunchIn_Date(Date.valueOf(LocalDate.now()));
		    punchIn.setUser(currentUser);
		    userDao.addpunchin(punchIn,currentUser);
		    session.setAttribute("punchInFlag", true);
		    RedirectView redirectView=new RedirectView();
			redirectView.setUrl(request.getContextPath()+"/employee_dashboard");
			return redirectView;
		  
		}

		// Punchout method
		@RequestMapping(value="/punchout", method=RequestMethod.GET)
		public RedirectView punchOut(HttpSession session,HttpServletRequest request) {
		    String currentUserEmail = (String) session.getAttribute("email"); 
		    User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
		    Boolean punchInFlag = (Boolean) session.getAttribute("punchInFlag");
		    if (punchInFlag == null || !punchInFlag) {
		        RedirectView redirectView=new RedirectView();
				redirectView.setUrl(request.getContextPath()+"/employee_dashboard?Please punch in first");
				return redirectView;
		    }
		    PunchOut punchOut = new PunchOut();
		    punchOut.setPunchOut(Time.valueOf(LocalTime.now()));
		    punchOut.setPunchOut_Date(Date.valueOf(LocalDate.now()));
		    punchOut.setUser(currentUser);
		    userDao.addpunchout(punchOut,currentUser);
		    session.removeAttribute("punchInFlag");
		    RedirectView redirectView=new RedirectView();
			redirectView.setUrl(request.getContextPath()+"/employee_dashboard");
			return redirectView;
		   
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
	        List<Object[]> TotalTimeemp=userDao.TotalTimeEmployee(currentUser);
	        model.addAttribute("TotalTimeemp",TotalTimeemp);
	        List<Object[]> TotalBreakemp=userDao.BreakTimeEmployee(currentUser);
	        model.addAttribute("TotalBreakemp",TotalBreakemp);
	        
			return "employee_attendance";
		}
		
		//employee attendance details page
		@RequestMapping(value="/employee_attendance_details")
			public String showPunchDetails(@RequestParam("selectedDate") String selectedDate,Model model,HttpSession session) {
		
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
			    return String.format("Total Work %02d:%02d:%02d and Extra Work: %02d:%02d", totalHours, totalMinutes, totalSeconds, extraHours, totalMinutes);
			}

		 
		  public String calculateTotalWorkDashboard(List<PunchIn> punchInDetails,List<PunchOut> punchOutDetails,String selectedDate){
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
			    return String.format("%02d:%02d:%02d ", totalHours, totalMinutes, totalSeconds);
			}
		
		  public String calculateExtraWorkDashboard(List<PunchIn> punchInDetails,List<PunchOut> punchOutDetails,String selectedDate){
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
			    return String.format("%02d:%02d", extraHours, totalMinutes);

			}
		  
		  
		  @RequestMapping(value="/employee_dashboard")
			public String employee_dashboard(HttpSession session,Model model) {
				String currentUserEmail = (String) session.getAttribute("email"); 
		       
				User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
		        model.addAttribute("currentUser", currentUser);
		        
		        LocalDate currentDate = LocalDate.now();
		        String selectedDate =LocalDate.now().toString();
		  
		        List<PunchIn> punchindetails=userDao.showPunchIn(selectedDate,currentUser);
		        model.addAttribute("punchindetails", punchindetails);
		      
		        List<PunchOut> punchoutdetails=userDao.showPunchOutOne(selectedDate,currentUser);
		        model.addAttribute("punchoutdetails", punchoutdetails);
		        
		        String TotalTime=calculateTotalWorkDashboard(punchindetails, punchoutdetails, selectedDate);
		        model.addAttribute("totalTime", TotalTime);
		        
		        String ExtraTime=calculateExtraWorkDashboard(punchindetails, punchoutdetails, selectedDate);
		        model.addAttribute("ExtraTime",ExtraTime);
		        
		        Long LeavesCount=userDao.countLeaves(currentUser);
				model.addAttribute("totalLeaves",LeavesCount);
				
			
				
				 List<String> monthsAndYear = new ArrayList<>();
				    int currentYear = currentDate.getYear();
				    int yearsToDisplay = 5; // Change this value to adjust the number of years to display
				    for (int year = currentYear; year < currentYear + yearsToDisplay; year++) {
				        for (int month = 1; month <= 12; month++) {
				            String monthAndYear = java.time.Month.of(month).toString().substring(0, 3) + " " + year;
				            monthsAndYear.add(monthAndYear);
				        }
				    }
				    model.addAttribute("monthsAndYear", monthsAndYear);
				 
				    
				    List<List<String>> monthsAndDays = new ArrayList<>();
				    for (int year = currentYear; year < currentYear + yearsToDisplay; year++) {
				        for (int month = 1; month <= 12; month++) {
				            List<String> daysOfMonth = new ArrayList<>();
				            int daysInMonth = java.time.YearMonth.of(year, month).lengthOfMonth();
				            for (int day = 1; day <= daysInMonth; day++) {
				                daysOfMonth.add(String.valueOf(day));
				            }
				            monthsAndDays.add(daysOfMonth);
				        }
				    }
				    model.addAttribute("monthsAndDays", monthsAndDays);

				    
				List<Integer> daysOfEvents=userDao.getDaysInEvent();
				model.addAttribute("daysOfEvents",daysOfEvents);    
				
				List<String> MonthAndYearInEvent=userDao.getMonthsandYearInEvent();
				model.addAttribute("MonthAndYearInEvent",MonthAndYearInEvent);    

				List<String> DateOfEvent=userDao.getDateOfEvent();
				model.addAttribute("DateOfEvent",DateOfEvent);  		
				
				List<Integer> daysOfHolidays=userDao.getDaysInHolidays();
				model.addAttribute("daysOfHolidays",daysOfHolidays);    
			
				List<String> MonthAndYearInHolidays=userDao.getMonthsandYearInHolidays();
				model.addAttribute("MonthAndYearInHolidays",MonthAndYearInHolidays);
				
				List<String> DateOfHolidays=userDao.getDateOfHolidays();
				model.addAttribute("DateOfHolidays",DateOfHolidays);  
				
				List<String> ToDateOfHolidays=userDao.getToDateOfHolidays();
				model.addAttribute("ToDateOfHolidays",ToDateOfHolidays);  

				Long TaskAssigned=userDao.countTask(currentUser.getFullname());
				model.addAttribute("TaskAssigned",TaskAssigned);
				
		        return "employee_dashboard";
			}

}
