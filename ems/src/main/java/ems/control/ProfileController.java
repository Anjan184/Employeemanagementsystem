package ems.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import ems.dao.UserDao;
import ems.entities.User;

@Controller
public class ProfileController {
	@Autowired
	private UserDao userDao;
	
	//this is help in showing profile of user(Admin,Employee)
		@RequestMapping(value="/users-profile")
		public String users_profile(Model model,HttpSession session) {
			 String currentUserEmail = (String) session.getAttribute("email"); 
		        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
		        model.addAttribute("currentUser", currentUser);
		        
			return "users-profile";
		}
		
		@RequestMapping(value="/employee_profile")
		public String employee_profile(HttpSession session,Model model){
			String currentUserEmail = (String) session.getAttribute("email"); 
	        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
	        model.addAttribute("currentUser", currentUser);
			return "employee_profile";
		}
		
		@RequestMapping(value="/editprofile",method=RequestMethod.POST)
		public RedirectView edit_profile_employee(HttpSession session,Model model, @RequestParam("profilePicture") CommonsMultipartFile profilePicture,@RequestParam String fullname,@RequestParam String address,@RequestParam String contact,@RequestParam String gender,@RequestParam String email,@RequestParam String password,@RequestParam String bloodgroup,HttpServletRequest request) {
		
			String currentUserEmail = (String) session.getAttribute("email"); 
	        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
	        model.addAttribute("currentUser", currentUser);
	        
	        if (!profilePicture.isEmpty()) {
	            byte[] imageData = profilePicture.getBytes();
	            currentUser.setProfilePicture(imageData);
	         String img = Base64.encodeBase64String(imageData);
	         session.setAttribute("img",img);
	        }
	     
	        currentUser.setFullname(fullname);
	        currentUser.setAddress(address);
	        currentUser.setContact(contact);
	        currentUser.setGender(gender);
	        currentUser.setEmail(email);
	        currentUser.setPassword(password);
	        currentUser.setBloodgroup(bloodgroup);
	        userDao.createUser(currentUser);
	       
	        
	        RedirectView redirectView=new RedirectView();
			redirectView.setUrl(request.getContextPath()+"/employee_profile");
			return redirectView;
			
		}
		
		@RequestMapping(value="/editprofileadmin",method=RequestMethod.POST)
		public RedirectView edit_profile_admin(HttpSession session,Model model, @RequestParam("profilePicture") CommonsMultipartFile profilePicture,@RequestParam String fullname,@RequestParam String address,@RequestParam String contact,@RequestParam String gender,@RequestParam String email,@RequestParam String password,@RequestParam String bloodgroup,HttpServletRequest request) {
		
			String currentUserEmail = (String) session.getAttribute("email"); 
	        User currentUser = userDao.getCurrentUserByEmail(currentUserEmail);
	        model.addAttribute("currentUser", currentUser);
	 
	        if (!profilePicture.isEmpty()) {
	            byte[] imageData = profilePicture.getBytes();
	            currentUser.setProfilePicture(imageData);
	         String img = Base64.encodeBase64String(imageData);
	         session.setAttribute("img",img);
	        }

	        currentUser.setFullname(fullname);
	        currentUser.setAddress(address);
	        currentUser.setContact(contact);
	        currentUser.setGender(gender);
	        currentUser.setEmail(email);
	        currentUser.setPassword(password);
	        currentUser.setBloodgroup(bloodgroup);
	        userDao.createUser(currentUser);
	       
	        
	        RedirectView redirectView=new RedirectView();
			redirectView.setUrl(request.getContextPath()+"/users-profile");
			return redirectView;
			
		}
		
		@RequestMapping("/error_page")
		public String ErrorPage() {
			return "error_page";
		}
}
