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
import org.springframework.web.bind.annotation.ResponseBody;

import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.product.product.model.ProductBean;
import com.product.product.model.ProductDAOHibernate;
import com.product.product.model.ProductService;
import com.product.productcomment.model.ProductCommentBean;
import com.product.productcomment.model.ProductCommentService;

import redis.clients.jedis.Jedis;


@Controller
public class ProductDisplayController {

	@Autowired
	private ProductService productService;
	
	@Autowired
	private ProductCommentService productCommentService;
	
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
	public String displayAll(HttpSession session, String page, Model model, String keyword,
			String price, String type) {
		
		//搜尋關鍵字過濾 類別過濾
		List<ProductBean> list = null;
		System.out.println(type);
		if( type != null &&  !"產品分類".equals(type) && keyword!=null && keyword!=""  ) {
			String keyword2 = keyword.trim();
			NativeQuery query = this.session.createSQLQuery(
				"select * from product where product_name like '%"+ keyword2 +"%' and "
						+ "product_type = '" + type + "' "
			);
			query.addEntity(ProductBean.class);
			list = (List<ProductBean>) query.list();
			model.addAttribute("keyword", keyword);
			model.addAttribute("type", type);
		
		} else if(keyword!=null && keyword!="") {
			String keyword2 = keyword.trim();
			NativeQuery query = this.session.createSQLQuery(
					"select * from product where product_name like '%"+ keyword2 +"%'"
			);
			query.addEntity(ProductBean.class);
			list = (List<ProductBean>) query.list();
			model.addAttribute("keyword", keyword);
		}else if(type != null &&  !"產品分類".equals(type)) {
			NativeQuery query = this.session.createSQLQuery(
					"select * from product where product_type = '" + type + "' "
			);
			query.addEntity(ProductBean.class);
			list = (List<ProductBean>) query.list();
			model.addAttribute("type", type);
		
		}else {
			list = productService.select(null);
		}
		
		//價錢過濾
		Integer price1=0;
		if(price!=null) {
			price1 = Integer.parseInt(price);
		}
		if(price1!= 0) {
			model.addAttribute("price", price);
			for(int i =0; i<list.size();i++) {
				if(list.get(i).getProductprice() > price1) {
					list.remove(list.get(i));
					i--;
				}
			}
		}


		
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
	public String productDetail(String productid, Model model, HttpSession session) {
		
//		session.setAttribute("memberid", 2);//先假裝有會員登入
		
		ProductBean bean = new ProductBean();
		Integer productidint = Integer.valueOf(productid);
		bean.setProductid(productidint);
		List list = (List) productService.select(bean);
		ProductBean bean2 = (ProductBean) list.get(0);
		model.addAttribute("ProductBean", bean2);
		
		
		Connection connection;
		List imgids = new ArrayList<Integer>();
		List<ProductCommentBean> comments = new ArrayList<ProductCommentBean>();
		
		try {
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/TFA105G1?serverTimezone=Asia/Taipei",
					"root", "password");

		
			PreparedStatement ps = connection.prepareStatement("SELECT * FROM PRODUCT_IMG where PRODUCT_ID = ? ");
			ps.setInt(1, productidint);
			ResultSet rSet = ps.executeQuery();
			
			while (rSet.next()) {
				imgids.add(rSet.getInt(1));
			}
			
			ps = connection.prepareStatement("SELECT * FROM PRODUCT_COMMENT where PRODUCT_ID = ? ");
			ps.setInt(1, productidint);
			ResultSet rSet2 = ps.executeQuery();
			
			while (rSet2.next()) { 
				ProductCommentBean productcomment = new ProductCommentBean();
				productcomment.setCommentid(rSet2.getInt(1));
				comments.add(productCommentService.select(productcomment).get(0));
			}
				
			rSet2.close();
			rSet.close();
			ps.close();
			connection.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
		MemberService memberService = new MemberService();
		List<MemberVO> members = memberService.getAll();
		model.addAttribute("members", members);
		
		
		model.addAttribute("imgids", imgids);
		model.addAttribute("comments", comments);
		

		return "product-detail";
	}
	
	
	@RequestMapping("/ShoppingCart")
	public String shoppingCart(Model model, HttpSession session) {
		
		session.setAttribute("memberid", 2);
//		List<ProductBean> list = productService.select(null);
//		model.addAttribute("list", list);
		
		Jedis jedis = new Jedis("localhost", 6379);
		
		Integer memberid = (Integer)session.getAttribute("memberid");
		String memberidstring = String.valueOf(memberid);
		List<Integer> productids = new ArrayList<Integer>();
		List<ProductBean> list = new ArrayList<ProductBean>();
		
		List<String> range2 = jedis.lrange("會員"+memberidstring, 0, -1);
		if(range2!=null && range2.size()!=0) {
			for (String product : range2) {
				productids.add(Integer.valueOf(product));
			}			
		}
		
		jedis.close();

		Integer totalprice = 0;
		
		for (Integer productid : productids) {
			ProductBean bean = new ProductBean();
			bean.setProductid(productid);
			list.add(productService.select(bean).get(0));
			totalprice = totalprice + productService.select(bean).get(0).getProductprice();
		}
		
		model.addAttribute("list", list);
		model.addAttribute("totalprice", totalprice);
	
		
	
		return "shopping-cart";
	}
	
	

	
}
