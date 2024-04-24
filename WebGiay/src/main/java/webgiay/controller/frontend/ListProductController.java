package webgiay.controller.frontend;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import webgiay.controller.BaseController;
import webgiay.dto.Jw27Constants;
import webgiay.dto.SearchModel;
import webgiay.model.Category;
import webgiay.model.Product;
import webgiay.service.CategoryService;
import webgiay.service.ProductService;

@Controller
public class ListProductController extends BaseController implements Jw27Constants {

	@Autowired
	private ProductService productService;

	@Autowired
	private CategoryService categoryService;


	@RequestMapping(value = "/allproduct", method = RequestMethod.GET)
	public String list(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		SearchModel searchModel = new SearchModel();

		searchModel.setKeyword(null);
		String keyword = request.getParameter("keyword");
		if (!StringUtils.isEmpty(keyword)) {
			searchModel.setKeyword(keyword);
		}
		
		searchModel.setCategoryId(0);
		String categoryId = request.getParameter("categoryId");
		if (!StringUtils.isEmpty(categoryId)) { // Neu co chon status
			searchModel.setCategoryId(Integer.parseInt(categoryId));
		}
		
		searchModel.setPriceCheck(0);
	    String priceCheck = request.getParameter("priceCheck");
	    if (!StringUtils.isEmpty(priceCheck)) {
			searchModel.setPriceCheck(Integer.parseInt(priceCheck));
		}
		
		searchModel.setSortOption(null);
		String sortOption = request.getParameter("sortOption");
		if (!StringUtils.isEmpty(sortOption)) {
			searchModel.setSortOption(sortOption);
		}
		
        if (!StringUtils.isEmpty(request.getParameter("currentPage"))) {
			searchModel.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
		} else {
			searchModel.setCurrentPage(1);
		}
        
        List<Product> allProducts = productService.searchProductInHome(searchModel);
        List<Product> products = new ArrayList<Product>();
        
        int totalPages = allProducts.size() / SIZE_OF_PRODUCT;
        if (allProducts.size() % SIZE_OF_PRODUCT > 0) {
			totalPages++;
		}
        
        if (totalPages <searchModel.getCurrentPage()) {
			searchModel.setCurrentPage(1);
		}
        
        int firstIndex = (searchModel.getCurrentPage() -1 ) * SIZE_OF_PRODUCT;
        int index = firstIndex, count = 0;
        while (index < allProducts.size() && count < SIZE_OF_PRODUCT) {
			products.add(allProducts.get(index));
			index++;
			count++;
		}
        
        searchModel.setSizeOfPage(SIZE_OF_PRODUCT);
        searchModel.setTotalItems(allProducts.size());

		List<Category> categories = categoryService.findAll();
		model.addAttribute("categories", categories);
		
//		List<Product> products = productService.searchProductInHome(searchModel);
		model.addAttribute("products", products);
		model.addAttribute("searchModel", searchModel);
		
		return "frontend/allproduct";
	}


}
