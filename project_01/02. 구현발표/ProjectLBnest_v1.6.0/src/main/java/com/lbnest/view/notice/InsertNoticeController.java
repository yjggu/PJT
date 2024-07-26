package com.lbnest.view.notice;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.lbnest.loan.notice.NoticeService;
import com.lbnest.loan.notice.NoticeVO;

@Controller
@RequestMapping("/notice")
public class InsertNoticeController {
	//게시글을 입력하는 로직
	@Autowired
	private NoticeService noticeService;

	@RequestMapping("/insertNotice.do")
	public String insertNotice(NoticeVO vo) throws Exception, IOException {
		handleFileUpload(vo); // 아래 선언된 메서드
		noticeService.insertNotice(vo);
		return "redirect:/getNoticeList.do";
	}

	private void handleFileUpload(NoticeVO vo) throws IOException { // 파일 정보를 추출해 imagefile에 이미지 저장, 이름은 DB에 저장
		MultipartFile uploadFile = vo.getN_upload();
		if (uploadFile != null && !uploadFile.isEmpty()) {
			String uploadDir = "C:/1kosmosc/sts/work-space/ProjectLBnest_v3/src/main/webapp/notice/imagefile/";
			File dir = new File(uploadDir);
			if (!dir.exists()) {
				dir.mkdirs(); // 디렉토리가 존재하지 않으면 폴더 생성
			}
			//파일의 이름만 추출해서 fileName에 주입
			String fileName = uploadFile.getOriginalFilename();
			//경로+파일 이름 -> 파일로 생성
			File file = new File(uploadDir + fileName);
			//파일 transferTo를 통해 파일을 지정 폴더에 생성
			uploadFile.transferTo(file);
			vo.setFilename(fileName); // 상대 경로를 VO에 설정
		} else {
			vo.setFilename(null); // 파일 업로드가 없을 경우 filename을 null로 설정
		}
	}
}
