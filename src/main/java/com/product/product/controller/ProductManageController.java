package com.product.product.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.post.model.PostBean;
import com.product.product.model.ProductBean;
import com.product.product.model.ProductService;

@Controller
public class ProductManageController {
	@Autowired
	private ProductService productService;

	@RequestMapping("/ProductManageController")
	public String name(String action, HttpSession session, ProductBean bean, Model model) {

		if(action==null) {  //這是select全部的狀況	
			List<ProductBean> list = productService.select(null);
			model.addAttribute("list", list);
			System.out.println("ok");
			return "productmanage1";
		}
		
		return "";
	}
	
	
	@RequestMapping("/PutonGetoff")
	public String name2(String action, HttpSession session, String productid, Model model) {

	
		if(action.equals("puton")) {
			ProductBean bean = new ProductBean();
			bean.setProductid(Integer.valueOf(productid));
			ProductBean bean2 = productService.select(bean).get(0);
			bean2.setState(1);
			productService.update(bean2);
			return "redirect:/ProductManageController ";
//			return "productmanage1";
		}else {
			ProductBean bean = new ProductBean();
			bean.setProductid(Integer.valueOf(productid));
			ProductBean bean2 = (ProductBean) productService.select(bean).get(0);
			bean2.setState(0);
			productService.update(bean2);
			return "redirect:/ProductManageController ";
//			return "productmanage1";
		}
		
	}
	
	
	@RequestMapping("/AddProduct")
	public String addProduct() {	
		return "db-add-listing";
	}
	
	
	
	
	
	
}
