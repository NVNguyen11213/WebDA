package webgiay.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import webgiay.dto.Jw27Constants;
import webgiay.dto.SearchModel;
import webgiay.model.Product;
import webgiay.model.Product_image;

@Service
public class ProductService extends BaseService<Product> implements Jw27Constants {
	@Override
	public Class<Product> clazz() {
		return Product.class;
	}

	public List<Product> findAllActive() {
		return super.executeNativeSql("SELECT * FROM tbl_product WHERE status=1");
	}
	
	public List<Product> findAllActiveAndIsHot() {
		return super.executeNativeSql("SELECT * FROM tbl_product WHERE status=1 AND is_hot = 1");
	}

	// Phương thức kiểm tra (1) file có được upload hay không?
	public boolean isUploadFile(MultipartFile file) {
		// file null hoặc tên file rỗng
		if (file == null || file.getOriginalFilename().isEmpty()) { 
			return false; // Không upload
		}
		return true; // Có upload
	}

	// Phương thức kiểm tra (2) danh sách file có upload file nào không?
	public boolean isUploadFiles(MultipartFile[] file) {
		// không có file nào được upload
		if (file == null || file.length == 0) {
			return false; // Không upload file
		}
		return true; // Có upload it nhất 1 file
	}

	// --------------------------Save new product to
	// database--------------------------------
	@Transactional
	public Product saveAddProduct(Product product, MultipartFile avatarFile, MultipartFile[] imageFiles)
			throws IOException {
		// Lưu avatar vào file
		if (isUploadFile(avatarFile)) {
			// Lưu file vào thư mục Product/Avatar
			String path = FOLDER_UPLOAD + "Product/Avatar/" + avatarFile.getOriginalFilename();
			File file = new File(path);
			avatarFile.transferTo(file);
			// Lưu đư�?ng dẫn vào bảng tbl_product
			product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
		}

		// Lưu images vào file
		if (isUploadFiles(imageFiles)) { // Có upload danh sách ảnh
			// Duyệt danh sách file images
			for (MultipartFile imageFile : imageFiles) {
				if (isUploadFile(imageFile)) { // File có upload
					// Lưu file vào thư mục Product/Image/
					String path = FOLDER_UPLOAD + "Product/Image/" + imageFile.getOriginalFilename();
					File file = new File(path);
					imageFile.transferTo(file);

					// Lưu file vào thư mục Product/image
					Product_image product_image = new Product_image();
					product_image.setTitle(imageFile.getOriginalFilename());
					product_image.setPath("Product/Image/" + imageFile.getOriginalFilename());
					product_image.setStatus(Boolean.TRUE);
					product_image.setCreateDate(new Date());

					// Lưu đư�?ng dẫn ảnh sang bảng tbl_product_image
					product.addRelationalProductImage(product_image);
				}
			}
		}

		return super.saveOrUpdate(product);
	}

	// Save edit product
	@Transactional
	public Product saveEditProduct(Product product, MultipartFile avatarFile, MultipartFile[] imageFiles)
			throws IOException {
		// Lay produc trong db
		Product dbProduct = super.getById(product.getId());
		// Luu avatar file moi neu nguoi dung co upload avatar
		if (isUploadFile(avatarFile)) { // Co upload file avatar

			// Xoa avatar cu (Xoa file avatar)
			String path = FOLDER_UPLOAD + dbProduct.getAvatar();
			File file = new File(path);
			file.delete();
 
			// Lưu file avatar mới vào thư mực Product/Avatar
			path = FOLDER_UPLOAD + "Product/Avatar/" + avatarFile.getOriginalFilename();
			file = new File(path);
			avatarFile.transferTo(file);
			// Lưu đư�?ng dẫn của avatar mới vào bảng tbl_product
			product.setAvatar("Product/Avatar/" + avatarFile.getOriginalFilename());
		} else { // Ngư�?i dùng không upload avatar file
			// giữ nguyên avatar cũ
			product.setAvatar(dbProduct.getAvatar());
		}
		// Luu images file
		if (isUploadFiles(imageFiles)) { // Có upload danh sách ảnh
			// Duyệt qua danh sách file images
			for (MultipartFile imageFile : imageFiles) { 
				if (isUploadFile(imageFile)) { // FIle có upload
					// Lưu file vào thư mục Product/Image
						
					String path = FOLDER_UPLOAD + "Product/Image/" + imageFile.getOriginalFilename();
					File file = new File(path);
					imageFile.transferTo(file);
					
					// Lưu đư�?ng dẫn vào tbl_product_image
					Product_image product_image = new Product_image();
					product_image.setTitle(imageFile.getOriginalFilename());
					product_image.setPath("Product/Image/" + imageFile.getOriginalFilename());
					product_image.setStatus(Boolean.TRUE);
					product_image.setCreateDate(new Date());

					// Lưu (đối tượng product image) đư�?ng dẫn ảnh sang bảng tbl_product_image
					product.addRelationalProductImage(product_image);
				}
			}
		}
		return super.saveOrUpdate(product);
	}

////////////////////////////DELETE PRODUCT///////
	@Autowired
	private Product_imageService product_imageService;

	@Transactional
	public void deleteProduct(Product product) {
// +Lay danh sach anh cua product ttrong tbl_product_image
		String sql = "select * from tbl_product_image where product_id = " + product.getId();
		List<Product_image> product_images = product_imageService.executeNativeSql(sql);

		// Xoa lan luot cac anh cua product trong Product/image vaf
		// Xoa lan luot cac duong dan cua anh trong tbl_product_image
		for (Product_image product_image : product_images) {
			// Xóa file trong thư mục Product image trước
			String path = FOLDER_UPLOAD + product_image.getPath();
			File file = new File(path);
			file.delete();

			// Xoa ban ghi thong tin anh trong tbl_product_image
//			product.removeRelationalProductImage(product_image);
		}

		// Xoa file avatar trong thu muc Product/Avatar
		String path = FOLDER_UPLOAD + product.getAvatar();
		File file = new File(path);
		file.delete();

		super.delete(product);
	}

