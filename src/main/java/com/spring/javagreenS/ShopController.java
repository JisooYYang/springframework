package com.spring.javagreenS;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.javagreenS.service.ShopService;
import com.spring.javagreenS.vo.ProductVO;

@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	ShopService shopService;
	
	@RequestMapping(value = "input/productMenu", method = RequestMethod.GET)
	public String productMenuGet() {
		return "shop/input/productMenu";
	}
	
	@RequestMapping(value = "/input/productInput", method = RequestMethod.GET)
	public String productInputGet(Model model) {
		ArrayList<String> vos = new ArrayList<String>();
		vos = shopService.getGoods1();
		model.addAttribute("vos",vos);
		return "shop/input/productInput";
	}
	
//	@RequestMapping(value = "/input/productInput", method = RequestMethod.POST)
//	public ArrayList<String> productInputPost(String product1) {
//		ArrayList<String> vos = new ArrayList<String>();
//		vos = shopService.getGoods1();
//		System.out.println("vos : "  + vos);
//		return vos;
//	}
	
	
	// 중분류검색
	@ResponseBody
	@RequestMapping(value="/input/product2", method = RequestMethod.POST)
	public ArrayList<String> product2Post(String product1) {
		ArrayList<String> vos = new ArrayList<String>();
		vos = shopService.getGoods2(product1);
		System.out.println("vos : "  + vos);
		return vos;
	}
	
	// 소분류 검색
	@ResponseBody
	@RequestMapping(value="/input/product3", method = RequestMethod.POST)
	public ArrayList<String> product3Post(String product1, String product2) {
		ArrayList<String> vos = new ArrayList<String>();
		vos = shopService.getGoods3(product2);
		System.out.println("vos : "  + vos);
		return vos;
	}
	
	// 상품전체목록보기
	@RequestMapping(value = "/list/productList", method = RequestMethod.GET)
	public String productListGet(Model model) {
		ArrayList<ProductVO> vos = shopService.getProductList("");
		model.addAttribute("vos", vos);
		
		return "shop/list/productList";
	}
	
	
}
