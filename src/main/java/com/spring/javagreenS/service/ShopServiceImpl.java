package com.spring.javagreenS.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.javagreenS.dao.ShopDAO;
import com.spring.javagreenS.vo.ProductVO;

@Service
public class ShopServiceImpl implements ShopService {
	
	@Autowired
	ShopDAO shopDAO;

//	@Override
//	public void setProductInput(PruductVO vo) {
//		shopDAO.setProductInput(vo);
//	}

	@Override
	public ArrayList<String> getGoods1() {
		return shopDAO.getGoods1();
	}

	@Override
	public ArrayList<String> getGoods2(String product1) {
		return shopDAO.getGoods2(product1);
	}

	@Override
	public ArrayList<String> getGoods3(String product2) {
		return shopDAO.getGoods3(product2);
	}

	@Override
	public ArrayList<ProductVO> getProductList(String product) {
		return shopDAO.getProductList(product);
	}

}
