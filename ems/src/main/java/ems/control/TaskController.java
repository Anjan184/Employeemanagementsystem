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
import ems.entities.Tasks;
import ems.entities.User;

@Controller
public class TaskController {
	@Autowired
	private UserDao userDao;
	
	
	@RequestMapping(value="/Admin_tasks")
	public String Tasks(HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        List<Tasks> tasks=userDao.getAllTasks();
		model.addAttribute("task",tasks);
		return "Admin-tasks";
	}
	
	@RequestMapping(value="/Inprogress_tasks")
	public String InProgressTasks(HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        List<Tasks> tasks=userDao.getInProgressTasks();
		model.addAttribute("task",tasks);
		return "Inprogress_tasks";
	}
	
	@RequestMapping(value="/Done_tasks")
	public String Done_Tasks(HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        List<Tasks> tasks=userDao.getDoneTasks();
		model.addAttribute("task",tasks);
		return "Done_tasks";
	}
	
	@RequestMapping(value="/add_task")
	public String add_task(Model model,HttpSession session) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        List<User> employeeids = userDao.getAllAttendanceEmployees();
        model.addAttribute("empids",employeeids);
      
       return "add_new_task";
	}
	
	@RequestMapping(value="/add_button",method=RequestMethod.POST)
	public RedirectView add_new_task(HttpServletRequest request,HttpSession session,Model model,@ModelAttribute Tasks task,Tasks tk) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        tk.setAssignedBy(currentUser.getFullname());  
		userDao.addTask(task);
		List<Tasks> tasks=userDao.getAllTasks();
			model.addAttribute("task",tasks);	
		 RedirectView redirectView=new RedirectView();
			redirectView.setUrl(request.getContextPath()+"/Admin_tasks");
			return redirectView;
	}
	
	@RequestMapping(value="edit_task")
	public String edit_task(@RequestParam("task_id") int task_id,HttpServletRequest request,HttpSession session,Model model,Tasks tk) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        
        Tasks task=userDao.findTaskById(task_id);
        model.addAttribute("task",task);
        
        List<User> employeeids = userDao.getAllAttendanceEmployees();
        model.addAttribute("empids",employeeids);
  
        return "edit_task";
	}
	
	
	  @RequestMapping(value="/dlete/{task_id}",method= {RequestMethod.GET,RequestMethod.POST})
	    public RedirectView deleteTasks(@PathVariable("task_id") int task_id,HttpServletRequest request,Tasks task) {
	    	userDao.deleteTask(task_id,task);
	    	RedirectView redirectView=new RedirectView();
			redirectView.setUrl(request.getContextPath()+"/Admin_tasks");
			return redirectView;
	    }
	  
	  @RequestMapping(value="/employee_tasks")
		public String employee_task(Model model,HttpServletRequest request,HttpSession session) {
			String currentUserEmail = (String) session.getAttribute("email"); 
	        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
	        model.addAttribute("currentUser", currentUser);
			List<Tasks> tasks=userDao.getAllTasksByName(currentUser.getFullname());
			model.addAttribute("task",tasks);
			
			return "employee_tasks";
		}
		
		@RequestMapping(value="/saveStatus/{task_id}")
		public RedirectView process_task(@PathVariable int task_id,@RequestParam("status") String status,Tasks tk,HttpServletRequest request) {
			userDao.saveStatus(task_id,status,tk);	
			RedirectView redirectView=new RedirectView();
			redirectView.setUrl(request.getContextPath()+"/employee_tasks");
			return redirectView;
		}
}
