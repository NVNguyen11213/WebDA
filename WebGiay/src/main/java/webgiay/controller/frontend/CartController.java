package webgiay.controller.frontend;

import java.io.IOException;
import java.math.BigInteger;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import webgiay.controller.BaseController;
import webgiay.dto.Cart;
import webgiay.dto.Customer;
import webgiay.dto.Jw27Constants;
import webgiay.dto.ProductCart;
import webgiay.model.Product;
import webgiay.model.SaleOrder;
import webgiay.model.SaleOrderProduct;
import webgiay.service.ProductService;
import webgiay.service.SaleOrderService;

@Controller
public class CartController extends BaseController implements Jw27Constants {

	@Autowired
	private ProductService productService;

	@Autowired
	private SaleOrderService saleOrderService;
	

	@RequestMapping(value = "/add-to-cart", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> addToCart(final Model model, final HttpServletRequest request,
			@RequestBody ProductCart addProduct) throws IOException {
		
		
		HttpSession session = request.getSession();
		Cart cart = null;

		if (session.getAttribute("cart") != null) { 
			cart = (Cart) session.getAttribute("cart");
		} else { 
			cart = new Cart();
			session.setAttribute("cart", cart);
		}

		Product dbProduct = productService.getById(addProduct.getProductId());

		int index = cart.findProductById(dbProduct.getId());
		if (index != -1) { 
			cart.getProductCarts().get(index)
					.setQuantity(cart.getProductCarts().get(index).getQuantity().add(addProduct.getQuantity()));
		} else { // SAN PHAM CHUA CO TRONG GIO HANG
			addProduct.setProductName(dbProduct.getName());
			addProduct.setAvatar(dbProduct.getAvatar());
			addProduct.setPrice(dbProduct.getPrice());
			cart.getProductCarts().add(addProduct);// them san pham moi vao gio hang
		}

		session.setAttribute("cart", cart);

		Map<String, Object> jsonResult = new HashMap<String, Object>();
		jsonResult.put("code", 200);
		jsonResult.put("totalCartProducts", cart.totalCartProduct());
		jsonResult.put("message", "đã thêm sản phẩm " + addProduct.getProductName() + " vào giỏ hàng thành công!");

		return ResponseEntity.ok(jsonResult);
	}

	// Hiển thị view giỏ hàng
	@RequestMapping(value = "/cartview", method = RequestMethod.GET)
	public String cartView(final Model model, final HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("cart") != null) {
			Cart cart = (Cart) session.getAttribute("cart");
			model.addAttribute("totalCartPrice", cart.totalCartPrice());
			String message = "Có tổng cộng " + cart.totalCartProduct() + " sản phẩm trong giỏ hàng của bạn";
			model.addAttribute("message", message);
		} else {
			String errorMessage = "Không có sản phẩm nào trong giỏ hàng của bạn";
			model.addAttribute("errorMessage", errorMessage);
		}

		return "frontend/cartview";
	}
	
	// Them/bot so luong san pham trong gio hang
		@RequestMapping(value = "/update-product-quantity", method = RequestMethod.POST)

		public ResponseEntity<Map<String, Object>> updateProductQuantity(final HttpServletRequest request,
				@RequestBody ProductCart productCart) throws IOException {
			HttpSession session = request.getSession();
			Map<String, Object> jsonResult = new HashMap<String, Object>();
			if (session.getAttribute("cart") != null) {
				Cart cart = (Cart) session.getAttribute("cart");
				// Cap nhat so luong
				int index = cart.findProductById(productCart.getProductId());
				BigInteger oldQuantity = cart.getProductCarts().get(index).getQuantity();
				BigInteger newQuantity = oldQuantity.add(productCart.getQuantity()); // -/+
				if (newQuantity.intValue() < 1) {
					newQuantity = BigInteger.ONE;
				}
				cart.getProductCarts().get(index).setQuantity(newQuantity);
				jsonResult.put("newQuantity", newQuantity);
			}	
			jsonResult.put("productId", productCart.getProductId());
			// Tra ve du lieu cho view
			return ResponseEntity.ok(jsonResult);
		}

