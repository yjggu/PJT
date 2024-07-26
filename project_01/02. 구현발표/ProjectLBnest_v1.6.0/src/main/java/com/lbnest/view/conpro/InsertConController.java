package com.lbnest.view.conpro;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lbnest.loan.consult.ConService;
import com.lbnest.loan.consult.ConVO;

@Controller
public class InsertConController {

	@Autowired
	private ConService conService;

	public InsertConController(ConService conService) {
		System.out.println("InsertCon");
	}

	@RequestMapping("/conpro/insertCon.do")
	public String insertCon(@RequestParam("r_name") String r_name, 
			@RequestParam("r_phone") String r_phone,
			@RequestParam("r_check") String r_check,
			@RequestParam(value = "r_date", required = false) String r_date, 												
			@RequestParam("r_category") String r_category,
			@RequestParam("r_memo") String r_memo,
			RedirectAttributes redirectAttributes) throws IOException {

		ConVO vo = new ConVO();
		vo.setR_name(r_name);
		vo.setR_phone(r_phone);
		vo.setR_check(r_check);

		if (r_date != null && !r_date.isEmpty()) { 
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
			LocalDateTime localDateTime = LocalDateTime.parse(r_date, formatter);
			Timestamp timestamp = Timestamp.valueOf(localDateTime);
			vo.setR_date(timestamp.toString()); 
		}

		vo.setR_category(r_category);
		vo.setR_memo(r_memo);

		conService.insertCon(vo);

		return "success.jsp";
	}

}

//硫��� 蹂대�닿린
//		if (vo != null) {
//			try {
//				String to = "jyj0225@naver.com";
//				String subject = "���댁��泥�";
//				/* String text = "��濡��� ���댁��泥� �댁�⑹�� ���듬����."; */
//				EmailUtil.sendEmail(to, subject);
//
//			} catch (Exception e) {
//				System.out.println("Error message: " + e.getMessage());
//			}
//
//		}
//@RequestMapping(value = "/insertCon.do", method = RequestMethod.POST)
//public String insertCon(ConVO vo) throws IOException {
//    conService.insertCon(vo);
//    return "conpro/success.jsp";
//}	
