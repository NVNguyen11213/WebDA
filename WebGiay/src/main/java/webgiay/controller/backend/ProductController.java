package webgiay.controller.backend;

import java.io.IOException;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import webgiay.controller.BaseController;
import webgiay.dto.Jw27Constants;
import webgiay.dto.SearchModel;
import webgiay.model.Category;
import webgiay.model.Product;
import webgiay.model.User;
import webgiay.service.CategoryService;
import webgiay.service.ProductService;
import webgiay.service.UserService;

@Controller
@RequestMapping("/admin/product/")
public class ProductController extends BaseController implements Jw27Constants {
	@Autowired
	private ProductService productService;

	@Autowired
	private UserService userService;

	@Autowired
	private CategoryService categoryService;

//	@RequestMapping(value = "list", method = RequestMethod.GET)
//	
//	public String list(final Model model) {
//		List<Product> products = productService.findAll();
//		//List<Product> products = productService.findAllActive();
//		model.addAttribute("products", products);
//		return "backend/product-list";
//	}

	// ------------------------- ------------------------------
	@RequestMapping(value = "list", method = RequestMethod.GET)

	public String list(final Model model, final HttpServletRequest request) {

		SearchModel productSearch = new SearchModel();
		// Tim theo status
		productSearch.setStatus(2); // input: ALL
		String status = request.getParameter("status"); // lấy value từ view
		if (!StringUtils.isEmpty(status)) { // Neu co chon status
			productSearch.setStatus(Integer.parseInt(status));
		}

		// Tim theo category
		productSearch.setCategoryId(0);
		String categoryId = request.getParameter("categoryId");
		if (!StringUtils.isEmpty(categoryId)) { // Neu co chon status
			productSearch.setCategoryId(Integer.parseInt(categoryId));
		}

		// Tim theo key
		productSearch.setKeyword(null);
		String keyword = request.getParameter("keyword");
		if (!StringUtils.isEmpty(keyword)) {
			productSearch.setKeyword(keyword);
		}

		// Kiem tra tieu chi tim kiem theo (createDate) tu ngay ... den ngay ...
		String beginDate = null;
		String endDate = null;
		if (!StringUtils.isEmpty(request.getParameter("beginDate"))
				&& !StringUtils.isEmpty(request.getParameter("endDate"))) {
			beginDate = request.getParameter("beginDate");
			endDate = request.getParameter("endDate");
		}

		productSearch.setBeginDate(beginDate);
		productSearch.setEndDate(endDate);

		// Bat dau phan trang
		if (!StringUtils.isEmpty(request.getParameter("currentPage"))) { // Bam nut chuyen trang
			productSearch.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
		} else {
			productSearch.setCurrentPage(1); // lan dau truy cap luon hien thi trang 1
		}

		List<Product> allProducts = productService.searchProduct(productSearch);// Tim kiem

		List<Product> products = new ArrayList<Product>(); // DS sp can hien thi trang hien tai

		// Tong so trang theo tim kiem
		int totalPages = allProducts.size() / SIZE_OF_PAGE;
		if (allProducts.size() % SIZE_OF_PAGE > 0) {
			totalPages++;
		}

		// Neu tong so trang < trang hien tai (lai bam tim kiem)
		if (totalPages < productSearch.getCurrentPage()) {
			productSearch.setCurrentPage(1);
		}

		// Lay danh sach sp can hien thi trong 1 trang
		int firstIndex = (productSearch.getCurrentPage() - 1) * SIZE_OF_PAGE; // vị trị dau 1 trang
		int index = firstIndex, count = 0;
		while (index < allProducts.size() && count < SIZE_OF_PAGE) {
			products.add(allProducts.get(index));
			index++;
			count++;
		}

		// Phan trang
		productSearch.setSizeOfPage(SIZE_OF_PAGE); // So ban ghi tren 1 trang
		productSearch.setTotalItems(allProducts.size()); // Tong so san pham theo tim kiem

		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);

		// List<Product> products = productService.productSearch(productSearch);
		model.addAttribute("products", products);
		model.addAttribute("productSearch", productSearch);

		return "backend/product-list";
	}

	@RequestMapping(value = "add", method = RequestMethod.GET)
	// Cách đẩy 1 dữ liệu sang view
	public String add(final Model model) {

		List<User> users = userService.findAll();
		model.addAttribute("users", users);

		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);

		Product product = new Product();
		product.setCreateDate(new Date());

		model.addAttribute("product", product);
		return "backend/product-add";
	}

	// Save new product
	@RequestMapping(value = "add-save", method = RequestMethod.POST)
	public String productAddSave(final Model model, @ModelAttribute("product") Product product,
			@RequestParam("avatarFile") MultipartFile avatarFile,
			@RequestParam("imageFiles") MultipartFile[] imageFiles) throws IOException {
		// Lấy danh sách product từ tbl_product trong DB
		productService.saveAddProduct(product, avatarFile, imageFiles);

		return "redirect:/admin/product/add";
	}

	// Viet Action cua edit product
	@RequestMapping(value = "edit/{productId}", method = RequestMethod.GET)
	// Cách đẩy 1 dữ liệu sang view
	public String edit(final Model model, @PathVariable("productId") int productId) {

		List<User> users = userService.findAll();
		model.addAttribute("users", users);

		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);

		// Lấy product trong DB bằng Id
		Product product = productService.getById(productId);
		product.setUpdateDate(new Date());
		model.addAttribute("product", product);
		return "backend/product-edit";
	}

	// SAVE EDIT Product
	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	// Cách đẩy 1 dữ liệu sang view
	public String editSave(final Model model, @ModelAttribute("product") Product product,
			@RequestParam("avatarFile") MultipartFile avatarFile,
			@RequestParam("imageFiles") MultipartFile[] imageFiles) throws IOException {

		productService.saveEditProduct(product, avatarFile, imageFiles);
		return "redirect:/admin/product/list";
	}

	// DELETE Product
//	@RequestMapping(value = "delete/{productId}", method = RequestMethod.GET)
//	//Cách đẩy 1 dữ liệu sang view
//	public String delete(final Model model,
//				@PathVariable("productId") int productId) {
//					
//		// Lấy product trong DB
//		Product product = productService.getById(productId);
//		productService.deleteProduct(product);
//		return "redirect:/admin/product/list";
//	}

	// TH: inactive
	@RequestMapping(value = "delete/{productId}", method = RequestMethod.GET)
	// Cách đẩy 1 dữ liệu sang view
	public String delete(final Model model, @PathVariable("productId") int productId) {
		// Lấy category trong DB bằng Id
		Product product = productService.getById(productId);
		product.setStatus(false);
		// productService.inactiveProduct(product);
		productService.saveOrUpdate(product);
		return "redirect:/admin/product/list";
	}

}
