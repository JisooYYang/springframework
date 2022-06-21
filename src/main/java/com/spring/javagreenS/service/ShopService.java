package com.spring.javagreenS.service;

import java.util.ArrayList;

import com.spring.javagreenS.vo.ProductVO;

public interface ShopService {

//	public void setProductInput(PruductVO vo);

	public ArrayList<String> getGoods1();

	public ArrayList<String> getGoods2(String product1);

	public ArrayList<String> getGoods3(String product2);

	public ArrayList<ProductVO> getProductList(String string);

}
