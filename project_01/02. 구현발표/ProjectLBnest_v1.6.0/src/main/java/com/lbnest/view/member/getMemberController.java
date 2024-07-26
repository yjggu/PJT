package com.lbnest.view.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lbnest.loan.common.DownloadFile;
import com.lbnest.loan.common.PdfView;
import com.lbnest.loan.member.MemberService;
import com.lbnest.loan.member.MemberVO;

@Controller
public class getMemberController {
	
	@Autowired
	private MemberService memberService;
	
	public getMemberController() {
		System.out.println("===> getMemberController created.");
	}
/*
 * @RequestMapping(value = "/loan/member/getMember.do", method =
 * RequestMethod.GET) public ModelAndView getMember(MemberVO memberVO, MemberDAO
 * memberDAO, ModelAndView mav,
 * 
 * @RequestParam("m_id") String memberId, @RequestParam("m_grade") int
 * memberGrade) { memberVO.setM_id(memberId); memberVO.setM_grade(memberGrade);
 * mav.addObject("memberVO", memberDAO.getMember(memberVO));
 * mav.setViewName("/member_information/getMember.jsp"); return mav; }
 */
    
    @RequestMapping(value = "/member/getMember.do", method = RequestMethod.GET)
    public String getMember(
            				MemberVO memberVO,Model model, HttpSession session) 
    {
    	String id = (String) session.getAttribute("m_id");
    	int grade = (Integer) session.getAttribute("m_grade");
        //grade = (Integer) session.getAttribute("m_grade");
        memberVO.setM_id(id);
        memberVO.setM_grade(grade);
        MemberVO member = memberService.getMember(memberVO);//���� ��蹂� 議고��
        
        model.addAttribute("memberVO", member); // 紐⑤�몄�� ���� ��蹂� 異�媛�
        return "/member_information/getMember.jsp";
    }
    //���� �ㅼ�대���
    @RequestMapping(value = "/member/download.do", method = RequestMethod.GET)
    public ModelAndView fileDownload(@RequestParam("fileName") String fileName) {
    	ModelAndView mav = new ModelAndView();
    	mav.setView(new DownloadFile(fileName));
    	return mav;
    }
    //pdf 誘몃━蹂닿린
    @RequestMapping(value = "/member/pdfView.do", method = RequestMethod.GET)
    public ModelAndView getPdfView(@RequestParam("fileName") String fileName) {
    	ModelAndView mav = new ModelAndView();
    	mav.setView(new PdfView(fileName));
		return mav;
    }
    
	/*
	 * @RequestMapping("/modifyUser.do") public String modifyUser(UserVO userVO,
	 * UserDAO userDAO, Model model) { model.addAttribute("user",
	 * userDAO.getUserOne(userVO));
	 * 
	 * return "modifyUser.jsp"; }
	 */
    //泥⑤����� �ㅼ�대���
    // ���� �ㅼ�대��� 泥�由�

	/*
	 * @RequestMapping("/fileDownload/{file}") public void
	 * fileDownload(@PathVariable String file, HttpServletResponse response) throws
	 * IOException { File f = new
	 * File("/Users/gobyeongchae/Desktop/UploadServerFile/", file); // file �ㅼ�대��� �ㅼ��
	 * response.setContentType("application/download");
	 * response.setContentLength((int)f.length());
	 * response.setHeader("Content-disposition", "attachment;filename=\"" + file +
	 * "\""); // response 媛�泥대�� �듯�댁�� ��踰�濡�遺��� ���� �ㅼ�대��� OutputStream os =
	 * response.getOutputStream(); // ���� ���� 媛�泥� ���� FileInputStream fis = new
	 * FileInputStream(f); FileCopyUtils.copy(fis, os); fis.close(); os.close(); }
	 */
}
