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

import com.member.model.MemberService;
import com.member.model.MemberVO;
@WebServlet("/member/member.do")
public class MemberServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/			
				Integer memberid = null;
				try {
					memberid = Integer.valueOf(req.getParameter("memberid").trim());
					if (memberid == null) {
						errorMsgs.add("請輸入會員編號");
					}
				} catch (Exception e) {
					errorMsgs.add("會員編號格式不正確");
				}				
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/download/BS-member_manage.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/download/BS-member_manage.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				MemberService memberSvc = new MemberService();
				MemberVO memberVO = memberSvc.getOneMember(memberid);
				if (memberVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/download/BS-member_manage.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("memberVO", memberVO); // 資料庫取出的memberVO物件,存入req
				String url = "/member/listOneMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneMember.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/member/select_page_member.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listOneMember.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer memberid = new Integer(req.getParameter("memberid"));

				/*************************** 2.開始查詢資料 ****************************************/
				MemberService memberSvc = new MemberService();
				MemberVO memberVO = memberSvc.getOneMember(memberid);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("memberVO", memberVO); // 資料庫取出的memberVO物件,存入req
				String url = "../download/BS-edit-member.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 BS-edit-member.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/download/BS-member_manage.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自update_member_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/

				// 回傳 memberid(隱藏),lastname, firstname, idno, gender, dateofbirth, 沒有Email

//Integer memberid = new Integer(req.getParameter("memberid").trim());
				Integer memberid = Integer.valueOf(req.getParameter("memberid").trim());

				String lastname = req.getParameter("lastname");
				String lnameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,20}$";
				if (lastname == null || lastname.trim().length() == 0) {
					errorMsgs.add("姓氏: 請勿空白");
				} else if (!lastname.trim().matches(lnameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("姓氏: 只能是中、英文字母、數字和_ , 且長度必需在1到20之間");
				}

				String firstname = req.getParameter("firstname");
				String fnameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,20}$";
				if (firstname == null || firstname.trim().length() == 0) {
					errorMsgs.add("名字: 請勿空白");
				} else if (!firstname.trim().matches(fnameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("名字: 只能是中、英文字母、數字和_ , 且長度必需在1到20之間");
				}

				String idno = req.getParameter("idno");
				String idnoReg = "^[a-zA-Z]\\d{9}$";
				if (idno == null || idno.trim().length() == 0) {
					errorMsgs.add("身分證字號: 請勿空白");
				} else if (!idno.trim().matches(idnoReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("身分證字號: 英文字母、數字 , 且長度必需在10");
				}

				String gender = req.getParameter("gender").trim();

				java.sql.Date dateofbirth = null;
				try {
					dateofbirth = java.sql.Date.valueOf(req.getParameter("dateofbirth").trim());
				} catch (IllegalArgumentException e) {

					dateofbirth = new java.sql.Date(System.currentTimeMillis());

					errorMsgs.add("請輸入日期!");
				}
				String country = req.getParameter("country").trim();

				String phone = req.getParameter("phone").trim();
				String phoneReg = "^09[0-9]{8}$";
				if (phone == null || phone.trim().length() == 0) {
					errorMsgs.add("手機: 請勿空白");
				} else if (!phone.trim().matches(phoneReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("手機: 輸入開頭09 + 8碼數字");
				}

				// Pack into memberVO
				MemberVO memberVO = new MemberVO();
				memberVO.setMemberid(memberid);
				memberVO.setLastname(lastname);
				memberVO.setFirstname(firstname);
				memberVO.setIdno(idno);
				memberVO.setGender(gender);
				memberVO.setDateofbirth(dateofbirth);
				memberVO.setCountry(country);
				memberVO.setPhone(phone);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					System.out.println(errorMsgs);
					req.setAttribute("memberVO", memberVO); // 含有輸入格式錯誤的memberVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/download/BS-edit-member.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				MemberService memberSvc = new MemberService();
				memberVO = memberSvc.updateMember(memberid, lastname, firstname, idno, gender, dateofbirth, country,
						phone);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("memberVO", memberVO); // 資料庫update成功後,正確的的memberVO物件,存入req
				String url = "/download/BS-listOneMember.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交BS-listOneMember.jsp
				successView.forward(req, res);

//				String url = "/download/BS-member_manage.jsp";
//				res.sendRedirect(req.getContextPath()+url);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/download/BS-edit-member.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { // 來自BS-add-member.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

				String email = req.getParameter("email").trim();

				String password = req.getParameter("password").trim();

				String lastname = req.getParameter("lastname");
				String lnameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,20}$";
				if (lastname == null || lastname.trim().length() == 0) {
					errorMsgs.add("會員姓: 請勿空白");
				} else if (!lastname.trim().matches(lnameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("會員姓: 只能是中、英文字母、數字和_ , 且長度必需在1到20之間");
				}

				String firstname = req.getParameter("firstname");
				String fnameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,20}$";
				if (firstname == null || firstname.trim().length() == 0) {
					errorMsgs.add("會員名: 請勿空白");
				} else if (!firstname.trim().matches(fnameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("會員姓名: 只能是中、英文字母、數字和_ , 且長度必需在1到20之間");
				}

				String idno = req.getParameter("idno");
				String idnoReg = "^[(a-zA-Z0-9)]{10}$";
				if (idno == null || idno.trim().length() == 0) {
					errorMsgs.add("身分證字號: 請勿空白");
				} else if (!idno.trim().matches(idnoReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("身分證字號: 英文字母、數字 , 且長度必需在10");
				}

				String gender = req.getParameter("gender").trim();

				java.sql.Date dateofbirth = null;
				try {
					dateofbirth = java.sql.Date.valueOf(req.getParameter("dateofbirth").trim());
				} catch (IllegalArgumentException e) {

					dateofbirth = new java.sql.Date(System.currentTimeMillis());

					errorMsgs.add("請輸入日期!");
				}

				String country = req.getParameter("country").trim();

				String phone = req.getParameter("phone").trim();
				String phoneReg = "^[(0-9)]{10}$";
				if (idno == null || idno.trim().length() == 0) {
					errorMsgs.add("手機: 請勿空白");
				} else if (!phone.trim().matches(phoneReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("手機: 數字 , 且長度必需在10");
				}

				String nickname = req.getParameter("nickname").trim();

				String selfintro = req.getParameter("selfintro").trim();

				// Pack into memberVO
				MemberVO memberVO = new MemberVO();
				memberVO.setEmail(email);
				memberVO.setPassword(password);
				memberVO.setFirstname(firstname);
				memberVO.setLastname(lastname);
				memberVO.setIdno(idno);
				memberVO.setGender(gender);
				memberVO.setDateofbirth(dateofbirth);
				memberVO.setCountry(country);
				memberVO.setPhone(phone);
				memberVO.setNickname(nickname);
				memberVO.setSelfintro(selfintro);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					System.out.println(errorMsgs);
					req.setAttribute("memberVO", memberVO); // 含有輸入格式錯誤的memberVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/download/BS-add-member.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				MemberService memberSvc = new MemberService();
				memberVO = memberSvc.addMember(email, password, firstname, lastname, idno, gender, dateofbirth, country,
						phone, nickname, selfintro);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
//				String url = "/download/BS-member_manage.jsp";				
//				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交BS-member_manage.jsp
//				successView.forward(req, res);

//				String urlALL = "http://localhost:8081/Ex-member 0201 MVC/src/main/webapp/download/BS-member_manage.jsp";
//				res.sendRedirect(urlALL);

//				req.setAttribute("memberVO", memberVO); // 資料庫update成功後,正確的的memberVO物件,存入req
//				String url = "/download/BS-listOneMember.jsp";
				String url = "/download/BS-member_manage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交
				successView.forward(req, res);
				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/download/BS-add-member.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer memberid = new Integer(req.getParameter("memberid"));

				/*************************** 2.開始刪除資料 ***************************************/
				MemberService memberSvc = new MemberService();
				memberSvc.deleteMember(memberid);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/download/BS-member_manage.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/download/BS-member_manage.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
