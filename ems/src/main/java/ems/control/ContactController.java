package ems.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import ems.dao.UserDao;
import ems.entities.User;

@Controller
public class ContactController {
	@Autowired
	private UserDao userDao;
	
	@RequestMapping(value="/pages-contact")
	public String pages_contact(HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
		return "pages-contact";
	}
	
	@RequestMapping(value="/employee_contact")
	public String employee_contact(HttpSession session,Model model) {
		String currentUserEmail = (String) session.getAttribute("email"); 
        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
        model.addAttribute("currentUser", currentUser);
		return "employee_contact";
	}
	
	@RequestMapping(value="/signout",method=RequestMethod.GET)
	public RedirectView signout(HttpSession session,HttpServletResponse response,HttpServletRequest request) {
		session.invalidate();
	
		RedirectView redirectView=new RedirectView();
		redirectView.setUrl(request.getContextPath()+"/");
		return redirectView;
		
	}
	
}
