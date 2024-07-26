package com.lbnest.loan.member.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.lbnest.loan.member.MemberVO;
import com.lbnest.loan.common.JDBCUtil;

@Repository("memberDAO")
public class MemberDAO {

	// JDBC 愿��� 蹂���
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	private final String LOGIN = "SELECT COUNT(m_id)as cnt FROM member WHERE  m_id = ? and m_pwd=?";
	private final String CHECK_ID = "SELECT COUNT(m_id)as cnt FROM member WHERE m_id = ?";
	private final String CHECK_CODE = "SELECT COUNT(m_counselor_code)as cnt FROM member WHERE m_counselor_code = ?";
	private final String MEMBER_BROKERAGE_INSERT = "INSERT INTO member (m_id,m_pwd,m_pwdck,m_name,m_phone,m_email,m_counselor_code,m_c_visible,m_zip_code,m_addr1,m_addr2,m_grade,m_file1,m_file2) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
	private final String MEMBER_INSERT = "INSERT INTO member (m_id,m_pwd,m_pwdck,m_name,m_phone,m_email,m_counselor_code,m_c_visible,m_zip_code,m_addr1,m_addr2,m_grade) VALUES(?,?,?,?,?,?,?,?,?,?,?,?);";
	private final String MEMBER_GET ="SELECT m_id,m_pwd,m_pwdck,m_name,m_phone,m_email,m_counselor_code,m_c_visible,m_zip_code,m_addr1,m_addr2,m_grade,m_regdate,m_file1,m_file2 FROM member WHERE m_id=?"; //where臾몄�� m_grade����
//���댁�ъ��� ���곗�댄�� X
	//private final String MEMBER_UPDATE = "UPDATE member SET m_pwd=?,m_pwdck=?,m_name=?,m_phone=?,m_email=?,m_counselor_code=?,m_zip_code=?,m_addr1=?,m_addr2=?,m_file1=?,m_file2=? WHERE m_id=?;";
	private final String MEMBER_UPDATE = "UPDATE member SET m_pwd=?,m_pwdck=?,m_name=?,m_phone=?,m_email=?,m_zip_code=?,m_addr1=?,m_addr2=?,m_file1=?,m_file2=? WHERE m_id=?;";

	private final String MEMBER_DELETE = "DELETE FROM member where m_id=?;";
	
	private final String FIND_ID = "SELECT m_id FROM member WHERE m_name=? and m_email=?;";
	private final String CHANGE_PWD = "UPDATE member SET m_pwd=?, m_pwdck=? WHERE m_id=? and m_email=?";
	private final String FIND_PWD_CHECK = "SELECT COUNT(m_id) as cnt FROM member WHERE m_id=? and m_email=?;";
	// 愿�由ъ�� 2李④뎄�� // 遺�由ы��湲�
	private final String CONFIRM_C_ADMIN = "SELECT m_id, m_name, m_phone, m_email, m_counselor_code, m_c_visible, m_grade, m_regdate\r\n"
			+ "FROM (\r\n"
			+ "    SELECT m_id, m_name, m_phone, m_email, m_counselor_code, m_c_visible, m_grade, m_regdate,\r\n"
			+ "           @row_number := @row_number + 1 AS num\r\n"
			+ "    FROM member\r\n"
			+ "    JOIN (SELECT @row_number := 0) AS dummy\r\n"
			+ "    WHERE m_c_visible = 'n'\r\n"
			+ "    ORDER BY m_regdate DESC\r\n"
			+ ") AS ranked\r\n"
			+ "WHERE num BETWEEN ? AND ?;";
	

