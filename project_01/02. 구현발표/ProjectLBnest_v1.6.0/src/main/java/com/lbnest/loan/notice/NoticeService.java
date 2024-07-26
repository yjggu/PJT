package com.lbnest.loan.notice;

import java.util.List;

public interface NoticeService {

	void insertNotice(NoticeVO vo);
	
	void updateNotice(NoticeVO vo);
	
	void deleteNotice(NoticeVO vo);
	
	NoticeVO getNotice(NoticeVO vo);

	List<NoticeVO> getNoticeList(NoticeVO vo);
		
	int countNotices(NoticeVO vo);
}
