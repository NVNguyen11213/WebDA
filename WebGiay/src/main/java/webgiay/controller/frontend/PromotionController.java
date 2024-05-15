package webgiay.controller.frontend;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import webgiay.service.ProductService;
import webgiay.controller.BaseController;
import webgiay.model.Product;

@Controller
public class PromotionController extends BaseController{
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/Promotion", method = RequestMethod.GET)
	
	public String index(final Model model,
			final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		List<Product> SaleProducts = productService.findAllActiveAndPromotion();
		model.addAttribute("SaleProducts", SaleProducts);
		model.addAttribute("discountsForAllProducts", calculateDiscounts(SaleProducts));
			
		return "frontend/Promotion";
	}
}
