package com.lbnest.loan.product.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.lbnest.loan.common.JDBCUtil;
import com.lbnest.loan.product.ProductVO;

@Repository("ProductDAO")
public class ProductDAO {
	// JDBC 관련 변수
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	// SQL 명령어 (리스트 조회)
	private final String PRODUCT_LIST = "SELECT * FROM PRODUCT ORDER BY PSEQ ASC";

	public List<ProductVO> getProductList(ProductVO vo) {		// , String classification
		System.out.println("\n\n\n===> JDBC로 getProduct() 기능 처리");

		List<ProductVO> productList = new ArrayList<ProductVO>();
		try {
			conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(PRODUCT_LIST);
            rs = stmt.executeQuery();
			
			while (rs.next()) {
				ProductVO product = new ProductVO();
				product.setPseq(rs.getInt("PSEQ"));
				product.setPname(rs.getString("PNAME"));
				product.setClassification(rs.getString("CLASSIFICATION"));
				product.setFeature(rs.getString("FEATURE"));
				product.setQualification(rs.getString("QUALIFICATION"));
				product.setLoanAmount(rs.getString("LOANAMOUNT"));
				product.setPayback(rs.getString("PAYBACK"));
				product.setTarget(rs.getString("TARGET"));
				product.setApplyFor(rs.getString("APPLYFOR"));
				product.setAutoLoan(rs.getString("AUTOLOAN"));
				product.setPaybackMethod(rs.getString("PAYBACKMETHOD"));
				product.setCashback(rs.getString("CASHBACK"));
				product.setPagelink(rs.getString("PAGELINK"));

				productList.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}

		return productList;

	}


}
