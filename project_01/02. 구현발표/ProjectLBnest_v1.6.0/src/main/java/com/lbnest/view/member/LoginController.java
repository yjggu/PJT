package com.lbnest.view.member;

import java.util.HashMap;

import javax.mail.MessagingException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lbnest.loan.common.EmailUtil;
import com.lbnest.loan.member.MemberService;
import com.lbnest.loan.member.MemberVO;
import com.lbnest.loan.member.impl.MemberDAO;


@Controller
public class LoginController {

	@Autowired
	private MemberService memberService;
	
	//Cookie + Ajax 湲곕� 濡�洹몄�� 泥�由�
	@RequestMapping(value="/member/login.do", method=RequestMethod.POST)
	@ResponseBody
	public String login(HttpServletRequest request,
						HttpServletResponse response,
						HttpSession session,
						String m_id, String m_pwd,
						@RequestParam(value="ck_id_save", defaultValue="") String id_save, 
				        MemberVO memberVO) {
		
		HashMap<String, Object> loginMap = new HashMap<String, Object>(); 
		loginMap.put("m_id", m_id);
		loginMap.put("m_pwd", m_pwd);
		
		int login_check = memberService.Login(loginMap); //濡�洹몄�� �깃났 cnt=1, �ㅽ�� =0
		MemberVO member = new MemberVO();
		member.setM_id(m_id);
		JSONObject json = new JSONObject();
		if(login_check ==1) {
			MemberVO mVO = memberService.getMember(member);
			
			System.out.println("id_save : " + id_save);
			if(mVO.getM_c_visible() == null || mVO.getM_c_visible().trim().equals("") || !mVO.getM_c_visible().trim().equals("n")) { //��異����댁�� 愿�由ъ�� �뱀�� �������� 濡�洹몄�� �ㅽ��
				
				//�몄���� 媛� ����
				 session.setAttribute("m_id", mVO.getM_id());
				 session.setAttribute("m_name", mVO.getM_name());
				 session.setAttribute("m_grade", mVO.getM_grade());
				
		       // -------------------------------------------------------------------
		       // id 愿��� 荑�湲� ����
		       // -------------------------------------------------------------------
		       if (id_save.equals("y")) { // id瑜� ���ν�� 寃쎌��, Checkbox瑜� 泥댄�ы�� 寃쎌��
		         Cookie ck_id = new Cookie("ck_id", m_id);
		         ck_id.setPath("/");  // root �대���� 荑��ㅻ�� 湲곕��⑥�쇰� 紐⑤�� 寃쎈����� 荑�湲� ��洹� 媛���
		         ck_id.setMaxAge(60 * 60 * 24 * 30); // 30 day, 珥��⑥��
		         response.addCookie(ck_id); // id ����
		         System.out.println("Cookie : " +ck_id);
		       } else { // N, id瑜� ���ν��吏� ���� 寃쎌��, Checkbox瑜� 泥댄�� �댁���� 寃쎌��
		         Cookie ck_id = new Cookie("ck_id", "");
		         ck_id.setPath("/");  // root �대���� 荑��ㅻ�� 湲곕��⑥�쇰� 紐⑤�� 寃쎈����� 荑�湲� ��洹� 媛���
		         ck_id.setMaxAge(0);
		         response.addCookie(ck_id); // id ����
		       }
		       // id瑜� ���ν��吏� ��������  CheckBox 泥댄�� �щ�
		       Cookie ck_id_save = new Cookie("ck_id_save", id_save);
		       ck_id_save.setPath("/");  // root �대���� 荑��ㅻ�� 湲곕��⑥�쇰� 紐⑤�� 寃쎈����� 荑�湲� ��洹� 媛���		       
		       ck_id_save.setMaxAge(60 * 60 * 24 * 30); // 30 day	      
		       response.addCookie(ck_id_save);
		       System.out.println("Cookie : " +ck_id_save);
		       
		       json.put("status", "success");
			   json.put("login_check", login_check);

			   
				return json.toString();	
			}else {
				//return "/login/loginFailed.jsp";
	            json.put("login_check", login_check);
	            json.put("status", "failed");
	            json.put("message", "관리자 승인 후 로그인이 가능합니다. \n관리자 승인 시 메일이 발송됩니다.");
	            return json.toString();
			}
		}else {
//			request.setAttribute("errorMessage", "���대�� ���� 鍮�諛�踰��멸� ��紐삳�����듬����.");
//			return "/login/login.jsp";
	        json.put("login_check", login_check);
	        json.put("status", "failed");
	        json.put("message", "아이디와 비밀번호를 확인해주세요.");
	        return json.toString();
		}

	}
	//濡�洹몄�� �� + 濡�洹몄�� �깃났�� �����쇰� 二쇱�� �대��
	@RequestMapping(value="/member/login.do", method=RequestMethod.GET)
	public ModelAndView login_cookie(HttpServletRequest request,
             MemberVO memberVO ) {//@RequestParam(value="return_url", defaultValue="") String return_url,
		ModelAndView mav = new ModelAndView();
	     System.out.println("===> Cookie cont");
	     Cookie[] cookies = request.getCookies();
	     Cookie cookie = null;
	     System.out.println("login_cookie : "+ cookies);
	     String ck_id = ""; // id ����
	     String ck_id_save = ""; // id ���� �щ�瑜� 泥댄��
	     System.out.println("===> cookies"+cookies);
	     
	     if (cookies != null) {
	    	 for(int i=0; i<cookies.length; i++) {
	    		 cookie = cookies[i]; // 荑��� 媛�泥� 異�異�
	    		 if(cookie.getName().equals("ck_id")) {
	    			 ck_id = cookie.getValue(); 
	    			 System.out.println("ck_id : "+ck_id);
	    		 }else if(cookie.getName().equals("ck_id_save")) {
	    			 ck_id_save = cookie.getValue();
	    			 System.out.println("ck_id_save : "+ck_id_save);
	    		 }
	    	 }
	     }
	     System.out.println("login_cookie : "+ cookie);
	     mav.addObject("ck_id", ck_id);
	     mav.addObject("ck_id_save", ck_id_save);
	     System.out.println(ck_id);
	     System.out.println(ck_id_save);
	     //mav.addObject("return_url", return_url);
	     mav.setViewName("/login/login.jsp");
	     return mav;
	}
	//濡�洹몄����
	   @RequestMapping(value="/member/logout.do", method=RequestMethod.GET)
	   public ModelAndView logout(HttpSession session){
	     ModelAndView mav = new ModelAndView();
	     session.invalidate(); // 紐⑤�� session 蹂��� ����
	     mav.setViewName("redirect:/main_page.jsp"); 
	     return mav;
	   }
	   
