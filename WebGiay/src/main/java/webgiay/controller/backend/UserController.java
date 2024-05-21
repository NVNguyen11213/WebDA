package webgiay.controller.backend;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import webgiay.controller.BaseController;
import webgiay.dto.Jw27Constants;
import webgiay.dto.SearchModel;
import webgiay.model.Role;
import webgiay.model.User;
import webgiay.service.RoleService;
import webgiay.service.UserService;


@Controller
@RequestMapping("/admin/user/")
public class UserController extends BaseController implements Jw27Constants{
	@Autowired
	private UserService userService;
	
	@Autowired
	private RoleService roleService;
	
//	@RequestMapping(value = "list", method = RequestMethod.GET)
//	// Cách đẩy 1 dữ liệu sang view
//	public String list(final Model model) {
//		List<User> users = userService.findAll();
//		//List<Categorusersy> categories = categoryService.findAllActive();
//		model.addAttribute("users", users);
//		return "backend/user-list";
//	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(final Model model, 
			HttpServletRequest request) {
		
		SearchModel userSearch = new SearchModel();
		
		if (!StringUtils.isEmpty(request.getParameter("currentPage"))) {
			userSearch.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
		}
		else {
			userSearch.setCurrentPage(1);
		}
		
		List<User> allUsers = userService.findAll();
		List<User> users = new ArrayList<User>();
		
		//Tong so trang theo tim kiem
		int totalPages = allUsers.size() / SIZE_OF_PAGE;
		if (allUsers.size() % SIZE_OF_PAGE > 0) {
			totalPages++;
		}
		
		//Lay danh sach sp can hien thi trong 1 trang
		int firstIndex = (userSearch.getCurrentPage() - 1) * SIZE_OF_PAGE;
		int index = firstIndex, count = 0;
		while(index < allUsers.size() && count < SIZE_OF_PAGE) {
			users.add(allUsers.get(index));
			index++;
			count++;
		}
		
		userSearch.setSizeOfPage(SIZE_OF_PAGE);
		userSearch.setTotalItems(allUsers.size());
		
		model.addAttribute("users", users);
		model.addAttribute("userSearch", userSearch);
		
		return "backend/user-list";
	}
	
	
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	// Cách đẩy 1 dữ liệu sang view
	public String add(final Model model) {

		List<User> users = userService.findAll();
		model.addAttribute("users", users);

		
		List<Role> roles = roleService.findAll();
		model.addAttribute("roles", roles);
		
		User user = new User();
		user.setCreateDate(new Date());
		
		
		model.addAttribute("user", user);
		return "backend/user-add";
	}
	
	@RequestMapping(value = "add-save", method = RequestMethod.POST)
	// Cách đẩy 1 dữ liệu sang view
	public String addSave(final Model model, @ModelAttribute("user") User user) {

		Role role = roleService.getRoleByName("admin");
		String rawPassword = user.getPassword();
	    String encodedPassword = new BCryptPasswordEncoder(4).encode(rawPassword);
	    user.setPassword(encodedPassword);
	    user.addRelationalUserRole(role);
		userService.saveOrUpdate(user);
		return "redirect:/admin/user/add";
	}
	
	// Viet Action cua edit user
			@RequestMapping(value = "edit/{userId}", method = RequestMethod.GET)
			// Cách đẩy 1 dữ liệu sang view
			public String edit(final Model model, @PathVariable("userId") int userId) {

				List<User> users = userService.findAll();
				model.addAttribute("users", users);

				// Lấy category trong DB bằng Id
				User user = userService.getById(userId);

				model.addAttribute("user", user);
				return "backend/user-edit";
			}
		
			// SAVE EDIT CATEGORY
			@RequestMapping(value = "edit-save", method = RequestMethod.POST)
			// Cách đẩy 1 dữ liệu sang view
			public String editSave(final Model model, @ModelAttribute("user") User user) {

				userService.saveOrUpdate(user);
				return "redirect:/admin/user/list";
			}

			// DELETE CATEGORY
//			@RequestMapping(value = "delete/{userId}", method = RequestMethod.GET)
//			//Cách đẩy 1 dữ liệu sang view
//			public String delete(final Model model,
//					@PathVariable("userId") int userId) {
//				
//				userService.deleteUserById(userId);
//				return "redirect:/admin/user/list";
//			}

			// TH: inactive 
			@RequestMapping(value = "delete/{userId}", method = RequestMethod.GET)
			// Cách đẩy 1 dữ liệu sang view
			public String delete(final Model model, @PathVariable("userId") int userId) {
				// Lấy category trong DB bằng Id
				User user = userService.getById(userId);
				user.setStatus(false);
				userService.inactiveUser(user);
				
				return "redirect:/admin/user/list";
			}
}
