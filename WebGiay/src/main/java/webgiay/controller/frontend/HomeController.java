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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import webgiay.controller.BaseController;
import webgiay.dto.Jw27Constants;
import webgiay.dto.SearchModel;
import webgiay.model.Product;
import webgiay.model.Product_image;
import webgiay.service.ProductService;
import webgiay.service.Product_imageService;

@Controller
public class HomeController extends BaseController implements Jw27Constants {
	@Autowired
	private ProductService productService;

	@Autowired
	private Product_imageService product_imageService;
	
//	@RequestMapping(value="/index", method = RequestMethod.GET)
//	// @RequestMapping : Anh xa mot action den mot action method trong controller
//	public String index(final Model model,
//			final HttpServletRequest request,
//			final HttpServletResponse response) throws IOException{
//		List<Product> products = productService.findAllActive();
//		model.addAttribute("products",products);
//		return "frontend/index";
//	}
	@RequestMapping(value = "index", method = RequestMethod.GET)

	public String list(final Model model, final HttpServletRequest request) {

		SearchModel searchProduct = new SearchModel();

		// Tim theo key
		searchProduct.setKeyword(null);
		String keyword = request.getParameter("keyword");
		if (!StringUtils.isEmpty(keyword)) {
			searchProduct.setKeyword(keyword);
		}

		// Bat dau phan trang
		if (!StringUtils.isEmpty(request.getParameter("currentPage"))) { // Bam nut chuyen trang
			searchProduct.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
		} else {
			searchProduct.setCurrentPage(1); // lan dau truy cap luon hien thi trang 1
		}

		List<Product> allProducts = productService.searchProductInHome(searchProduct);// Tim kiem

		List<Product> products = new ArrayList<Product>(); // DS sp can hien thi trang hien tai

		// Tong so trang theo tim kiem
		int totalPages = allProducts.size() / SIZE_OF_INDEX;
		if (allProducts.size() % SIZE_OF_INDEX > 0) {
			totalPages++;
		}

		// Neu tong so trang < trang hien tai (lai bam tim kiem)
		if (totalPages < searchProduct.getCurrentPage()) {
			searchProduct.setCurrentPage(1);
		}

		// Lay danh sach sp can hien thi trong 1 trang
		int firstIndex = (searchProduct.getCurrentPage() - 1) * SIZE_OF_INDEX;
		int index = firstIndex, count = 0;
		while (index < allProducts.size() && count < SIZE_OF_INDEX) {
			products.add(allProducts.get(index));
			index++;
			count++;
		}

		// Phan trang
		searchProduct.setSizeOfPage(SIZE_OF_INDEX); // So ban ghi tren 1 trang
		searchProduct.setTotalItems(allProducts.size()); // Tong so san pham theo tim kiem

		// Lấy ra danh sách sản phẩm isHot
	    List<Product> isHotProducts = productService.findAllActiveAndIsHot();
	    model.addAttribute("isHotProducts", isHotProducts);
	    model.addAttribute("discountsForHotProducts", calculateDiscounts(isHotProducts));
	    
	    List<Product> SaleProducts = productService.findAllActiveAndPromotion();
		model.addAttribute("SaleProducts", SaleProducts);
		model.addAttribute("discountsForAllProducts", calculateDiscounts(SaleProducts));
		
		
		
		// List<Product> products = productService.searchProduct(productSearch);
		model.addAttribute("products", products);
		model.addAttribute("productSearch", searchProduct);
		model.addAttribute("discountsForAllProducts", calculateDiscounts(products));

		return "frontend/index"; // --> Brownser
	}

	@RequestMapping(value = "/product-detail/{productId}", method = RequestMethod.GET)

	public String productDetail(final Model model, 
			final HttpServletRequest request, 
			final HttpServletResponse response,
			@PathVariable("productId") int productId) throws IOException {

		Product product = productService.getById(productId);
		model.addAttribute("product", product);
		
		List<String> sizes = productService.getSizesForProduct(productId);
		model.addAttribute("sizes", sizes);
		
		List<Product_image> product_images = product_imageService.getProductImagesByProductIdImages(productId);
		model.addAttribute("productImages", product_images);		
		return "frontend/product-detail";

	}
}