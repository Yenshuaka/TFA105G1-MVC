package com.product.product.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import com.post.model.PostService;
import com.product.product.model.ProductBean;
import com.product.product.model.ProductService;

//QQQQQ
@WebServlet("/ProductManage")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		ServletContext applicationContext = this.getServletContext();
		ApplicationContext context = (ApplicationContext) applicationContext.getAttribute
				(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		ProductService productService = context.getBean("productService", ProductService.class);
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
			
		List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
		HttpSession session = req.getSession();
		session.setAttribute("errorMsgs", errorMsgs);

		if("insert".equals(action)) {
		
			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String productname = req.getParameter("productname");
				if (productname == null || productname.trim().length() == 0) {
					errorMsgs.add("商品名稱: 請勿空白");
				} 
				
				Integer productprice = null;
				try {
					productprice = new Integer(req.getParameter("productprice").trim());
				} catch (NumberFormatException e) {
					productprice = 0;
					errorMsgs.add("商品價格請填整數.");
				}
				
				Integer memberrequired = null;
				try {
					memberrequired = new Integer(req.getParameter("memberrequired").trim());
				} catch (NumberFormatException e) {
					memberrequired = 0;
					errorMsgs.add("最少成團人數請填整數.");
				}
				
				
				String productintro = req.getParameter("productintro").trim();
				if (productintro == null || productintro.trim().length() == 0) {
					errorMsgs.add("商品說明: 請勿空白");
				}
				
				
				String attention = req.getParameter("attention").trim();
				if (attention == null || attention.trim().length() == 0) {
					errorMsgs.add("注意事項: 請勿空白");
				}
				
				java.sql.Date startdate = null;
				try {
					startdate = java.sql.Date.valueOf(req.getParameter("startdate").trim());
				} catch (IllegalArgumentException e) {
					startdate=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入開始日!");
				}
				
				java.sql.Date enddate = null;
				try {
					enddate = java.sql.Date.valueOf(req.getParameter("enddate").trim());
				} catch (IllegalArgumentException e) {
					enddate=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.add("請輸入結束日!");
				}
				
				
				Double traveltime = null;
				try {
					traveltime = new Double(req.getParameter("traveltime").trim());
				} catch (NumberFormatException e) {
					traveltime = 0.0;
					errorMsgs.add("旅行時數請填數字.");
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
				productService.insert(bean);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/			
				res.sendRedirect(req.getContextPath()+"/MVC/ProductManageController");
				return;
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				res.sendRedirect(req.getContextPath()+"/MVC/AddProduct");
			}
		}
		
		
		
		
		
		
		
		
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
