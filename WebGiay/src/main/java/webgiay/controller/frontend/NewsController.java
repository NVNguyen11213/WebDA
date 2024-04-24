package webgiay.controller.frontend;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class NewsController {
	@RequestMapping(value = "/news", method = RequestMethod.GET)
	public String contact(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		return "frontend/news";
	}
}
