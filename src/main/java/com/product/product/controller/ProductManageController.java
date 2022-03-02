package com.product.product.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.product.product.model.ProductBean;
import com.product.product.model.ProductService;

@Controller
public class ProductManageController {
	@Autowired
	private ProductService productService;
	
//	@InitBinder
//	public void initMethod(WebDataBinder binder) {
//		binder.registerCustomEditor(java.sql.Date.class, 
//				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
//		
//		binder.registerCustomEditor(Integer.class, new CustomNumberEditor(Integer.class, true));
//		
//		binder.registerCustomEditor(Double.class, new CustomNumberEditor(Double.class, true));
//	}

	@RequestMapping("/ProductManageController")
	public String name(String action, HttpSession session, ProductBean bean, 
			Model model, String productid) {
		
		session.removeAttribute("ProductBean");
		
		if(productid!=null && productid!="") {
			
			ProductBean bean2 = new ProductBean();
			bean2.setProductid(Integer.valueOf(productid));
			List<ProductBean> list = productService.select(bean2);
			model.addAttribute("list", list);
			return "backstage/product/productmanage1";	
		}else if(action==null) {  //這是select全部的狀況	
			List<ProductBean> list = productService.select(null);
			model.addAttribute("list", list);
			return "backstage/product/productmanage1";
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
			return "redirect:/MVC/ProductManageController ";
//			return "productmanage1";
		}else {
			ProductBean bean = new ProductBean();
			bean.setProductid(Integer.valueOf(productid));
			ProductBean bean2 = (ProductBean) productService.select(bean).get(0);
			bean2.setState(0);
			productService.update(bean2);
			return "redirect:/MVC/ProductManageController ";
//			return "productmanage1";
		}
		
	}
	
	
	@RequestMapping("/AddProduct")
	public String addProduct(HttpSession session) {
		
		return "backstage/product/add-product1";
	}
	
	
	@RequestMapping("/UpdateProduct")
	public String updateProduct() {	
		return "backstage/product/update-product";
	}
	
	
	
}
