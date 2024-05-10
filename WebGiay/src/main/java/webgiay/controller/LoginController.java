package webgiay.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import webgiay.model.Role;
import webgiay.model.User;
import webgiay.service.RoleService;
import webgiay.service.UserService;


@Controller
public class LoginController extends BaseController {
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() throws IOException {
		return "login";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signup() throws IOException {
		return "signup";
	}
	
	// Đăng ký
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		User user = new User();
		user.setUsername(request.getParameter("username"));
		user.setPassword(new BCryptPasswordEncoder(4).encode(request.getParameter("password")));
		user.setName(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));
		user.setMobile(request.getParameter("mobile"));
		user.setAddress(request.getParameter("address"));
		//Set role cho user moi - mac din role la "khach hang"
		// Lay role co nam la khach hang trong DB
		Role role = roleService.getRoleByName("khach hang");
		user.addRelationalUserRole(role);
		userService.saveOrUpdate(user);
		return "redirect:/login";
	}
	
	//Đổi mật khẩu
	@RequestMapping(value = "/change-password", method = RequestMethod.POST)
	public String changePassword(final Model model,
	        final HttpServletRequest request,
	        final HttpServletResponse response) throws IOException {
	    
	    // Lấy các input từ view
	    String username = request.getParameter("username");
	    String oldPassword = request.getParameter("oldpassword");
	    String newPassword = request.getParameter("newpassword");
	    String retypenewpassword = request.getParameter("retypenewpassword");
	    
	    String message = "";
	    String errorMessage = "";
	    
	    Object loginedUser = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    if (loginedUser != null && loginedUser instanceof UserDetails) {
	        User user = (User) loginedUser;
	        // Kiểm tra xem tên người dùng nhập vào true/false
	        if (!username.equals(user.getUsername())) {
	        	errorMessage = "Tên tài khoản hoặc mật khẩu nhập vào không đúng.";
	        } else if (!new BCryptPasswordEncoder(4).matches(oldPassword, user.getPassword())) {
				errorMessage = "Tên tài khoản hoặc mật khẩu nhập vào không đúng.";
			} else if (!newPassword.equals(retypenewpassword)) {
				errorMessage = "Mật khẩu nhập lại không khớp";
			} else {
				user.setPassword(new BCryptPasswordEncoder(4).encode(newPassword));
			    userService.saveOrUpdate(user);
			    message = "Đổi mật khẩu thành công!";
			}    		
	    } 
	    
	    model.addAttribute("message", message);
	    model.addAttribute("errorMessage", errorMessage);
	    return "changepassword";
	}

}
