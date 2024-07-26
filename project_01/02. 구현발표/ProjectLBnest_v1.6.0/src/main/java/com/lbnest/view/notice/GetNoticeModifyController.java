package com.lbnest.view.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lbnest.loan.notice.NoticeService;
import com.lbnest.loan.notice.NoticeVO;

@Controller
public class GetNoticeModifyController {
	//게시글 수정하기
	@Autowired
	private NoticeService  noticeService;
	
	@RequestMapping("/getNoticeModify.do")
	public ModelAndView getNotice(NoticeVO vo, ModelAndView mav) {
		mav.addObject("notice", noticeService.getNotice(vo));
		mav.setViewName("./notice/getNoticeAdmin.jsp");
		return mav;
	}
}