	   //���대��李얘린
	   @RequestMapping(value="/member/findID.do", method=RequestMethod.POST)
	   public ModelAndView findID(MemberVO memberVO) {
		   ModelAndView mav = new ModelAndView();
		   
		   String getID = memberService.findID(memberVO);
		   System.out.println("findID cont : "+getID);
		   System.out.println("findID m_name cont : "+ memberVO.getM_name());
		   if(getID!=null && getID!="") {
			   //mav.addObject("code", "idFind_success");
		       mav.addObject("m_name", memberVO.getM_name());
		       mav.addObject("m_email", memberVO.getM_email());
		       mav.addObject("m_id", getID);
		       mav.setViewName("/login/findID.jsp");
		   }else {
			   mav.addObject("code", "nonFind_fail_findID");
			   mav.setViewName("redirect:/login/loginFind.jsp");
		   }
		   return mav;
	   }
	   
	   //鍮�諛�踰��몄갼湲�
	   @RequestMapping(value="/member/findPWD.do", method=RequestMethod.POST)
	   public ModelAndView findPWD(MemberVO memberVO) {
		   ModelAndView mav = new ModelAndView();
		   System.out.println("���λ�� �대��� 二쇱�� :"+ memberVO.getM_email());
		   System.out.println("���λ�� ���대�� 二쇱�� : "+memberVO.getM_id());
		   //���ν�� ��蹂� 議고��
		   int cnt = memberService.findPwdCheck(memberVO);
		   System.out.println("cnt: "+cnt);
		   if(cnt>0) {
			   //����鍮�諛�踰��몃� 蹂�寃�
			   String tempPwd  = EmailUtil.makeAuthenticationCode();
			   memberVO.setM_pwd(tempPwd);
			   memberVO.setM_pwdck(tempPwd);
			   memberService.findPWD(memberVO);
			   //硫��쇱����
		        try {
		            EmailUtil.sendEmail(memberVO.getM_email(), tempPwd);

		        } catch (MessagingException e) {
		            e.printStackTrace();
					/*
					 * mav.addObject("message", "�대��� 諛��� 以� �ㅻ�媛� 諛������듬����."); mav.setViewName("error");
					 */
		            System.out.println("findPWD() ���� : " + e);    
		        }
		       mav.addObject("m_email",memberVO.getM_email());
		       mav.setViewName("/login/findPWD.jsp");
		   }else {
			   mav.addObject("code", "nonFind_fail_findPWD");
			   mav.setViewName("redirect:/login/loginFind.jsp");
		   }
		   
		   return mav;
	   }
	   
}