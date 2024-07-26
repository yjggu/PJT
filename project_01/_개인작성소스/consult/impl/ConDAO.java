package com.lbnest.loan.consult.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.springframework.stereotype.Repository;

import com.lbnest.loan.common.JDBCUtil;
import com.lbnest.loan.consult.ConVO;

@Repository("conDAO")
public class ConDAO {
	
	private Connection conn = null;
	private PreparedStatement stmt = null;
//	private ResultSet rs = null;
	
	private final String CON_INSERT = "INSERT INTO RESERVATION (r_seq, r_name, r_phone, r_check, r_date, r_category, r_memo) VALUES ((SELECT seq FROM (SELECT IFNULL(MAX(r_seq), 0) + 1 AS seq FROM RESERVATION) AS temp), ?, ?, ?, ?, ?, ?)";
//	private final String CON_GET = "SELECT * FROM RESERVATION WHERE SEQ=?";
//	private final String CON_LIST = "SELECT * FROM RESERVATION ORDER BY r_seq ASC";
	
	public void insertCon(ConVO vo) {
		System.out.println("===> JDBC Connection Success");
		try {
			conn = JDBCUtil.getConnection(); 
			

			if ("바로상담".equals(vo.getR_check())) {
                vo.setR_date(Timestamp.valueOf(LocalDateTime.now()).toString());
            }

			stmt = conn.prepareStatement(CON_INSERT);
			stmt.setString(1, vo.getR_name());
			stmt.setString(2, vo.getR_phone());
			stmt.setString(3, vo.getR_check());
			stmt.setString(4, vo.getR_date()); 
			stmt.setString(5, vo.getR_category());
			stmt.setString(6, vo.getR_memo());
			stmt.executeUpdate();
			
			System.out.println(vo.getR_name() +" / "+ vo.getR_phone() +" / "+
								vo.getR_check() +" / "+ vo.getR_date() +" / "+ 
								vo.getR_category() +" / "+ vo.getR_memo());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(stmt, conn);
		}
	}
}


//	public ConVO getCon(ConVO vo) {
//		System.out.println("===> JDBC濡� getCON() 湲곕�� 泥�由�");
//		ConVO consult = null;
//		try {
//			conn = JDBCUtil.getConnection();
//			stmt = conn.prepareStatement(CON_GET);
//			stmt.setInt(1, vo.getR_seq());
//			rs = stmt.executeQuery();
//			if (rs.next()) {
//				consult = new ConVO();
//				consult.setR_seq(rs.getInt("r_seq"));
//				consult.setR_name(rs.getString("r_name"));
//				consult.setR_phone(rs.getString("r_phone"));
//				consult.setR_check(rs.getString("r_check"));
//				consult.setR_date(rs.getTimestamp("r_date"));
//				consult.setR_category(rs.getString("r_category"));
//				consult.setR_memo(rs.getString("r_memo"));
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			JDBCUtil.close(rs, stmt, conn);
//		}
//		return consult;
//	}
//
//
//	public List<ConVO> getConList(ConVO vo) {
//		System.out.println("\n\n\n===> JDBC濡� getCONList() 湲곕�� 泥�由�");
//
//		List<ConVO> consultList = new ArrayList<ConVO>();
//		try {
//			conn = JDBCUtil.getConnection();
//            stmt = conn.prepareStatement(CON_LIST);
//            rs = stmt.executeQuery();
//			
//			while (rs.next()) {
//				ConVO consult = new ConVO();
//				
//				consult = new ConVO();
//				consult.setR_seq(rs.getInt("r_seq"));
//				consult.setR_name(rs.getString("r_name"));
//				consult.setR_phone(rs.getString("r_phone"));
//				consult.setR_check(rs.getString("r_check"));
//				consult.setR_date(rs.getTimestamp("r_date"));
//				consult.setR_category(rs.getString("r_category"));
//				consult.setR_memo(rs.getString("r_memo"));
//
//				consultList.add(consult);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			JDBCUtil.close(rs, stmt, conn);
//		}
//
//		return consultList;
//	}


