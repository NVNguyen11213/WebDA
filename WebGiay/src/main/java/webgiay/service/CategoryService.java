package webgiay.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import webgiay.model.Category;

@Service
public class CategoryService extends BaseService<Category> {
	@Override
	public Class<Category> clazz() {
		return Category.class;
	}
	
	public List<Category> findAllActive() {
		return super.executeNativeSql("SELECT * FROM tbl_category WHERE status=1");
	}
	
	@Transactional
	public void deleteCategoryById(int id) {
		super.deleteById(id);
	}
	
	@Transactional
	public void inactiveCategory(Category category) {
		super.saveOrUpdate(category);
	}
}
