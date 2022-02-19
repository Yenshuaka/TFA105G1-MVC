package com.product.product.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.product.product.model.ProductBean;
import com.product.product.model.ProductDAOHibernate;
import com.product.product.model.ProductService;

@Controller
public class ProductDisplayController {

	@Autowired
	private ProductService productService;
	
	@PersistenceContext
	private Session session;
	
	
//	@InitBinder
//	public void initMethod(WebDataBinder binder, HttpServletRequest req) throws UnsupportedEncodingException {
//		
//		req.setCharacterEncoding("UTF-8");
		
//		binder.registerCustomEditor(java.sql.Date.class, 
//				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
//		
//		binder.registerCustomEditor(Integer.class, new CustomNumberEditor(Integer.class, true));
//		
//		binder.registerCustomEditor(Double.class, new CustomNumberEditor(Double.class, true));
//	}
	
	
	
	
	
	@RequestMapping("/ProductDisplayController")
	public String displayAll(HttpSession session, String page, Model model, String refresh) {
		
		if("true".equals(refresh)) {
			session.removeAttribute("filterlist");
			session.removeAttribute("keyword");
			session.removeAttribute("price");
		}
			
		List<ProductBean> list = (List<ProductBean>)session.getAttribute("filterlist");
		//剩下remove問題以及搜尋值得問題
		
		//找出此頁該顯示哪幾筆商品
		if(list==null) {
			list = productService.select(null);
		}
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
	
	
	
	
	@RequestMapping("/ProductFilter")
	public String productFilter(Model model, HttpSession httpSession, String page, String keyword,
			String price) {
		
		List<ProductBean> list = null;
		if(keyword!="") {
			String keyword2 = keyword.trim();
			NativeQuery query = session.createSQLQuery(
					"select * from product where product_name like '%"+ keyword2 +"%'"
			);
			query.addEntity(ProductBean.class);
			list = (List<ProductBean>) query.list();
			httpSession.setAttribute("keyword", keyword);
		}else {
			list = productService.select(null);
			httpSession.removeAttribute("keyword");
		}
		
		Integer price1 = Integer.parseInt(price);
		if(price1!= 0) {
			httpSession.setAttribute("price", price);
			for(int i =0; i<list.size();i++) {
				if(list.get(i).getProductprice() > price1) {
					list.remove(list.get(i));
					i--;
				}
			}
		}else {
			httpSession.removeAttribute("price");
		}
		
		httpSession.setAttribute("filterlist", list);
		return "redirect:/MVC/ProductDisplayController";
		
		
		
		//找出此頁該顯示哪幾筆商品
//				if (page == null) {
//					page = "1";
//				}
//				int pageindex = Integer.valueOf(page);
//				List<ProductBean> list2 = new ArrayList();
//
//				for (int i = (pageindex - 1) * 4; i <= ((pageindex * 4) - 1); i++) {
//					if ((i+1) <= list.size() ) {
//						list2.add(list.get(i));
//					}
//				}
				
				
				
				
				//找出總共該有幾頁
//				int totalpage = 0;
//				if(list.size() % 4 == 0) {
//					totalpage = list.size()/4;
//				}else {
//					totalpage = (list.size()/4) + 1;
//				}
//				model.addAttribute("totalpage", totalpage);

				//找出此頁該顯示的圖片們
//				List imgids = new ArrayList();
//				Connection connection;
//				try {
//					connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/TFA105G1?serverTimezone=Asia/Taipei",
//							"root", "password");
//
//					for (int i = 0; i < list2.size(); i++) {
//						if (list2.get(i) != null) {
//							PreparedStatement ps = connection
//									.prepareStatement("SELECT * FROM PRODUCT_IMG where PRODUCT_ID = ? limit 1");
//							ps.setInt(1, list2.get(i).getProductid());
//							ResultSet rSet = ps.executeQuery();
//
//							while (rSet.next()) {
//								imgids.add(rSet.getInt(1));
//							}
//						}
//					}
//
//				} catch (SQLException e) {
					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//
//				model.addAttribute("page", page);
//				model.addAttribute("list2", list2);
//				model.addAttribute("imgids", imgids);
//				return "product-display";
		
	}
	
	
	
	
}
