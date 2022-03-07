package com.member.controller;

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

@WebServlet("/member/member.register")
public class MemberRegister extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("register".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

				String email = req.getParameter("email");
				String emailReg = "^([A-Za-z0-9_\\-\\.])+\\@([A-Za-z0-9_\\-\\.])+\\.([A-Za-z]{2,4})$";
				if (email == null || email.trim().length() == 0) {
					errorMsgs.add("帳號: 請勿空白");
				} else if (!email.trim().matches(emailReg)) {
					errorMsgs.add("帳號: 請輸入英文字母、數字和 _ , - 且含@ + 信箱網域");
				}

				String password = req.getParameter("password");
				String pwdReg = "^([A-Za-z0-9]){1,20}$";
				if (password == null || password.trim().length() == 0) {
					errorMsgs.add("密碼: 請勿空白");
				} else if (!password.trim().matches(pwdReg)) {
					errorMsgs.add("密碼: 請輸入英文字母、數字 且1~20個字");
				}

				String confirmPWD = req.getParameter("confirm-password");
				if (!password.equals(confirmPWD)) {
					errorMsgs.add("密碼不一致，請重新輸入!");
				}

				String agreement = req.getParameter("agreement");
				if (agreement == null) {
					errorMsgs.add("尚有條款未確認!");
				}
				MemberVO memberVO = new MemberVO();
				memberVO.setEmail(email);
				memberVO.setPassword(password);

				System.err.println(errorMsgs);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					String RejectUrl = "/download/FS-register.jsp";
					RequestDispatcher failureView = req.getRequestDispatcher(RejectUrl);
					failureView.forward(req, res);
					return;
				}
				/*************************** 2.開始查詢資料 *****************************************/
				MemberService memberSvc = new MemberService();
				MemberVO newMember = memberSvc.addMember(memberVO);
				Integer memberid = memberVO.getMemberid();
				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				HttpSession session = req.getSession();
				session.setAttribute("memberVO", newMember);
				session.setAttribute("memberid", memberid);
				System.out.println("儲存\"新\"memberVO到session! = " + newMember);

				String sourceURL = (String) session.getAttribute("sourceURL");
				System.out.println("memberRegister 來源網站? :" + sourceURL);
				if (sourceURL != null) {
					session.removeAttribute("sourceURL");
					res.sendRedirect(sourceURL);
					return;
				} else {
					String indexUrl = "/download/homepage2.jsp";
					res.sendRedirect(req.getContextPath() + indexUrl);
				}


				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				String RejectUrl = "/download/FS-login.jsp";
				RequestDispatcher failureView = req.getRequestDispatcher(RejectUrl);
				failureView.forward(req, res);
			}
		}
	}

}
