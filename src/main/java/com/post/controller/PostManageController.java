package com.post.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.CustomNumberEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;

import com.post.model.PostBean;
import com.post.model.PostService;

@Controller
public class PostManageController {
	@Autowired
	private PostService postService;
	
	@InitBinder
	public void initMethod(WebDataBinder binder, HttpServletRequest req) throws UnsupportedEncodingException {
		
		req.setCharacterEncoding("UTF-8");
		
		binder.registerCustomEditor(Integer.class, new CustomNumberEditor(Integer.class, true));
		
		binder.registerCustomEditor(Double.class, new CustomNumberEditor(Double.class, true));
	}

	@RequestMapping("/PostManageController")
	public String name(String action, HttpSession session, PostBean bean, HttpServletRequest req) throws UnsupportedEncodingException {

		
		if(action==null) {  //這是select全部的狀況
			
			List<PostBean> list = postService.select(null);
			session.setAttribute("list", list);
			
			return "postmanage";
		}
		
		
		if ("delete".equals(action)) {
			
			try {
				/***************************1.接收請求參數***************************************/
				/***************************2.開始刪除資料***************************************/

				postService.delete(bean);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				List<PostBean> list = postService.select(null);
				session.setAttribute("list", list);
				
				return "postmanage";
				
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
				/***************************2.開始新增資料***************************************/	
				postService.insert(bean);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				List<PostBean> list = postService.select(null);
				session.setAttribute("list", list);
				
				return "postmanage";			
				
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
				
				/***************************2.開始查詢資料****************************************/
				
				List<PostBean> list = postService.select(bean);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				
				session.setAttribute("list", list);
				return "update-post";

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
				
				/***************************2.開始修改資料***************************************/
				Integer postid = (Integer)session.getAttribute("postid");
				bean.setPostid(postid);
				bean.setPosttime(new Timestamp(System.currentTimeMillis()));
				System.out.println(bean.getPosttitle());
				postService.update(bean);
				
				/***************************3.修改完成,準備轉交(Send the Success view)***********/
				List<PostBean> list = postService.select(null);

				session.setAttribute("list", list);
				
				return "postmanage";				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/emp/addEmp.jsp");
//				failureView.forward(req, res);
				System.out.print("修改資料失敗");
			}
	
		}
		return "";
}
}
