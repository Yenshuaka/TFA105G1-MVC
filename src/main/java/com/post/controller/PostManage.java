package com.post.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import com.post.model.PostBean;
import com.post.model.PostDAO;
import com.post.model.PostDAOHibernate;
import com.post.model.PostService;


//@WebServlet("/PostManage")
public class PostManage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		ServletContext applicationContext = this.getServletContext();
		ApplicationContext context = (ApplicationContext) applicationContext.getAttribute
				(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		PostService postService = context.getBean("postService", PostService.class);
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if(action==null) {  //這是select全部的狀況
			List<PostBean> list = postService.select(null);
	
			HttpSession session = req.getSession();
			session.setAttribute("list", list);
			
			String url = "download/postmanage.jsp";
			res.sendRedirect(url); 
		}
		
		if ("delete".equals(action)) {
			
			try {
				/***************************1.接收請求參數***************************************/
				Integer postid = new Integer(req.getParameter("postid"));
				
				/***************************2.開始刪除資料***************************************/
				
				PostBean bean = new PostBean();
				bean.setPostid(postid);
				postService.delete(bean);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				List<PostBean> list = postService.select(null);
				
				HttpSession session = req.getSession();
				session.setAttribute("list", list);
				
				String url = "download/postmanage.jsp";
				res.sendRedirect(url);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
//				errorMsgs.add("刪除資料失敗:"+e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/emp/listAllEmp.jsp");
//				failureView.forward(req, res);
				System.out.print("刪除資料失敗");
			}
			
		
		};
	
		
		if ("insert".equals(action)) { // 來自add-post.jsp的請求  

			try {
				
				String posttitle = req.getParameter("posttitle");				
				Integer posttypeid = Integer.parseInt(req.getParameter("posttypeid").trim());
				Integer memberid = Integer.parseInt(req.getParameter("memberid").trim());
				String postcontent = req.getParameter("postcontent");
				
	
				
				/***************************2.開始新增資料***************************************/
				
				PostBean bean = new PostBean();
				bean.setPosttitle(posttitle);
				bean.setPosttypeid(posttypeid);
				bean.setMemberid(memberid);
				bean.setPostcontent(postcontent);
				bean.setPosttime(new Timestamp(System.currentTimeMillis()));
				
				postService.insert(bean);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				List<PostBean> list = postService.select(null);
				
				HttpSession session = req.getSession();
				session.setAttribute("list", list);
				
				String url = "download/postmanage.jsp";
				res.sendRedirect(url);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/emp/addEmp.jsp");
//				failureView.forward(req, res);
				System.out.print("新增資料失敗");
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			
			try {
				/***************************1.接收請求參數****************************************/
				Integer postid = new Integer(req.getParameter("postid"));
				
				/***************************2.開始查詢資料****************************************/
				
				PostBean bean = new PostBean();
				bean.setPostid(postid);
				List<PostBean> list = postService.select(bean);
				
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				
				HttpSession session = req.getSession();
				session.setAttribute("list", list);
				
				String url = "download/update-post.jsp";
				res.sendRedirect(url);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				e.printStackTrace();
//				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/emp/listAllEmp.jsp");
//				failureView.forward(req, res);
				System.out.println("尋找單一目標失敗");
			}
		}
		
		
		if ("update".equals(action)) { // 來自add-post.jsp的請求  

			try {
				String posttitle = req.getParameter("posttitle");				
				Integer posttypeid = Integer.parseInt(req.getParameter("posttypeid").trim());
				Integer memberid = Integer.parseInt(req.getParameter("memberid").trim());
				String postcontent = req.getParameter("postcontent");
				//以上先拿到參數
				
		
				/***************************2.開始修改資料***************************************/
				
			
				PostBean bean = new PostBean();
				HttpSession session = req.getSession();
				Integer postid = (Integer)session.getAttribute("postid");
				bean.setPostid(postid);
				bean.setPosttitle(posttitle);
				bean.setPosttypeid(posttypeid);
				bean.setMemberid(memberid);
				bean.setPostcontent(postcontent);
				bean.setPosttime(new Timestamp(System.currentTimeMillis()));
				
				postService.update(bean);
				
				/***************************3.修改完成,準備轉交(Send the Success view)***********/
				List<PostBean> list = postService.select(null);

				session.setAttribute("list", list);
				
				String url = "download/postmanage.jsp";
				res.sendRedirect(url);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/emp/addEmp.jsp");
//				failureView.forward(req, res);
				System.out.print("修改資料失敗");
			}
		}
		
		
		
		
		
		
	}



}
