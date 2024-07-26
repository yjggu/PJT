package com.lbnest.loan.member;

import java.util.HashMap;

public interface MemberService {
	
	
	//로그인
	public int Login(HashMap<String, Object> loginMap);

	/*
	 * //로그인 확인 public int checkLogin(String id,String pwd);
	 */
	//아이디 중복 확인
	public int checkID(String id);
	//상담사 코드 중복확인
	public int checkCode(String counselor_code);
	
	//회원가입 기능
	public void insertMember(MemberVO memberVO);
	//회원정보 조회
	public MemberVO getMember(MemberVO memberVO);
	//회원 탈퇴
	public void deleteMember(MemberVO memberVO);
	//아이디찾기
	public String findID(MemberVO memberVO);
	//비밀번호 찾기
	public int findPwdCheck(MemberVO memberVO);
	public void findPWD(MemberVO memberVO);
	public void updateMember(MemberVO memberVO);
}
