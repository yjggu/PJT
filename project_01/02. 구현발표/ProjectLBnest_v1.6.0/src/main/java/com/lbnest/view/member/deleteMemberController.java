package com.lbnest.view.member;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lbnest.loan.member.MemberService;
import com.lbnest.loan.member.MemberVO;
import com.lbnest.loan.member.impl.MemberDAO;



@Controller
public class deleteMemberController {
	
	@Autowired
	private MemberService memberService;
	
	public deleteMemberController() {
		System.out.println("===> deleteMemberController created.");
	}
	//��������
	@RequestMapping("/member/deleteMember.do")
	public String deleteMember(MemberVO memberVO, MemberDAO memberDAO, HttpSession session) {
		System.out.println("탈퇴 : " + memberVO.getM_id());
		memberService.deleteMember(memberVO);
		session.invalidate(); //�몄����蹂� ����
		return "redirect:/main_page.jsp"; //硫��명��硫댁�쇰� �대��
	}
	
	//�������� �댁�� 鍮�諛�踰��� ����
	@RequestMapping(value="/member/pwdCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String pwdCheck(HttpServletRequest request,
						HttpServletResponse response,
						HttpSession session,
						String m_pwd,
				        MemberVO memberVO) {
		
		session.getAttribute("m_id");
		System.out.println("cont m_id : "+session.getAttribute("m_id"));
		HashMap<String, Object> loginMap = new HashMap<String, Object>(); 
		loginMap.put("m_id", session.getAttribute("m_id"));
		loginMap.put("m_pwd", m_pwd);
		System.out.println("loginMap : "+loginMap);
		int pwdCheck = memberService.Login(loginMap); //�깃났 pwdCheck=1, �ㅽ�� pwdCheck=0
		
		JSONObject json = new JSONObject();
		json.put("pwd_check", pwdCheck);

		return json.toString();
	}
}
