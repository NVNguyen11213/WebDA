package webgiay.controller;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.ModelAttribute;

import webgiay.model.Product;
import webgiay.dto.Cart;
import webgiay.model.User;

@Configuration
public class BaseController {
	@ModelAttribute("title")
	public String projectTitle() {
		return "THUONGDINH Shop";
	}

	@ModelAttribute("totalCartProducts")
	public BigInteger getTotalCartProducts(final HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("cart") == null) {
			return BigInteger.ZERO;
		}

		Cart cart = (Cart) session.getAttribute("cart");
		return cart.totalCartProduct();
	}
	
	//Lấy thông tin của user đăng nhập
		@ModelAttribute("loginedUser")
		public User getLogined() {
			Object loginedUser = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(loginedUser != null && loginedUser instanceof UserDetails) {
				User user = (User) loginedUser;
				return user;
			}
			return new User();
		}
		
	@ModelAttribute("cart")
    public Cart getCart(final HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session.getAttribute("cart") == null) {
            Cart cart = new Cart();
            session.setAttribute("cart", cart);
            return cart;
        }
        return (Cart) session.getAttribute("cart");
    }
	@ModelAttribute("isLogined")
	public boolean isLogined() {
		Object loginedUser =  SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if(loginedUser != null && loginedUser instanceof User) {
			return true;
		}
		return false;
	}
	
	public List<BigDecimal> calculateDiscounts(List<Product> products) {
	    List<BigDecimal> discounts = new ArrayList<>();
	    for (Product product : products) {
	        BigDecimal discount = BigDecimal.ZERO;
	        if (product.getPrice() != null && product.getSalePrice() != null &&
	                product.getPrice().compareTo(BigDecimal.ZERO) > 0 &&
	                product.getSalePrice().compareTo(BigDecimal.ZERO) > 0) {
	            BigDecimal val = product.getPrice().subtract(product.getSalePrice());
	            discount = val.divide(product.getPrice(), 2, RoundingMode.HALF_UP)
	                    .multiply(BigDecimal.valueOf(100));
	        }
	        discounts.add(discount);
	    }
	    return discounts;
	}
}
