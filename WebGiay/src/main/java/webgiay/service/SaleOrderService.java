package webgiay.service;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import webgiay.dto.SearchModel;
import webgiay.model.SaleOrder;
import webgiay.model.User;

@Service
public class SaleOrderService extends BaseService<SaleOrder> {

	@Autowired
	private UserService userService;

	@Override
	public Class<SaleOrder> clazz() {
		return SaleOrder.class;
	}

	@Transactional
	public void inactiveSaleOrder(SaleOrder saleOrder) {
		super.saveOrUpdate(saleOrder);
	}

	@Transactional
	public SaleOrder saveOrder(SaleOrder saleOrder) {
		
		if (saleOrder.getUser() == null && saleOrder.getUserCreateSaleOrder() != null) {
			
			User user = userService.getById(saleOrder.getUserCreateSaleOrder().getId());
			
			saleOrder.setUser(user);
		}
		return super.saveOrUpdate(saleOrder);
	}

	public List<SaleOrder> findAll() {
		return super.executeNativeSql("SELECT * FROM tbl_sale_order");
	}

	public List<SaleOrder> findAllActive() {
		return super.executeNativeSql("SELECT * FROM tbl_sale_order WHERE status=1");
	}

	@Transactional
	public void deleteSaleOrderById(int id) {
		super.deleteById(id);
	}

	// -----------Search Sale Order------------
	public List<SaleOrder> searchOrder(SearchModel orderSearch) {
		// Tao cau lenh sql
		String sql = "SELECT * FROM tbl_sale_order s WHERE 1=1";

		// Tim kiem voi tieu chi status
		if (orderSearch.getStatus() != 2) { // Co chon chưa giao hàng/ đã giao hàng
			sql += " AND s.status=" + orderSearch.getStatus();
		}

		// Tim kiem voi keyword
		if (!StringUtils.isEmpty(orderSearch.getKeyword())) {
			String keyword = orderSearch.getKeyword().toLowerCase();

			sql += " AND (s.code LIKE '%" + keyword + "%'" + " OR LOWER(s.customer_name) LIKE '%" + keyword + "%'"
					+ " OR LOWER(s.customer_address) LIKE '%" + keyword + "%')";
		}

		// Tim kiem voi ngay thang
		if (!StringUtils.isEmpty(orderSearch.getBeginDate()) && !StringUtils.isEmpty(orderSearch.getEndDate())) {
			String beginDate = orderSearch.getBeginDate();
			String endDate = orderSearch.getEndDate();

			sql += " AND s.create_date BETWEEN '" + beginDate + "' AND '" + endDate + "'";
		}

		return super.executeNativeSql(sql);
	}
	public List<BigDecimal> getMoneyByMonths(int year) {
	    List<BigDecimal> dashboardRevenue = new ArrayList<>();

	    for (int i = 1; i <= 12; i++) {
	        BigDecimal revenue = (BigDecimal) entityManager
	            .createNativeQuery("SELECT COALESCE(SUM(total), 0) FROM tbl_sale_order WHERE status = 1 AND YEAR(create_date) = :year AND MONTH(create_date) = :month")
	            .setParameter("year", year)
	            .setParameter("month", i)
	            .getSingleResult();
	        dashboardRevenue.add(revenue);
	    }
	    return dashboardRevenue;
	}

}
