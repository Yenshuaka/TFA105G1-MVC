package com.admin.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemberService;
import com.member.model.MemberVO;

@WebServlet("/admin.login")
public class AdminLogin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("login".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

				String account = req.getParameter("account");
				String accountReg = "^[(\\u4e00-\\u9fa5)(a-zA-Z0-9_)]{1,20}$";
				if (account == null || account.trim().length() == 0) {
					errorMsgs.add("帳號: 請勿空白");
				} else if (!account.trim().matches(accountReg)) {
					errorMsgs.add("帳號: 請輸入英文字母、數字");
				}
				String password = req.getParameter("password");
				String pwdReg = "^([A-Za-z0-9]){1,20}$";
				if (password == null || password.trim().length() == 0) {
					errorMsgs.add("密碼: 請勿空白");
				} else if (!password.trim().matches(pwdReg)) {
					errorMsgs.add("密碼: 請輸入英文字母、數字 且1~20個字");
				}
				System.out.println(account + password);
				/*************************** 2.開始查詢資料 *****************************************/
//				MemberService memberSvc = new MemberService();
//				MemberVO memberVO = memberSvc.memberLogin(account, password);	
				
				if(!"admin".equals(account) || !"123".equals(password) ) {
					errorMsgs.add("帳號或密碼錯誤! 請重新輸入");
				}
				

				System.err.println(errorMsgs); // []
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					String RejectUrl = "/download/BS-login.jsp";
					RequestDispatcher failureView = req.getRequestDispatcher(RejectUrl);
					failureView.forward(req, res);
					return;
				}
				
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/

				HttpSession session = req.getSession();
				session.setAttribute("admin", account);
				System.out.println("儲存admin到session! = " + account);
//				int days = 30;
//				session.setMaxInactiveInterval(86400 * days);  // 要存幾天?
//				String reqComeFrom = req.getHeader("referer"); // filter?
//				String location = (String) session.getAttribute("location");
//				System.out.println("來源網站 = " + location);				
				String indexUrl = "/download/BS-member_manage.jsp";
				res.sendRedirect(req.getContextPath() + indexUrl);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				String RejectUrl = "/download/BS-login.jsp";
				RequestDispatcher failureView = req.getRequestDispatcher(RejectUrl);
				failureView.forward(req, res);
			}
		}

		if ("logout".equals(action)) {
			HttpSession session = req.getSession();
			session.removeAttribute("memberid");
			session.invalidate();
			System.out.println("session 已清空!");			
			String indexUrl = "/download/BS-login.jsp";
			res.sendRedirect(req.getContextPath() + indexUrl);
		}
	}
}