	@Transactional
	public void deleteProductById(int id) {
		super.deleteById(id);
	}

	//
	@Transactional
	public void inactiveProduct(Product product) {
		super.saveOrUpdate(product);
	}

	// -----------------------------searchProduct----------------------------
	public List<Product> searchProduct(SearchModel productSearch) {
		// Tao cau lenh sql;
		String sql = "SELECT * FROM tbl_product p WHERE 1=1";

		// Tim kiem voi status
		if (productSearch.getStatus() != 2) { // Có ch�?n Active/Inactive
			sql += " AND p.status=" + productSearch.getStatus();
		}

		// Tim kiem voi status
		if (productSearch.getCategoryId() != 0) {
			sql += " AND p.category_id=" + productSearch.getCategoryId();
		}

		// Tim kiem voi keyword
		if (!StringUtils.isEmpty(productSearch.getKeyword())) {
			String keyword = productSearch.getKeyword().toLowerCase();

			sql += " AND (LOWER(p.name) like '%" + keyword + "%'" + " OR LOWER(p.short_description) like '%" + keyword
					+ "%'" + " OR LOWER(p.seo) like '%" + keyword + "%')";
		}

		// Tim kiem voi ngay thang
		if (!StringUtils.isEmpty(productSearch.getBeginDate()) && !StringUtils.isEmpty(productSearch.getEndDate())) {
			String beginDate = productSearch.getBeginDate();
			String endDate = productSearch.getEndDate();

			sql += " AND p.create_date BETWEEN '" + beginDate + "' AND '" + endDate + "'";
		}
		return super.executeNativeSql(sql);
	}

	// -----------------------------searchProduct----------------------------
	public List<Product> searchProductInHome(SearchModel searchModel) {
		// Tạo câu lệnh SQL
		String sql = "SELECT * FROM tbl_product p WHERE 1=1 AND p.status=1";

		if (searchModel.getCategoryId() != 0) {
			sql += " AND p.category_id = " + searchModel.getCategoryId();
		}

		// Tim kiem voi keyword
		if (!StringUtils.isEmpty(searchModel.getKeyword())) {
			String keyword = searchModel.getKeyword().toLowerCase();

			sql += " AND (LOWER(p.name) like '%" + keyword + "%'" + " OR LOWER(p.short_description) like '%" + keyword
					+ "%'" + " OR LOWER(p.seo) like '%" + keyword + "%')";
		}
		
		// Checkbox giá từ minPrice đến maxPrice
		if (searchModel.getPriceCheck() != 0) {
			switch (searchModel.getPriceCheck()) {
			case 1:
				sql += " AND p.price BETWEEN 0 AND 100";
				break;
			case 2:
				sql += " AND p.price BETWEEN 100 AND 500";
				break;
			case 3:
				sql += " AND p.price BETWEEN 500 AND 1000";
				break;
			case 4:
				sql += " AND p.price >= 1000";
				break;
			default:
				break;
			}
		}
		
		// Sắp xếp sản phẩm theo tùy ch�?n
		if (searchModel.getSortOption() != null && !searchModel.getSortOption().isEmpty()) {
			switch (searchModel.getSortOption()) {
			case "nameASC": // Sắp xếp theo tên tăng dần
				sql += " ORDER BY LOWER(p.name) COLLATE utf8mb4_unicode_ci ASC";
				break;
			case "nameDESC": // Sắp xếp theo tên giảm dần
				sql += " ORDER BY LOWER(p.name) COLLATE utf8mb4_unicode_ci DESC";
				break;
			case "priceASC": // Sắp xếp theo giá tăng dần
				sql += " ORDER BY p.price ASC";
				break;
			case "priceDESC": // Sắp xếp theo giá giảm dần
				sql += " ORDER BY p.price DESC";
				break;
			default:
				break;
			}
		}
		
		return super.executeNativeSql(sql);
	}

//	public List<Product> findByPriceRange(String[] priceRanges) {
//		// Tạo câu lệnh SQL
//		StringBuilder sql = new StringBuilder("SELECT * FROM tbl_product p WHERE 1=1 AND p.status=1");
//
//		// Tạo danh sách các giá trị mức giá được ch�?n
//		List<String> selectedPriceRanges = new ArrayList<>();
//		for (String priceRange : priceRanges) {
//			selectedPriceRanges.add(priceRange);
//		}
//
//		// Thêm các đi�?u kiện vào câu lệnh SQL dựa trên các mức giá được ch�?n
//		for (String selectedPriceRange : selectedPriceRanges) {
//			String[] priceRangeValues = selectedPriceRange.split("-");
//			if (priceRangeValues.length == 2) {
//				// Nếu mức giá là khoảng, thêm đi�?u kiện BETWEEN vào câu lệnh SQL
//				sql.append(" AND p.price BETWEEN ").append(priceRangeValues[0]).append(" AND ")
//						.append(priceRangeValues[1]);
//			} else if (priceRangeValues.length == 1) {
//				// Nếu mức giá là một giá trị cụ thể, thêm đi�?u kiện = vào câu lệnh SQL
//				sql.append(" AND p.price >= ").append(priceRangeValues[0]);
//			}
//		}
//
//		return super.executeNativeSql(sql.toString());
//	}

}
