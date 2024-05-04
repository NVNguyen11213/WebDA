package webgiay.controller.backend;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import webgiay.controller.BaseController;
import webgiay.dto.Jw27Constants;
import webgiay.dto.SearchModel;
import webgiay.model.News;
import webgiay.model.User;
import webgiay.service.NewsService;
import webgiay.service.UserService;

@Controller
@RequestMapping("/admin/news/")
public class NewsAdminController extends BaseController implements Jw27Constants{

	@Autowired
	private NewsService newsService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(final Model model, 
			HttpServletRequest request) {
		
		SearchModel newsSearch = new SearchModel();
		
		if (!StringUtils.isEmpty(request.getParameter("currentPage"))) {
			newsSearch.setCurrentPage(Integer.parseInt(request.getParameter("currentPage")));
		}
		else {
			newsSearch.setCurrentPage(1);
		}
		
		List<News> AllNews = newsService.findAll();
		List<News> news = new ArrayList<News>();
		
		//Tong so trang theo tim kiem
		int totalPages = AllNews.size() / SIZE_OF_PAGE;
		if (AllNews.size() % SIZE_OF_PAGE > 0) {
			totalPages++;
		}
		
		//Lay danh sach sp can hien thi trong 1 trang
		int firstIndex = (newsSearch.getCurrentPage() - 1) * SIZE_OF_PAGE;
		int index = firstIndex, count = 0;
		while(index < AllNews.size() && count < SIZE_OF_PAGE) {
			news.add(AllNews.get(index));
			index++;
			count++;
		}
		
		newsSearch.setSizeOfPage(SIZE_OF_PAGE);
		newsSearch.setTotalItems(AllNews.size());
		
		model.addAttribute("news", news);
		model.addAttribute("newsSearch", newsSearch);
		
		return "backend/news-list";
	}
	
	@RequestMapping(value = "add", method = RequestMethod.GET)
	// Cách đẩy 1 dữ liệu sang view
	public String add(final Model model) {

		List<User> users = userService.findAll();
		model.addAttribute("users", users);

		News news = new News();
		news.setCreateDate(new Date());

		model.addAttribute("news", news);
		return "backend/news-add";
	}
	@RequestMapping(value = "add-save", method = RequestMethod.POST)
	// Cách đẩy 1 dữ liệu sang view
	public String addSave(final Model model, @ModelAttribute("news") News news) {

		newsService.saveOrUpdate(news);
		return "redirect:/admin/news/add";
	}

	// Viet Action cua edit news
	@RequestMapping(value = "edit/{newsId}", method = RequestMethod.GET)
	// Cách đẩy 1 dữ liệu sang view
	public String edit(final Model model, @PathVariable("newsId") int newsId) {

		List<User> users = userService.findAll();
		model.addAttribute("users", users);

		// Lấy News trong DB bằng Id
		News news = newsService.getById(newsId);

		model.addAttribute("news", news);
		return "backend/news-edit";
	}

	// SAVE EDIT News
	@RequestMapping(value = "edit-save", method = RequestMethod.POST)
	// Cách đẩy 1 dữ liệu sang view
	public String editSave(final Model model, @ModelAttribute("news") News news) {

		newsService.saveOrUpdate(news);
		return "redirect:/admin/news/list";
	}


	// TH: inactive 
	@RequestMapping(value = "delete/{newsId}", method = RequestMethod.GET)
	// Cách đẩy 1 dữ liệu sang view
	public String delete(final Model model, @PathVariable("newsId") int newsId) {
		// Lấy news trong DB bằng Id
		News news = newsService.getById(newsId);
		news.setStatus(false);
		newsService.inactiveNews(news);
		
		return "redirect:/admin/news/list";
	}
}