	//濡�洹몄��
	public int Login (HashMap<String, Object> loginMap) {
	    String memberId = (String) loginMap.get("m_id");
	    String memberPwd = (String) loginMap.get("m_pwd");	
	    int count = 0;

		try {
			System.out.println("===> MemberDAO: Login() 湲곕�� 泥�由�");
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(LOGIN);
			
		    stmt.setString(1, memberId);
		    stmt.setString(2, memberPwd);
		    rs = stmt.executeQuery();
		    if(rs.next()) {
		    	count = rs.getInt("cnt");
		    }		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
		return count;		
	}

	// ID 以�蹂듯���� 湲곕��
	public int checkID(String id) {
		System.out.println("===> MemberDAO: checkID() 湲곕�� 泥�由�");	
		int count = 0;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(CHECK_ID);
			
			stmt.setString(1, id);
			rs = stmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
		return count;
	}
	
	// ��異����댁�� 肄��� 以�蹂듯����
	public int checkCode(String counselor_code) {
		System.out.println("===> MemberDAO: checkCode() 湲곕�� 泥�由�");	
		int count = 0;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(CHECK_CODE);
			
			stmt.setString(1, counselor_code);
			rs = stmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
		return count;
	}
	
	//����媛��� 湲곕�� //������湲�
	public void insertMember(MemberVO memberVO) {
		System.out.println("===> MemberDAO: insertMember() 湲곕�� 泥�由�");
		try {
			int grade = memberVO.getM_grade();
			if(grade == 3) {
				conn = JDBCUtil.getConnection();
				int index = 1;
				
				MultipartFile upload1 = memberVO.getM_uploadFile1();
				String m_file1 = upload1.getOriginalFilename();
				//以�媛� �깅�利�
				MultipartFile upload2 = memberVO.getM_uploadFile2();
				String m_file2 = upload2.getOriginalFilename();
				
				stmt = conn.prepareStatement(MEMBER_BROKERAGE_INSERT);
				stmt.setString(index++, memberVO.getM_id());
				stmt.setString(index++, memberVO.getM_pwd());
				stmt.setString(index++, memberVO.getM_pwdck());
				stmt.setString(index++, memberVO.getM_name());
				stmt.setString(index++, memberVO.getM_phone());
				stmt.setString(index++, memberVO.getM_email());
				stmt.setString(index++, memberVO.getM_counselor_code());
				stmt.setString(index++, memberVO.getM_c_visible());
				stmt.setString(index++, memberVO.getM_zip_code());
				stmt.setString(index++, memberVO.getM_addr1());
				stmt.setString(index++, memberVO.getM_addr2());
				stmt.setInt(index++, memberVO.getM_grade());
				stmt.setString(index++,m_file1);
				stmt.setString(index++, m_file2);
		        stmt.executeUpdate();
			}
			else {
				conn = JDBCUtil.getConnection();
				int index = 1;
				
				stmt = conn.prepareStatement(MEMBER_INSERT);
				stmt.setString(index++, memberVO.getM_id());
				stmt.setString(index++, memberVO.getM_pwd());
				stmt.setString(index++, memberVO.getM_pwdck());
				stmt.setString(index++, memberVO.getM_name());
				stmt.setString(index++, memberVO.getM_phone());
				stmt.setString(index++, memberVO.getM_email());
				stmt.setString(index++, memberVO.getM_counselor_code());
				if(grade == 2) {
					stmt.setString(index++, "n");
				}else {
					stmt.setString(index++, memberVO.getM_c_visible());
				}
				
				stmt.setString(index++, memberVO.getM_zip_code());
				stmt.setString(index++, memberVO.getM_addr1());
				stmt.setString(index++, memberVO.getM_addr2());
				stmt.setInt(index++, memberVO.getM_grade());
		        stmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	//������蹂� 議고�� 
	public MemberVO getMember(MemberVO memberVO) {
		MemberVO member = null;
		try {
			System.out.println("===> MemberDAO : getMember() 湲곕�� 泥�由�");
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_GET);
			
			stmt.setString(1, memberVO.getM_id());
			//stmt.setInt(2, memberVO.getM_grade());
			rs = stmt.executeQuery();
			if (rs.next()) {
				member = new MemberVO();
				member.setM_id(rs.getString("m_id"));
				member.setM_pwd(rs.getString("m_pwd"));
				member.setM_pwdck(rs.getString("m_pwdck"));
				member.setM_name(rs.getString("m_name"));
				member.setM_phone(rs.getString("m_phone"));
				member.setM_email(rs.getString("m_email"));
				member.setM_counselor_code(rs.getString("m_counselor_code"));
				member.setM_c_visible(rs.getString("m_c_visible"));
				member.setM_zip_code(rs.getString("m_zip_code"));
				member.setM_addr1(rs.getString("m_addr1"));
				member.setM_addr2(rs.getString("m_addr2"));
				member.setM_grade(rs.getInt("m_grade"));
				member.setM_regdate(rs.getDate("m_regdate"));
				member.setM_file1(rs.getString("m_file1"));
				member.setM_file2(rs.getString("m_file2"));
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return member;
	}
	
	//������蹂� ����
	public void updateMember(MemberVO memberVO) {
		System.out.println("===> JDBC濡� updateMember() 湲곕�� 泥�由�");
		try {
			
			conn = JDBCUtil.getConnection();
			int index = 1;
			int grade = memberVO.getM_grade();
			if(grade == 3) {
				MultipartFile upload1 = memberVO.getM_uploadFile1();
				String m_file1 = upload1.getOriginalFilename();
				//以�媛� �깅�利�
				MultipartFile upload2 = memberVO.getM_uploadFile2();
				String m_file2 = upload2.getOriginalFilename();
				
				stmt = conn.prepareStatement(MEMBER_UPDATE);
				stmt.setString(index++, memberVO.getM_pwd());
				stmt.setString(index++, memberVO.getM_pwdck());
				stmt.setString(index++, memberVO.getM_name());
				stmt.setString(index++, memberVO.getM_phone());
				stmt.setString(index++, memberVO.getM_email());
				//stmt.setString(index++, memberVO.getM_counselor_code());
				stmt.setString(index++, memberVO.getM_zip_code());
				stmt.setString(index++, memberVO.getM_addr1());
				stmt.setString(index++, memberVO.getM_addr2());
				stmt.setString(index++, m_file1);
				stmt.setString(index++, m_file2);
				stmt.setString(index++, memberVO.getM_id());
		        stmt.executeUpdate();
			}else {
			stmt = conn.prepareStatement(MEMBER_UPDATE);
			stmt.setString(index++, memberVO.getM_pwd());
			stmt.setString(index++, memberVO.getM_pwdck());
			stmt.setString(index++, memberVO.getM_name());
			stmt.setString(index++, memberVO.getM_phone());
			stmt.setString(index++, memberVO.getM_email());
			//stmt.setString(index++, memberVO.getM_counselor_code());
			stmt.setString(index++, memberVO.getM_zip_code());
			stmt.setString(index++, memberVO.getM_addr1());
			stmt.setString(index++, memberVO.getM_addr2());
			stmt.setString(index++, memberVO.getM_file1());
			stmt.setString(index++, memberVO.getM_file2());
			stmt.setString(index++, memberVO.getM_id());
	        stmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	// ��������
	public void deleteMember(MemberVO memberVO) {
		System.out.println("===> MemberDAO : deleteMember()");
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(MEMBER_DELETE);
			stmt.setString(1, memberVO.getM_id());
			stmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	
	//���대�� 李얘린
	public String findID (MemberVO memberVO) {
	    String memberName = memberVO.getM_name();
	    String memberEmail = memberVO.getM_email();
	    String id = "";

		try {
			System.out.println("===> MemberDAO: findID() 湲곕�� 泥�由�");
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(FIND_ID);
			
		    stmt.setString(1, memberName);
		    stmt.setString(2, memberEmail);
		    rs = stmt.executeQuery();
		    if(rs.next()) {
		    	id = rs.getString("m_id");
		    }		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
		return id;		
	}
	//鍮�諛�踰��� 李얘린 : ��蹂댁“��
	public int findPwdCheck(MemberVO memberVO) {
		System.out.println("===> MemberDAO: findPwdCheck() 湲곕�� 泥�由�");	
		int count = 0;
		try {
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(FIND_PWD_CHECK);
			
			stmt.setString(1, memberVO.getM_id());
			stmt.setString(2, memberVO.getM_email());
			rs = stmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt("cnt");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
		return count;
	}
	//鍮�諛�踰��� 李얘린 : ����鍮�諛�踰��몃� ����
	public void findPWD (MemberVO memberVO) {
		System.out.println("===> MemberDAO: findPWD() 湲곕�� 泥�由�");
		try {			
			conn = JDBCUtil.getConnection();
			int index = 1;
			stmt = conn.prepareStatement(CHANGE_PWD);
			stmt.setString(index++, memberVO.getM_pwd());
			stmt.setString(index++, memberVO.getM_pwdck());
			stmt.setString(index++, memberVO.getM_id());
			stmt.setString(index++, memberVO.getM_email());			
	        stmt.executeUpdate();
	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
	//愿�由ъ�� 紐⑤��
	
	// 愿�由ъ�� : 誘몄�뱀�� ���댁�� �뱀�� 由ъ�ㅽ��
	public MemberVO confirm_c_admin(MemberVO memberVO) {
		MemberVO member = null;
		
		try {
			System.out.println("===> MemberDAO : confirm_c_admin()");
			conn = JDBCUtil.getConnection();
			stmt = conn.prepareStatement(CONFIRM_C_ADMIN);

			rs = stmt.executeQuery();
			if (rs.next()) {
				member = new MemberVO();
				member.setM_id(rs.getString("m_id"));
				member.setM_name(rs.getString("m_name"));
				member.setM_phone(rs.getString("m_phone"));
				member.setM_email(rs.getString("m_email"));
				member.setM_counselor_code(rs.getString("m_counselor_code"));
				member.setM_c_visible(rs.getString("m_c_visible"));
				member.setM_grade(rs.getInt("m_grade"));
				member.setM_regdate(rs.getDate("m_regdate"));
//num			rs.getInt("num")
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		
		return member;
	}
}

