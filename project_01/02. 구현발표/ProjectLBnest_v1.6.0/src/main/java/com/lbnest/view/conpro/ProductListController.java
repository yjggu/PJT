package com.lbnest.view.conpro;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lbnest.loan.product.ProductService;
import com.lbnest.loan.product.ProductVO;

@Controller
public class ProductListController {
	
    @Autowired
    private ProductService productService;
    

    public ProductListController(ProductService productService) {
    	System.out.println("getProductList complete");
	}


	@RequestMapping("/conpro/getProductList.do")
    public String getProductList(@RequestParam(value = "classification", required = false) String classification, 
                                 Model model) {
        ProductVO productvo = new ProductVO();
        List<ProductVO> productList = productService.getProductList(productvo);
        
        model.addAttribute("productList", productList);
        model.addAttribute("selectedClassification", classification);
  

        if ("mortgage".equals(classification)) {
            return "pMortgage.jsp";
        } else if("lease".equals(classification)) {
        	return "pLease.jsp";
        } else if("credit".equals(classification)) {
        	return "pCredit.jsp";
        } else {
            return "pCar.jsp";
        } 
    }
}