package com.lbnest.view.notice;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.lbnest.loan.notice.NoticeService;
import com.lbnest.loan.notice.NoticeVO;
import com.lbnest.loan.notice.impl.NoticeDAO;

@Controller
public class UpdateNoticeController {
	//파일 수정하여 업데이트하기
	@Autowired
	private NoticeService noticeService;

	@Autowired
	private NoticeDAO noticeDAO;

	@RequestMapping("/updateNotice.do")
	public String updateNotice(NoticeVO vo, @RequestParam(value = "deleteFile", required = false) String deleteFile)
			throws Exception, IOException {
		if ("true".equals(deleteFile) && vo.getFilename() != null) {
			File file = new File("src/main/webapp" + vo.getFilename());
			if (file.exists()) {
				file.delete();
				vo.setFilename(null);
			}
		}

		handleFileUpload(vo);
		noticeService.updateNotice(vo);
		return "redirect:/getNoticeList.do";
	}

	// 파일 삭제 요청을 처리하는 메서드
	@PostMapping("/deleteFile.do")
	@ResponseBody
	public ResponseEntity<String> deleteFile(@RequestParam("nSeq") Long nSeq,
			@RequestParam("filename") String filename) {
		try {
			NoticeVO vo = new NoticeVO();
			vo.setN_seq(nSeq.intValue()); // Long 타입을 int로 변환하여 설정
			vo.setFilename(filename);

			noticeDAO.deleteFile(vo); // DAO에 파일 삭제 메서드 호출

			// 성공적으로 삭제되었음을 클라이언트에 응답
			return ResponseEntity.ok("파일 삭제 성공");
		} catch (Exception e) {
			// 삭제 실패 시 오류 메시지를 클라이언트에 응답
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("파일 삭제 실패");
		}
	}//파일 업로드 메서드
	private void handleFileUpload(NoticeVO vo) throws IOException { // 파일 정보를 추출해 imagefile에 이미지 저장, 이름은 DB에 저장
		MultipartFile uploadFile = vo.getN_upload();
		if (uploadFile != null && !uploadFile.isEmpty()) {
			String uploadDir = "C:/1kosmosc/sts/work-space/ProjectLBnest_v3/src/main/webapp/notice/imagefile/";
			File dir = new File(uploadDir);
			if (!dir.exists()) {
				dir.mkdirs(); // 디렉토리가 존재하지 않으면 생성
			}

			String fileName = uploadFile.getOriginalFilename(); // 파일명 중복 방지를 위해 타임스탬프 추가
			File file = new File(uploadDir + fileName);

			uploadFile.transferTo(file);
			vo.setFilename(fileName); // 상대 경로를 VO에 설정
		} else {
			vo.setFilename(null); // 파일 업로드가 없을 경우 filename을 null로 설정
		}
	}

	/*
	 * @RequestMapping("/updateNotice.do") public String updateNotice(NoticeVO vo,
	 * NoticeDAO noticeDAO) {
	 * 
	 * noticeDAO.updateNotice(vo); return "getNoticeList.do"; }
	 */
}
