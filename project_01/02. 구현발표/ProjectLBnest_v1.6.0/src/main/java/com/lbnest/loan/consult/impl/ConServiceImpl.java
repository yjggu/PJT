package com.lbnest.loan.consult.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lbnest.loan.consult.ConService;
import com.lbnest.loan.consult.ConVO;

@Service("conService")
public class ConServiceImpl implements ConService {

	@Autowired
//	@Qualifier("conDAO")
	private ConDAO conDAO;
	
    // setter 메소드 추가
    public void setConDAO(ConDAO conDAO) {
        this.conDAO = conDAO;
    }
	@Override
	public void insertCon(ConVO vo) {
		conDAO.insertCon(vo);
	}
}

//	public void setConDAO(ConDAO conDAO) {
//		this.conDAO = conDAO;
//	}
//	@Override
//	public ConVO getCon(ConVO vo) {
//		return conDAO.getCon(vo);
//	}
//
//	@Override
//	public List<ConVO> getConList(ConVO vo) {
//		return conDAO.getConList(vo);
//	}



