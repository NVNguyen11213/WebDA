package webgiay.controller.backend;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("/admin/role/")
public class RoleController extends BaseController implements Jw27Constants{
	@Autowired
	private RoleService roleService;

	@Autowired
	private UserService userService;

//	@RequestMapping(value = "list", method = RequestMethod.GET)
//	// Cách đẩy 1 dữ liệu sang view
//	public String list(final Model model) {
//		List<Role> roles = roleService.findAll();
//		//List<Role> categories = RoleService.findAllActive();
//		model.addAttribute("roles", roles);
//		return "backend/role-list";
//	}
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(final Model model, 
			HttpServletRequest request) {
		
		SearchModel roleSearch = new SearchModel();
		
		if (!StringUtils.isEmpty(request.getParameter("currentPage"))) {
			roleSearch.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
		}
		else {
			roleSearch.setCurrentPage(1);
		}
		
		List<Role> AllRoles = roleService.findAll();
		List<Role> roles = new ArrayList<Role>();
		
		//Tong so trang theo tim kiem
		int totalPages = AllRoles.size() / SIZE_OF_PAGE;
		if (AllRoles.size() % SIZE_OF_PAGE > 0) {
			totalPages++;
		}
		
		//Lay danh sach sp can hien thi trong 1 trang
		int firstIndex = (roleSearch.getCurrentPage() - 1) * SIZE_OF_PAGE;
		int index = firstIndex, count = 0;
		while(index < AllRoles.size() && count < SIZE_OF_PAGE) {
			roles.add(AllRoles.get(index));
			index++;
			count++;
		}
		
		roleSearch.setSizeOfPage(SIZE_OF_PAGE);
		roleSearch.setTotalItems(AllRoles.size());
		
		model.addAttribute("roles", roles);
		model.addAttribute("roleSearch", roleSearch);
		
		return "backend/role-list";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	// Cách đẩy 1 dữ liệu sang view
	public String add(final Model model) {

		List<User> users = userService.findAll();
		model.addAttribute("users", users);

		Role role = new Role();
		role.setCreateDate(new Date());

		model.addAttribute("role", role);
		return "backend/role-add";
	}
	@RequestMapping(value = "add-save", method = RequestMethod.POST)
	// Cách đẩy 1 dữ liệu sang view
	public String addSave(final Model model, @ModelAttribute("role") Role role) {

		roleService.saveOrUpdate(role);
		return "redirect:/admin/role/add";
	}

	// Viet Action cua edit Role
	@RequestMapping(value = "edit/{roleId}", method = RequestMethod.GET)
	// Cách đẩy 1 dữ liệu sang view
	public String edit(final Model model, @PathVariable("roleId") int roleId) {

		List<User> users = userService.findAll();
		model.addAttribute("users", users);

		// Lấy Role trong DB bằng Id
		Role role = roleService.getById(roleId);

		model.addAttribute("role", role);
		return "backend/role-edit";
	}

	// SAVE EDIT Role
	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	// Cách đẩy 1 dữ liệu sang view
	public String editSave(final Model model, @ModelAttribute("role") Role role) {

		roleService.saveOrUpdate(role);
		return "redirect:/admin/role/list";
	}

	// DELETE Role
//	@RequestMapping(value = "delete/{roleId}", method = RequestMethod.GET)
//	//Cách đẩy 1 dữ liệu sang view
//	public String delete(final Model model,
//			@PathVariable("roleId") int roleId) {
//		
//		roleService.deleteroleById(roleId);
//		return "redirect:/admin/role/list";
//	}

	// TH: inactive 
	@RequestMapping(value = "delete/{roleId}", method = RequestMethod.GET)
	// Cách đẩy 1 dữ liệu sang view
	public String delete(final Model model, @PathVariable("roleId") int roleId) {
		// Lấy Role trong DB bằng Id
		Role role = roleService.getById(roleId);
		role.setStatus(false);
		roleService.inactiveRole(role);
		
		return "redirect:/admin/role/list";
	}

}
