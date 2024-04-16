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
import ems.entities.Leaves;
import ems.entities.Tasks;
import ems.entities.User;

@Controller
public class LeaveController {
	@Autowired
	private UserDao userDao;
	
	Leaves leave;

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
	public RedirectView add_leave(@ModelAttribute Leaves leave,Model model,HttpServletRequest request,HttpSession session) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
		userDao.addLeaves(leave,currentUser);
		
		List<Leaves> leaves = userDao.getLeaves(currentUser);
		model.addAttribute("leaves",leaves);
		
		RedirectView redirectView=new RedirectView();
		redirectView.setUrl(request.getContextPath()+"/employee_leave");
		return redirectView;
	
	}
	
	@RequestMapping(value="edit_leave")
	public String edit_Done_task(@RequestParam("leave_Id") int leave_Id,HttpServletRequest request,HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        
        Leaves leave=userDao.findLeaveById(leave_Id);
        model.addAttribute("leave",leave);
        
        List<Leaves> leaves = userDao.getLeaves(currentUser);
		model.addAttribute("leaves",leaves);
        return "edit_leave";
	}
	
	@RequestMapping(value="/deleted/{leave_Id}",method=RequestMethod.GET)
	public RedirectView delete_leave(@PathVariable("leave_Id") int leave_Id,HttpServletRequest request) {
		userDao.delete_leave(leave_Id, leave);	
		RedirectView redirectView=new RedirectView();
		redirectView.setUrl(request.getContextPath()+"/employee_leave");
		return redirectView;
	}
}
