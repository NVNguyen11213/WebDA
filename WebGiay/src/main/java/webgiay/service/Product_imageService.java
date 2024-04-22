package webgiay.service;

import java.util.List;

import org.springframework.stereotype.Service;

import webgiay.model.Product_image;



@Service
public class Product_imageService extends BaseService<Product_image> {
	@Override
	public Class<Product_image> clazz(){
		return Product_image.class;
	}
	
	public List<Product_image> getProductImagesByProductIdImages(int productId) {
		String sql = "SELECT * FROM tbl_product_image WHERE product_id=" + productId;
		return super.executeNativeSql(sql);
	}
}