	@RequestMapping(value = "/place-order", method = RequestMethod.POST)
	ResponseEntity<Map<String, Object>> placeOrder(@RequestBody Customer customer, final HttpServletRequest request)
			throws IOException {

		Map<String, Object> jsonResult = new HashMap<String, Object>(); // Gửi lại view
		jsonResult.put("code", 200);
		if (StringUtils.isEmpty(customer.getTxtName())) {
			jsonResult.put("message", "Bạn chưa nhập họ tên");
		} else if (StringUtils.isEmpty(customer.getTxtMobile())) {
			jsonResult.put("message", "Bạn chưa nhập Số điện thoại");
		} else if (StringUtils.isEmpty(customer.getTxtEmail())) {
			jsonResult.put("message", "Bạn chưa nhập Email");
		} else if (StringUtils.isEmpty(customer.getTxtAddress())) {
			jsonResult.put("message", "Bạn chưa nhập địa chỉ");
		} else {
			HttpSession session = request.getSession();
			Cart cart = (Cart) session.getAttribute("cart");
			    if (cart == null || cart.totalCartProduct().equals(BigInteger.ZERO)) {
			    	jsonResult.put("message", "Bạn chưa có giỏ hàng");
			    } else {
//				Cart cart = (Cart) session.getAttribute("cart");

				SaleOrder saleOrder = new SaleOrder();
				for (ProductCart productCart : cart.getProductCarts()) {
					SaleOrderProduct saleOrderProduct = new SaleOrderProduct();
					Product dbProduct = productService.getById(productCart.getProductId());
					saleOrderProduct.setProduct(dbProduct);
					saleOrderProduct.setQuantity(productCart.getQuantity().intValue());

					saleOrder.addRelationalSaleOrderProduct(saleOrderProduct);

				}

				Calendar calendar = Calendar.getInstance();
				String code = customer.getTxtMobile() + calendar.get(Calendar.YEAR) + calendar.get(calendar.MONTH)
						+ calendar.get(calendar.DAY_OF_MONTH);

				saleOrder.setCode(code);

				
				//Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//				if (authentication != null && authentication.getPrincipal() instanceof User) {
//				    User user = (User) authentication.getPrincipal();
//				    saleOrder.setUser(user);
//				    saleOrder.setUserCreateSaleOrder(user);
//				} else {
//					User user = new User();
//					user.setId(1);
//					saleOrder.setUser(user);
//				}
				
				saleOrder.setCreateDate(new Date());
		
				saleOrder.setCustomerName(customer.getTxtName());
				saleOrder.setCustomerMobile(customer.getTxtMobile());
				saleOrder.setCustomerEmail(customer.getTxtEmail());
				saleOrder.setCustomerAddress(customer.getTxtAddress());

				saleOrder.setTotal(cart.totalCartPrice());

				saleOrderService.saveOrder(saleOrder);
				
				cart = new Cart();
				session.setAttribute("cart", cart);
		
				jsonResult.put("message", "Bạn đã đặt hàng thành công, cảm ơn bạn!");

			}
		}
		// Tra ve du lieu cho view
		return ResponseEntity.ok(jsonResult);
	}
	
	@RequestMapping(value = "/product-cart-delete/{productId}", method = RequestMethod.GET)
	public String deleteProductFromCart(@PathVariable("productId") int productId, 
			HttpServletRequest request) {
			HttpSession session = request.getSession();
			if (session.getAttribute("cart") != null) {
				Cart cart = (Cart) session.getAttribute("cart"); 
				
				int index = cart.findProductById(productId);
				
				if (index != -1) {
					cart.getProductCarts().remove(index);
				}
				
				session.setAttribute("cart", cart);
			}
			
			return "redirect:/cartview";
		}
}
