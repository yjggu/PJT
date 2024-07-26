package com.lbnest.view.notice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lbnest.loan.notice.NoticeService;
import com.lbnest.loan.notice.NoticeVO;
import com.lbnest.loan.notice.impl.NoticeDAO;

@Controller
public class DeleteNoticeController {

	@Autowired
	private NoticeService noticeService;

	@RequestMapping("/deleteNotice.do")
	public String deleteNotice(NoticeVO vo, NoticeDAO noticeDAO) {

		noticeService.deleteNotice(vo);
		return "getNoticeList.do";
	}
}
