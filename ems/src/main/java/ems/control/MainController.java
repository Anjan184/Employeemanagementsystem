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

import org.apache.commons.codec.binary.Base64;
import ems.dao.UserDao;
import ems.entities.*;

@Controller
public class MainController {

	@Autowired
	private UserDao userDao;

	User user;
	
	@RequestMapping(value = "/")
	public String def(Model m) {
		return "login";
	}

	// For authentication purpose of login
	@RequestMapping(value = "/Dashboard", method = { RequestMethod.GET, RequestMethod.POST })
	public RedirectView admin(@RequestParam String email, @RequestParam String password, Model model,
			@ModelAttribute User user, HttpSession session, HttpServletRequest request) {
		session.setAttribute("email", email);

		if (userDao.authenticateUser(email, password)) {
			User u = userDao.getUserByEmail(email);
			String img = Base64.encodeBase64String(u.getProfilePicture());
			session.setAttribute("img", img);
			if ("employee".equals(u.getRole())) {
				RedirectView redirectView = new RedirectView();
				redirectView.setUrl(request.getContextPath() + "/employee_dashboard");
				return redirectView;

			} else if ("admin".equals(u.getRole())) {
				List<User> employees = userDao.getAllEmployees();
				model.addAttribute("employees", employees);
				RedirectView redirectView = new RedirectView();
				redirectView.setUrl(request.getContextPath() + "/index");
				return redirectView;
			}
		}
		model.addAttribute("error", "Incorrect email or password.");
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/");
		return redirectView;
	}

	// this redirect to add new employee page when clicked on add new employee
	// button(Admin)
	@RequestMapping(value = "/add_new_employee")
	public String add_new_employee(HttpSession session, Model model) {
		String currentUserEmail = (String) session.getAttribute("email");
		User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
		model.addAttribute("currentUser", currentUser);
		return "add_new_employee";
	}

	// this add the employee to the db name User and return list of employees and
	// show it to dashboard(Admin)
	@RequestMapping(value = "/submit_employee", method = RequestMethod.POST)
	public RedirectView submit_employee(@ModelAttribute User user, Model model, HttpServletRequest request) {
		List<User> employees = userDao.getAllEmployees();
		model.addAttribute("employees", employees);
		userDao.createUser(user);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/index");
		return redirectView;
	}

	// this is admin dashboard where we get session and get list of employees(Admin)
	@RequestMapping(value = "/index")
	public String index(Model model, HttpSession session) {
		List<User> employees = userDao.getAllEmployees();
		String currentUserEmail = (String) session.getAttribute("email");
		User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
		model.addAttribute("currentUser", currentUser);
		model.addAttribute("employees", employees);
		return "index";
	}

	@RequestMapping(value = "/edit_employee")
	public String edit_employee(@RequestParam("id") int id, Model model, HttpServletRequest request,
			HttpSession session) {
		String currentUserEmail = (String) session.getAttribute("email");
		User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
		model.addAttribute("currentUser", currentUser);
		User user = userDao.findUserById(id);
		model.addAttribute("user", user);
		List<User> employees = userDao.getAllEmployees();
		model.addAttribute("employees", employees);
		return "edit_employee";
	}

	// this deletes the employee by the id of employee(Admin)
	@RequestMapping(value = "/delete/{id}", method = { RequestMethod.GET, RequestMethod.POST })
	public RedirectView deleteEmployee(@PathVariable("id") int id, HttpServletRequest request) {
		userDao.deleteUser(id, user);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/index");
		return redirectView;
	}

}
