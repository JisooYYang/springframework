package com.spring.javagreenS.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.javagreenS.vo.ProductVO;

public interface ShopDAO {

//	public void setProductInput(@Param("vo") PruductVO vo);

	public ArrayList<String> getGoods1();

	public ArrayList<String> getGoods2(@Param("product1") String product1);

	public ArrayList<String> getGoods3(@Param("product2") String product2);

	public ArrayList<ProductVO> getProductList(@Param("product") String product);


}
