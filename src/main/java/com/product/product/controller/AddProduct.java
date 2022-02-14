package com.product.product.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import com.post.model.PostService;
import com.product.product.model.ProductBean;
import com.product.product.model.ProductService;
import com.product.productloc.model.ProductLocBean;
import com.product.productloc.model.ProductLocService;

//QQQQQ
@WebServlet("/ProductManage")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		ServletContext applicationContext = this.getServletContext();
		ApplicationContext context = (ApplicationContext) applicationContext.getAttribute
				(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		ProductService productService = context.getBean("productService", ProductService.class);
		ProductLocService productLocService = context.getBean("productLocService", ProductLocService.class);
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
			
		

		if("insert".equals(action)) {
			
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			HttpSession session = req.getSession();
			session.setAttribute("errorMsgsadd", errorMsgs);
		
			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String productname = req.getParameter("productname");
				if (productname == null || productname.trim().length() == 0) {
					errorMsgs.add("商品名稱請勿空白");
				} 
				
				Integer productprice = null;
				try {
					productprice = new Integer(req.getParameter("productprice").trim());
				} catch (NumberFormatException e) {
					productprice = 0;
					errorMsgs.add("商品價格請填整數");
				}
				
				Integer memberrequired = null;
				try {
					memberrequired = new Integer(req.getParameter("memberrequired").trim());
				} catch (NumberFormatException e) {
					memberrequired = 0;
					errorMsgs.add("最少成團人數請填整數");
				}
				
				
				String productintro = req.getParameter("productintro").trim();
				if (productintro == null || productintro.trim().length() == 0) {
					errorMsgs.add("商品說明請勿空白");
				}
				
				
				String attention = req.getParameter("attention").trim();
				if (attention == null || attention.trim().length() == 0) {
					errorMsgs.add("注意事項請勿空白");
				}
				
				java.sql.Date startdate = null;
				try {
					startdate = java.sql.Date.valueOf(req.getParameter("startdate").trim());
				} catch (IllegalArgumentException e) {
					startdate=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入開始日");
				}
				
				java.sql.Date enddate = null;
				try {
					enddate = java.sql.Date.valueOf(req.getParameter("enddate").trim());
				} catch (IllegalArgumentException e) {
					enddate=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入結束日");
				}
				
				
				Double traveltime = null;
				try {
					traveltime = new Double(req.getParameter("traveltime").trim());
				} catch (NumberFormatException e) {
					traveltime = 0.0;
					errorMsgs.add("旅行時數請填數字");
				}
				
				String producttype = req.getParameter("producttype");
				

				ProductBean bean = new ProductBean();
				bean.setProductname(productname);
				bean.setProducttype(producttype);
				bean.setProductprice(productprice);
				bean.setMemberrequired(memberrequired);
				bean.setProductintro(productintro);
				bean.setAttention(attention);
				bean.setStartdate(startdate);
				bean.setEnddate(enddate);
				bean.setTraveltime(traveltime);
				bean.setState(0);
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					session.setAttribute("ProductBean", bean); // 含有輸入格式錯誤的empVO物件,也存入req
					
					res.sendRedirect(req.getContextPath()+"/MVC/AddProduct");
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				productService.insert(bean); // 商品資料
				session.removeAttribute("ProductBean");
				String[] cityid = req.getParameterValues("cityid");
				
				if(cityid!=null) {
					session.setAttribute("cityid", cityid);		
					res.sendRedirect(req.getContextPath()+"/ProductManage?action=addloc");
					return;
				}else {
					res.sendRedirect(req.getContextPath()+"/MVC/ProductManageController");
					return;
				}
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				res.sendRedirect(req.getContextPath()+"/MVC/AddProduct");
			}
		}
		
		
		
		if("update".equals(action)) {
			
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			HttpSession session = req.getSession();
			session.setAttribute("errorMsgsupdate", errorMsgs);
		
			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String productname = req.getParameter("productname");
				if (productname == null || productname.trim().length() == 0) {
					errorMsgs.add("商品名稱請勿空白");
				} 
				
				Integer productprice = null;
				try {
					productprice = new Integer(req.getParameter("productprice").trim());
				} catch (NumberFormatException e) {
					productprice = 0;
					errorMsgs.add("商品價格請填整數");
				}
				
				Integer memberrequired = null;
				try {
					memberrequired = new Integer(req.getParameter("memberrequired").trim());
				} catch (NumberFormatException e) {
					memberrequired = 0;
					errorMsgs.add("最少成團人數請填整數");
				}
				
				
				String productintro = req.getParameter("productintro").trim();
				if (productintro == null || productintro.trim().length() == 0) {
					errorMsgs.add("商品說明請勿空白");
				}
				
				
				String attention = req.getParameter("attention").trim();
				if (attention == null || attention.trim().length() == 0) {
					errorMsgs.add("注意事項請勿空白");
				}
				
				java.sql.Date startdate = null;
				try {
					startdate = java.sql.Date.valueOf(req.getParameter("startdate").trim());
				} catch (IllegalArgumentException e) {
					startdate=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入開始日");
				}
				
				java.sql.Date enddate = null;
				try {
					enddate = java.sql.Date.valueOf(req.getParameter("enddate").trim());
				} catch (IllegalArgumentException e) {
					enddate=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入結束日");
				}
				
				
				Double traveltime = null;
				try {
					traveltime = new Double(req.getParameter("traveltime").trim());
				} catch (NumberFormatException e) {
					traveltime = 0.0;
					errorMsgs.add("旅行時數請填數字");
				}
				
				String producttype = req.getParameter("producttype");
				
				ProductBean bean1 = (ProductBean) session.getAttribute("ProductBean");
				Integer productid = bean1.getProductid();
				
				ProductBean bean = new ProductBean();
				bean.setProductid(productid);
				bean.setProductname(productname);
				bean.setProducttype(producttype);
				bean.setProductprice(productprice);
				bean.setMemberrequired(memberrequired);
				bean.setProductintro(productintro);
				bean.setAttention(attention);
				bean.setStartdate(startdate);
				bean.setEnddate(enddate);
				bean.setTraveltime(traveltime);
				bean.setState(0);
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					session.setAttribute("ProductBean", bean); // 含有輸入格式錯誤的empVO物件,也存入req
					
					res.sendRedirect(req.getContextPath()+"/MVC/UpdateProduct");
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				productService.update(bean); // 商品資料
				session.removeAttribute("ProductBean");
				String[] cityid = req.getParameterValues("cityid");
				
				if(cityid!=null) {
					session.setAttribute("cityid", cityid);		
					res.sendRedirect(req.getContextPath()+"/ProductManage?action=addloc");
					return;
				}else {
					res.sendRedirect(req.getContextPath()+"/MVC/ProductManageController");
					return;
				}
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				res.sendRedirect(req.getContextPath()+"/MVC/AddProduct");
			}
		}
		
		
		
		
		
		
		
		if ("addloc".equals(action)) {
			
			Connection connection;
			 PreparedStatement preparedStatement;
			    Integer productid =0;
			try {
				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/TFA105G1?serverTimezone=Asia/Taipei", "root", "password");
				preparedStatement = connection.prepareStatement("SELECT * FROM PRODUCT  ORDER BY PRODUCT_ID DESC LIMIT 0 , 1");
				ResultSet rSet = preparedStatement.executeQuery();
				while (rSet.next()) {
					productid = rSet.getInt(1);
				}
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			HttpSession httpSession = req.getSession();
			String[] cityid = (String[])httpSession.getAttribute("cityid");
			for(int i = 0; i < cityid.length; i++) {
				ProductLocBean bean2 = new ProductLocBean();
				bean2.setProductid(productid);
				bean2.setCityid(Integer.valueOf(cityid[i]) );
				productLocService.insert(bean2);				
			}
			
			
			res.sendRedirect(req.getContextPath()+"/MVC/ProductManageController");
			return;
			
		}
		
		
		
		
		
		
		
		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			HttpSession session = req.getSession();
			session.setAttribute("errorMsgsdelete", errorMsgs);
			
	
			try {
				/***************************1.接收請求參數***************************************/
				Integer productid = new Integer(req.getParameter("productid"));
				
				/***************************2.開始刪除資料***************************************/
				ProductBean bean = new ProductBean();
				bean.setProductid(productid);
				productService.delete(bean);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				
				res.sendRedirect(req.getContextPath()+"/MVC/ProductManageController");
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				res.sendRedirect(req.getContextPath()+"/MVC/ProductManageController");
				
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			HttpSession session = req.getSession();
			
			try {
				/***************************1.接收請求參數****************************************/
				Integer productid = new Integer(req.getParameter("productid"));
				
				/***************************2.開始查詢資料****************************************/
				ProductBean bean = new ProductBean();
				bean.setProductid(productid);
				List<ProductBean> list = (List<ProductBean>)productService.select(bean);
				ProductBean bean2 = list.get(0);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				session.setAttribute("ProductBean", bean2);         // 資料庫取出的empVO物件,存入req
				res.sendRedirect(req.getContextPath()+"/MVC/UpdateProduct");
				return;

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				res.sendRedirect(req.getContextPath()+"/MVC/ProductManageController");
			}
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
