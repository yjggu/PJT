package com.lbnest.view.member;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lbnest.loan.member.MemberService;
import com.lbnest.loan.member.MemberVO;
import com.lbnest.loan.member.impl.MemberDAO;

@Controller
public class updateMemberController {

	@Autowired
	private MemberService memberService;
	
	public updateMemberController() {
		System.out.println("===> updateMemberController() created.");
	}
    
    @RequestMapping(value="/member/updatePwdCheck.do", method = RequestMethod.GET)
    public ModelAndView updatePwdCheck(MemberVO memberVO,HttpSession httpsession) {
    	ModelAndView mav = new ModelAndView();
    	String id = (String) httpsession.getAttribute("m_id");
    	String name = (String) httpsession.getAttribute("m_name");
    	int grade = (Integer) httpsession.getAttribute("m_grade");
        mav.addObject("m_id", id);
        mav.addObject("m_name",name);
        mav.addObject("m_grade",grade);
        mav.setViewName("/member_information/updatePwdCheck.jsp");
		return mav;
    	
    }
    
    @RequestMapping(value="/member/updateMember.do", method = RequestMethod.GET)
    public ModelAndView updateMember(MemberVO member,HttpSession httpSession) {//, @RequestParam("m_grade") int grade , @RequestParam("m_id") String id
    	ModelAndView mav = new ModelAndView();
    	
    	String id = (String) httpSession.getAttribute("m_id");
    	int grade = (Integer) httpSession.getAttribute("m_grade");
    	
    	member.setM_id(id);
    	member.setM_grade(grade);
    	
    	MemberVO memberVO = memberService.getMember(member);
    	mav.addObject("memberVO", memberVO);
    	mav.setViewName("/member_information/updateMember.jsp");
    	return mav;
    }
    
    @RequestMapping(value="/member/updateMember.do", method = RequestMethod.POST)
    public ModelAndView updateMember(MemberVO memberVO,
    								@RequestParam(value = "m_uploadFile1", required = false) MultipartFile upload1,
									@RequestParam(value = "m_uploadFile2", required = false) MultipartFile upload2, HttpServletRequest request) {
    	
    	ModelAndView mav = new ModelAndView();
    	int grade = memberVO.getM_grade();
    	System.out.println("===> updateMember grade : "+grade);
    	// 鍮�諛�踰��� 蹂�寃� ������ �댁�� 媛� 洹몃��濡� �ъ��.
    	
    	
    	if ((memberVO.getM_pwd() == null || memberVO.getM_pwd().isEmpty()) && 
    		    (memberVO.getM_pwdck() == null || memberVO.getM_pwdck().isEmpty())) {
    		MemberVO legacy_member = memberService.getMember(memberVO);
    		String old_pwd = legacy_member.getM_pwd();
    		String old_pwdck = legacy_member.getM_pwdck();
    		
    		memberVO.setM_pwd(old_pwd);
    		memberVO.setM_pwdck(old_pwdck);
    	}
    	
        //���� ����---------------------------------------------------------------------------------------------------
        if(grade == 3 && upload1 != null && upload2 != null && !upload1.isEmpty() && !upload2.isEmpty() ) {
	
	        if (!upload1.isEmpty()) {
	            String uploadPath = "C:/1kosmosc/sts/work-space/ProjectLBnest_v2/src/main/webapp/resources/files";
	            File uploadDir = new File(uploadPath);
	            if (!uploadDir.exists()) {
	                uploadDir.mkdirs(); // ������由ш� 議댁�ы��吏� ���쇰㈃ ����
	            }
	
	            try {
	                String m_file1 = upload1.getOriginalFilename();
	                String fileFolder1 = uploadPath + "/" + m_file1;
	                File destFile1 = new File(fileFolder1);
	                upload1.transferTo(destFile1);
	                memberVO.setM_file1(fileFolder1);
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	
	        if (!upload2.isEmpty()) {
	            String uploadPath = "C:/1kosmosc/sts/work-space/ProjectLBnest_v2/src/main/webapp/resources/files";
	            File uploadDir = new File(uploadPath);
	            if (!uploadDir.exists()) {
	                uploadDir.mkdirs(); // ������由ш� 議댁�ы��吏� ���쇰㈃ ����
	            }
	
	            try {
	                String m_file2 = upload2.getOriginalFilename();
	                String fileFolder2 = uploadPath + "/" + m_file2;
	
	                File destFile2 = new File(fileFolder2);
	                upload2.transferTo(destFile2);
	                memberVO.setM_file2(fileFolder2);
	                System.out.println("����2 : "+fileFolder2);
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	        System.out.println("memberVO ����1 : "+memberVO.getM_file1());
	        System.out.println("memberVO ����2 : "+memberVO.getM_file2());
        }   
    	memberService.updateMember(memberVO);
    	mav.addObject("memberVO", memberVO);
    	mav.setViewName("redirect:/member/getMember.do");
    	// ���� �� 議고��濡� �대��
    	return mav;
    }
}
