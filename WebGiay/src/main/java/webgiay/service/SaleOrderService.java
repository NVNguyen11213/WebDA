package webgiay.service;

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
		// Kiểm tra và thiết lập giá trị cho trư�?ng user trước khi lưu
		if (saleOrder.getUser() == null && saleOrder.getUserCreateSaleOrder() != null) {
			// Lấy thông tin ngư�?i dùng từ UserService (hoặc từ nguồn dữ liệu phù hợp)
			User user = userService.getById(saleOrder.getUserCreateSaleOrder().getId());
			// Thiết lập giá trị user cho saleOrder
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
}
