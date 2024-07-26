package com.lbnest.view.member;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.lbnest.loan.member.MemberService;
import com.lbnest.loan.member.MemberVO;
import com.lbnest.loan.member.impl.MemberDAO;

@Controller
public class joinMemberController {
	
	@Autowired
	private MemberService memberService;
	
	public joinMemberController() {
		System.out.println("===> joinMemberController created.");
	}
	
    @RequestMapping(value = "/member/joinMember.do", method = RequestMethod.POST)
    public ModelAndView joinMember(MemberVO memberVO,@RequestParam("m_grade") int memberGrade,
            @RequestParam(value = "m_uploadFile1", required = false) MultipartFile upload1,
            @RequestParam(value = "m_uploadFile2", required = false) MultipartFile upload2, HttpServletRequest request) 
    {
    	ModelAndView mav = new ModelAndView();
    	//@RequestParam("m_uploadFile1") MultipartFile upload1, @RequestParam("m_uploadFile2") MultipartFile upload2
    	memberVO.setM_grade(memberGrade);
    	
        System.out.println("cont memberVO : "+memberVO);
        
        //파일 전송---------------------------------------------------------------------------------------------------
        if(memberGrade == 3 && upload1 != null && upload2 != null && !upload1.isEmpty() && !upload2.isEmpty() ) {
	
	        if (!upload1.isEmpty()) {
	            String uploadPath = "C:/1kosmosc/sts/work-space/ProjectLBnest_v2/src/main/webapp/resources/files";
	            File uploadDir = new File(uploadPath);
	            if (!uploadDir.exists()) {
	                uploadDir.mkdirs(); // 디렉토리가 존재하지 않으면 생성
	            }
	
	            try {
	                String m_file1 = upload1.getOriginalFilename();
	                String fileFolder1 = uploadPath + "/" + m_file1;
	                File destFile1 = new File(fileFolder1);
	                upload1.transferTo(destFile1);
	                memberVO.setM_file1(fileFolder1);
	                
	                System.out.println("파일1 : "+fileFolder1);
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	
	        if (!upload2.isEmpty()) {
	            String uploadPath = "C:/1kosmosc/sts/work-space/ProjectLBnest_v2/src/main/webapp/resources/files";
	            File uploadDir = new File(uploadPath);
	            if (!uploadDir.exists()) {
	                uploadDir.mkdirs(); // 디렉토리가 존재하지 않으면 생성
	            }
	
	            try {
	                String m_file2 = upload2.getOriginalFilename();
	                String fileFolder2 = uploadPath + "/" + m_file2;
	
	                File destFile2 = new File(fileFolder2);
	                upload2.transferTo(destFile2);
	                memberVO.setM_file2(fileFolder2);
	                System.out.println("파일2 : "+fileFolder2);
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	        System.out.println("memberVO 파일1 : "+memberVO.getM_file1());
	        System.out.println("memberVO 파일2 : "+memberVO.getM_file2());
        }    
        // ------------------------------------------------------------------------------------------
        memberService.insertMember(memberVO);
        // 전송 후 회원가입 완료 페이지 이동 ----------------------------------------------------------------------------------------------------
        mav.addObject("m_id", memberVO.getM_id()); //~님 회원가입이 완료되었습니다 할때 들어갈 값.
        mav.addObject("m_name", memberVO.getM_name());
        //model.addAttribute("memberVO",);
        mav.setViewName("/member_join/joinComplete.jsp");
        return mav;
    }

    //id 중복체크
    @ResponseBody
    @RequestMapping(value = "/member/checkId.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8" )
    public String checkID(@RequestParam("m_id")String id) {
        int id_duplication_check = memberService.checkID(id);  
        JSONObject json = new JSONObject();
        System.out.println("cont checkID m_id param : "+ id);
        json.put("id_duplication_check", id_duplication_check);
        System.out.println("===>CHECK ID : json : "+json.toString());
        return json.toString();
    }
    
    //대출상담사 코드 중복체크
    @ResponseBody
    @RequestMapping(value = "/member/checkCode.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8" )
    public String checkCode(@RequestParam("m_counselor_code")String counselor_code) {
        int code_check = memberService.checkCode(counselor_code);
        JSONObject json = new JSONObject();
        json.put("code_check", code_check);
        System.out.println("===>CHECK CODE : json : "+json);
        return json.toString(); 
    }
}
