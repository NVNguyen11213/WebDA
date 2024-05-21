package webgiay.controller.frontend;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import webgiay.service.CustomerContactService;
import webgiay.model.CustomerContact;
import webgiay.controller.BaseController;
import webgiay.dto.Contact;
import webgiay.dto.Jw27Constants;

@Controller
public class ContactController extends BaseController implements Jw27Constants{
	
	@Autowired
	private CustomerContactService customerContactService;
	
	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String contact(final Model model, final HttpServletRequest request, final HttpServletResponse response)
			throws IOException {
		return "frontend/contact";
	}
	
	@RequestMapping(value = "/contact-send", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> contactEditSave(final Model model, 
			final HttpServletRequest request, 
			final HttpServletResponse response,
			@RequestBody Contact contact)
			throws IOException {
		
		//Sau khi lưu giữ liệu vào DB;
		Map<String, Object> jsonResult = new HashMap<String, Object>(); // Gửi trở lại view
		jsonResult.put("code", 200);
		if (StringUtils.isEmpty(contact.getTxtName())) {
			jsonResult.put("errorMessage", "Bạn chưa nhập họ tên");
		} else if (StringUtils.isEmpty(contact.getTxtMobile())) {
			jsonResult.put("errorMessage", "Bạn chưa nhập Số điện thoại");
		} else if (StringUtils.isEmpty(contact.getTxtEmail())) {
			jsonResult.put("errorMessage", "Bạn chưa nhập Email");
		} else if (StringUtils.isEmpty(contact.getTxtAddress())) {
			jsonResult.put("errorMessage", "Bạn chưa nhập địa chỉ");
		} else {
			CustomerContact customerContact = new CustomerContact();
			customerContact.setStatus(true);
			customerContact.setCreateDate(new Date());
			customerContact.setName(contact.getTxtName());
			customerContact.setMobile(contact.getTxtMobile());
			customerContact.setEmail(contact.getTxtEmail());
			customerContact.setAddress(contact.getTxtAddress());
			customerContact.setMessage(contact.getTxtMessage());
			
			customerContactService.saveOrUpdate(customerContact);
			jsonResult.put("message", "Cảm ơn " + contact.getTxtName() + " đã gửi thông tin phản hồi");
			
			//Xóa
			customerContact = new CustomerContact();
		}
		
		return ResponseEntity.ok(jsonResult);
	
	}
	
}
