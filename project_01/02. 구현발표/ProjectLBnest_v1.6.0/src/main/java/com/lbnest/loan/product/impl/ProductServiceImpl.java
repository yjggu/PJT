package com.lbnest.loan.product.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lbnest.loan.product.ProductService;
import com.lbnest.loan.product.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
    private ProductDAO productDAO;

	public void setProductDAO(ProductDAO productDAO) {
        this.productDAO = productDAO;
    }
    
    @Override
    public List<ProductVO> getProductList(ProductVO vo) {
        return productDAO.getProductList(vo);
    }
}   
//    
//    @Override
//    public List<ProductVO> getProductList(ProductVO vo, int pseq) {
//        return productDAO.getProductList(vo, pseq);
//    }

//    @Override
//    public List<ProductVO> getProductList(ProductVO vo, String classification ) {
//        return productDAO.getProductList(vo, classification);
//    }

