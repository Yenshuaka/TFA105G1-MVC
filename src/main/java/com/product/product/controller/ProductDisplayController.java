package com.product.product.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.product.product.model.ProductBean;
import com.product.product.model.ProductService;

@Controller
public class ProductDisplayController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping("/ProductDisplayController")
	public String displayAll(HttpSession session, String page, Model model) {

		//找出此頁該顯示哪幾筆商品
		List<ProductBean> list = productService.select(null);
		if (page == null) {
			page = "1";
		}
		int pageindex = Integer.valueOf(page);
		List<ProductBean> list2 = new ArrayList();

		for (int i = (pageindex - 1) * 4; i <= ((pageindex * 4) - 1); i++) {
			if ((i+1) <= list.size() ) {
				list2.add(list.get(i));
			}
		}
		
		
		//找出總共該有幾頁
		int totalpage = 0;
		if(list.size() % 4 == 0) {
			totalpage = list.size()/4;
		}else {
			totalpage = (list.size()/4) + 1;
		}
		model.addAttribute("totalpage", totalpage);

		//找出此頁該顯示的圖片們
		List imgids = new ArrayList();
		Connection connection;
		try {
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/TFA105G1?serverTimezone=Asia/Taipei",
					"root", "password");

			for (int i = 0; i < list2.size(); i++) {
				if (list2.get(i) != null) {
					PreparedStatement ps = connection
							.prepareStatement("SELECT * FROM PRODUCT_IMG where PRODUCT_ID = ? limit 1");
					ps.setInt(1, list2.get(i).getProductid());
					ResultSet rSet = ps.executeQuery();

					while (rSet.next()) {
						imgids.add(rSet.getInt(1));
					}
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		model.addAttribute("page", page);
		model.addAttribute("list2", list2);
		model.addAttribute("imgids", imgids);
		return "product-display";

	}
	
	
	@RequestMapping("/ProductDetail")
	public String productDetail(String productid, Model model) {
		
		ProductBean bean = new ProductBean();
		Integer productidint = Integer.valueOf(productid);
		bean.setProductid(productidint);
		List list = (List) productService.select(bean);
		ProductBean bean2 = (ProductBean) list.get(0);
		model.addAttribute("ProductBean", bean2);
		
		
		Connection connection;
		List imgids = new ArrayList<Integer>();
		try {
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/TFA105G1?serverTimezone=Asia/Taipei",
					"root", "password");

		
			PreparedStatement ps = connection.prepareStatement("SELECT * FROM PRODUCT_IMG where PRODUCT_ID = ? ");
			ps.setInt(1, productidint);
			ResultSet rSet = ps.executeQuery();
			
			while (rSet.next()) {
				imgids.add(rSet.getInt(1));
			}
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		model.addAttribute("imgids", imgids);
		

		return "product-detail";
	}
	
	
	@RequestMapping("/ShoppingCart")
	public String shoppingCart(Model model) {
		
		List<ProductBean> list = productService.select(null);
		model.addAttribute("list", list);
	
		return "shopping-cart";
	}
	
	
	
	
	
	
	
}
