package com.lbnest.loan.member.impl;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.lbnest.loan.member.MemberService;
import com.lbnest.loan.member.MemberVO;

public class MemberServiceImpl implements MemberService {

	private MemberDAO memberDAO;
	
	/*
	 * public void setMemberDAO(MemberDAO memberDAO) { this.memberDAO = memberDAO; }
	 */
    public void setMemberDAO(MemberDAO memberDAO) {
        this.memberDAO = memberDAO;
    }
    
	@Override
	public int checkID(String id) {
		return memberDAO.checkID(id);
	}
	@Override
	public void insertMember(MemberVO memberVO) {
		memberDAO.insertMember(memberVO);
		
	}

	@Override
	public MemberVO getMember(MemberVO memberVO) {
		return memberDAO.getMember(memberVO);
		
	}

	@Override
	public int Login(HashMap<String, Object> loginMap) {
		return memberDAO.Login(loginMap);
	}

	@Override
	public int checkCode(String counselor_code) {
		return memberDAO.checkCode(counselor_code);
	}

	@Override
	public void deleteMember(MemberVO memberVO) {
		memberDAO.deleteMember(memberVO);
	}
	
	@Override
	public String findID(MemberVO memberVO) {
		return memberDAO.findID(memberVO);
	}
	@Override
	public void findPWD(MemberVO memberVO) {
		memberDAO.findPWD(memberVO);
	}
	@Override
	public int findPwdCheck(MemberVO memberVO) {
		return memberDAO.findPwdCheck(memberVO);
	}

	@Override
	public void updateMember(MemberVO memberVO) {
		memberDAO.updateMember(memberVO);
		
	}


}
