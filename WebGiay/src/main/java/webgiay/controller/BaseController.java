package webgiay.controller;

import java.math.BigInteger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.ModelAttribute;

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
	
	
}
