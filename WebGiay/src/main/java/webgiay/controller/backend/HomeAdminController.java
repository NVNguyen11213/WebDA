package webgiay.controller.backend;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import webgiay.controller.BaseController;
import webgiay.model.SaleOrder;
import webgiay.model.SaleOrderProduct;
import webgiay.model.User;
import webgiay.service.SaleOrderProductService;
import webgiay.service.SaleOrderService;
import webgiay.service.UserService;

@Controller
@RequestMapping("/admin/")
public class HomeAdminController extends BaseController {

	@Autowired
	private UserService userService;

	@Autowired
	private SaleOrderService saleOrderService;

	@Autowired
	private SaleOrderProductService saleOrderProductService;

	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String home(final Model model, final HttpServletRequest request) {

		List<SaleOrderProduct> saleOrderProducts = saleOrderProductService.findAllActive();
		int totalProducts = 0;
		for (SaleOrderProduct saleOrderProduct : saleOrderProducts) {
			totalProducts += saleOrderProduct.getQuantity();
		}

		model.addAttribute("totalProducts", totalProducts);

		List<SaleOrder> saleOrders = saleOrderService.findAll();
		int orders = saleOrders.size();
		model.addAttribute("orders", orders);

		BigDecimal totalSales = BigDecimal.ZERO;

		for (SaleOrder saleOrder : saleOrders) {
			BigDecimal orderTotal;

			if (saleOrder.getTotal() == null) {
				orderTotal = BigDecimal.ZERO;
			} else {
				orderTotal = saleOrder.getTotal();
			}

			totalSales = totalSales.add(orderTotal);
		}
		model.addAttribute("totalSales", totalSales);

		List<User> users = userService.findAllUsers();
		int visitors = users.size();
		model.addAttribute("visitors", visitors);

		// Thống kê doanh thu theo tháng từ cơ sở dữ liệu
		List<BigDecimal> dashboardRevenue = saleOrderService.getMoneyByMonths(LocalDate.now().getYear());
		// System.out.println(dashboardRevenue);
		// Đưa dữ liệu vào model
		model.addAttribute("dashboardRevenue", dashboardRevenue);
		
		return "backend/index";
	}
}
