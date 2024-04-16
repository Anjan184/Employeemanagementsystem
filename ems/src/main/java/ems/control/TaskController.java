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
import ems.entities.Project;

@Controller
public class TaskController {
	@Autowired
	private UserDao userDao;
	
	@RequestMapping(value="/ProjectAdmin")
	public String Project(HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        List<Project> p=userDao.getProjects();
        model.addAttribute("project",p);
        return "ProjectAdmin";
	}
	
	@RequestMapping(value="/add_new_project")
	public String add_project(Model model,HttpSession session) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        List<User> employeeids = userDao.getAllAttendanceEmployees();
        model.addAttribute("empids",employeeids);
       return "add_project";
	}
	
	@RequestMapping(value="/add_project_button",method=RequestMethod.POST)
	public RedirectView save_project(Model model,HttpSession session,@ModelAttribute Project project,HttpServletRequest request) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        List<User> employeeids = userDao.getAllAttendanceEmployees();
        model.addAttribute("empids",employeeids);
        userDao.addProject(project);
        RedirectView redirectView=new RedirectView();
		redirectView.setUrl(request.getContextPath()+"/ProjectAdmin");
		return redirectView;
	}
	
	@RequestMapping(value="/Todo_Project")
	public String Todo_Project(HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        List<Project> p=userDao.getProjects();
        model.addAttribute("project",p);
		return "Todo_Project";
	}
	
	@RequestMapping(value="/Inprogress_Project")
	public String Inprogress_Project(HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        List<Project> p=userDao.getProjects();
        model.addAttribute("project",p);
		return "Inprogress_Project";
	}
	
	@RequestMapping(value="/Done_Project")
	public String Done_Project(HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        List<Project> p=userDao.getProjects();
        model.addAttribute("project",p);
		return "Done_Project";
	}
	
	@RequestMapping(value="/Todo_tasks")
	public String Tasks(HttpSession session,Model model,@RequestParam int project_id) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        List<Tasks> tasks=userDao.getTodoTasks(project_id);
		model.addAttribute("task",tasks);
		return "Todo_tasks";
	}
	
	@RequestMapping(value="/Inprogress_tasks")
	public String InProgressTasks(HttpSession session,Model model,@RequestParam int project_id) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        List<Tasks> tasks=userDao.getInProgressTasks(project_id);
		model.addAttribute("task",tasks);
		return "Inprogress_tasks";
	}
	
	@RequestMapping(value="/Done_tasks")
	public String Done_Tasks(HttpSession session,Model model,@RequestParam int project_id) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        List<Tasks> tasks=userDao.getDoneTasks(project_id);
		model.addAttribute("task",tasks);
		return "Done_tasks";
	}
	
	@RequestMapping(value="/add_task")
	public String add_task(Model model,HttpSession session,@RequestParam("project_id") int project_id) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        model.addAttribute("project_id",project_id);
        List<User> employeeids = userDao.getAllAttendanceEmployees();
        model.addAttribute("empids",employeeids);
       return "add_new_task";
	}
	
	@RequestMapping(value="edit_todo_task")
	public String edit_todo_task(@RequestParam("task_id") int task_id,HttpServletRequest request,HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        Tasks task=userDao.findTaskById(task_id);
        model.addAttribute("task",task);
        List<User> employeeids = userDao.getAllAttendanceEmployees();
        model.addAttribute("empids",employeeids);
  
        return "edit_todo_task";
	}
	
	@RequestMapping(value="edit_Inprogress_task")
	public String edit_Inprogress_task(@RequestParam("task_id") int task_id,HttpServletRequest request,HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        Tasks task=userDao.findTaskById(task_id);
        model.addAttribute("task",task);
        List<User> employeeids = userDao.getAllAttendanceEmployees();
        model.addAttribute("empids",employeeids);
  
        return "edit_Inprogress_task";
	}
	
	@RequestMapping(value="edit_done_task")
	public String edit_Done_task(@RequestParam("task_id") int task_id,HttpServletRequest request,HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
        Tasks task=userDao.findTaskById(task_id);
        model.addAttribute("task",task);
        List<User> employeeids = userDao.getAllAttendanceEmployees();
        model.addAttribute("empids",employeeids);
  
        return "edit_done_task";
	}
	
	@RequestMapping(value="/add_button",method=RequestMethod.POST)
	public RedirectView add_new_task(HttpServletRequest request,HttpSession session,Model model,@ModelAttribute Tasks task,Tasks tk,Project project) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);  
        tk.setAssignedBy(currentUser.getFullname());
        Project projectid = userDao.getProjectsId(project.getProject_id());
        tk.setProject(projectid);
		userDao.addTask(task);	
		 RedirectView redirectView=new RedirectView();
			redirectView.setUrl(request.getContextPath()+"/ProjectAdmin");
			return redirectView;
	}
	
	  @RequestMapping(value="/dlete",method= RequestMethod.GET)
	    public RedirectView deleteTodoTasks(@RequestParam int task_id ,HttpServletRequest request) {
	    	userDao.deleteTask(task_id);
	    	RedirectView redirectView=new RedirectView();
			redirectView.setUrl(request.getContextPath()+"/Todo_Project");
			return redirectView;
	    }
	  
	  @RequestMapping(value="/dete",method= RequestMethod.GET)
	    public RedirectView deleteInProgressTasks(@RequestParam int task_id ,HttpServletRequest request) {
	    	userDao.deleteTask(task_id);
	    	RedirectView redirectView=new RedirectView();
			redirectView.setUrl(request.getContextPath()+"/Inprogress_Project");
			return redirectView;
	    }
	  
	  @RequestMapping(value="/dlee",method= RequestMethod.GET)
	    public RedirectView deleteDoneTasks(@RequestParam int task_id ,HttpServletRequest request) {
	    	userDao.deleteTask(task_id);
	    	RedirectView redirectView=new RedirectView();
			redirectView.setUrl(request.getContextPath()+"/Done_Project");
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
