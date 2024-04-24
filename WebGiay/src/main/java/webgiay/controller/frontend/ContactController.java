package webgiay.controller.frontend;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import webgiay.controller.BaseController;
import webgiay.dto.Contact;
import webgiay.dto.Jw27Constants;

@Controller
public class ContactController extends BaseController implements Jw27Constants{
	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		return "frontend/contact";
	}
	
	@RequestMapping(value = "/contact-send", method = RequestMethod.POST)
	public String contactSend(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		
		Contact contact = new Contact();
		contact.setTxtName(request.getParameter("txtName"));
		System.out.println("Name: " + contact.getTxtName());
		return "frontend/contact";
	}
	
}
