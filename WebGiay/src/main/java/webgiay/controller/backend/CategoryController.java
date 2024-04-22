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
import webgiay.model.Category;
import webgiay.model.User;
import webgiay.service.CategoryService;
import webgiay.service.UserService;

@Controller
@RequestMapping("/admin/category/")
public class CategoryController extends BaseController implements Jw27Constants {
	// Khai báo đối tượng của categoryserivce
	@Autowired
	private CategoryService categoryService;

	@Autowired
	public UserService userService;

//	@RequestMapping(value = "list", method = RequestMethod.GET)
//		//Cách đẩy 1 dữ liệu sang view
//		public String list(final Model model) {
//			List<Category> categories = categoryService.findAll();
//			List<Category> categories = categoryService.findAllActive();
//			model.addAttribute("categories", categories);
//			return "backend/category-list";
//		}	

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(final Model model, HttpServletRequest request) {

		SearchModel categorySearch = new SearchModel();

		if (!StringUtils.isEmpty(request.getParameter("currentPage"))) {
			categorySearch.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
		} else {
			categorySearch.setCurrentPage(1);
		}

		List<Category> allCategories = categoryService.findAll();
		List<Category> categories = new ArrayList<Category>();

		// Tong so trang theo tim kiem
		int totalPages = allCategories.size() / SIZE_OF_PAGE;
		if (allCategories.size() % SIZE_OF_PAGE > 0) {
			totalPages++;
		}

		// Lay danh sach sp can hien thi trong 1 trang
		int firstIndex = (categorySearch.getCurrentPage() - 1) * SIZE_OF_PAGE;
		int index = firstIndex, count = 0;
		while (index < allCategories.size() && count < SIZE_OF_PAGE) {
			categories.add(allCategories.get(index));
			index++;
			count++;
		}

		categorySearch.setSizeOfPage(SIZE_OF_PAGE);
		categorySearch.setTotalItems(allCategories.size());

		model.addAttribute("categories", categories);
		model.addAttribute("categorySearch", categorySearch);

		return "backend/category-list";
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	// Cách đẩy 1 dữ liệu sang view
	public String add(final Model model) {

		List<User> users = userService.findAll();
		model.addAttribute("users", users);

		Category category = new Category();
		category.setCreateDate(new Date());
		model.addAttribute("category", category);
		return "backend/category-add";
	}

	@RequestMapping(value = "add-save", method = RequestMethod.POST)
	// Cách đẩy 1 dữ liệu sang view
	public String addSave(final Model model, @ModelAttribute("category") Category category) {

		categoryService.saveOrUpdate(category);
		return "redirect:/admin/category/add";
	}

	// Viet Action cua edit category
	@RequestMapping(value = "edit/{categoryId}", method = RequestMethod.GET)
	// Cách đẩy 1 dữ liệu sang view
	public String edit(final Model model, @PathVariable("categoryId") int categoryId) {

		List<User> users = userService.findAll();
		model.addAttribute("users", users);

		// Lấy category trong DB bằng Id
		Category category = categoryService.getById(categoryId);

		model.addAttribute("category", category);
		return "backend/category-edit";
	}

	// SAVE EDIT CATEGORY
	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	// Cách đẩy 1 dữ liệu sang view
	public String editSave(final Model model, @ModelAttribute("category") Category category) {

		categoryService.saveOrUpdate(category);
		return "redirect:/admin/category/list";
	}

	// DELETE CATEGORY
//		@RequestMapping(value = "delete/{categoryId}", method = RequestMethod.GET)
//		//Cách đẩy 1 dữ liệu sang view
//		public String delete(final Model model,
//				@PathVariable("categoryId") int categoryId) {
//			
//			categoryService.deleteCategoryById(categoryId);
//			return "redirect:/admin/category/list";
//		}

	// TH: inactive
	@RequestMapping(value = "delete/{categoryId}", method = RequestMethod.GET)
	// Cách đẩy 1 dữ liệu sang view
	public String delete(final Model model, @PathVariable("categoryId") int categoryId) {
		// Lấy category trong DB bằng Id
		Category category = categoryService.getById(categoryId);
		category.setStatus(false);
		categoryService.inactiveCategory(category);

		return "redirect:/admin/category/list";
	}

}
