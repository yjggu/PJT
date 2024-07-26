package com.lbnest.view.notice;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lbnest.loan.notice.NoticeVO;
import com.lbnest.loan.notice.impl.NoticeDAO;

@Controller
public class GetNoticeListController {
	//공지사항 리스트 불러오며 페이징 처리
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목","N_TITLE");
		conditionMap.put("내용","N_CONTENT");

		return conditionMap;
	}

    @RequestMapping("/getNoticeList.do")
	public String getNoticeList(NoticeVO vo, NoticeDAO noticeDAO, Model model,
			//한페이지씩 처리
			@RequestParam(value = "page", defaultValue = "1") int page,
             //페이지에 나오는 게시글 수를 처리 -> 디폴트벨류를 바꾸면 됨
			 @RequestParam(value = "size", defaultValue = "5") int size) {
		//검색조건과 검색어가 비어 있는지 체크하는 부분
		if(vo.getSearchCondition() == null) 
			vo.setSearchCondition("N_TITLE");
		  if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
		 
		//페이징 관련 설정
		 int start = (page - 1) * size;
	        vo.setStart(start);
	        vo.setSize(size);

		//검색조건이 입력되면 수행 
		model.addAttribute("noticeList", noticeDAO.getNoticeList(vo));
		
		model.addAttribute("currentPage", page);
        model.addAttribute("pageSize", size);
        model.addAttribute("totalPages", (int) Math.ceil((double) noticeDAO.countNotices(vo) / size));
        
		return "./notice/NoticeList.jsp";
	}

}
