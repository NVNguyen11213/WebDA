package webgiay.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import webgiay.model.News;

@Service
public class NewsService extends BaseService<News>{
	@Override
	public Class<News> clazz(){
		return News.class;
	}

	public List<News> findAllActive(){
		return super.executeNativeSql("SELECT * FROM tbl_news WHERE status =1" );
	}
	
	@Transactional
	public void deleteNewsById(int id) {
		super.deleteById(id);
	}
	
	@Transactional
	public void inactiveNews(News news) {
		super.saveOrUpdate(news);
	}
	public News getNewsByName(String newsName) {
		
		String sql = "SELECT * FROM tbl_news WHERE name = '" + newsName + "'";
		List<News> news = super.executeNativeSql(sql);
		
		if (news.size() > 0) {
			return news.get(0);
		}
		
		else {
			return new News();
		}
	}
}
