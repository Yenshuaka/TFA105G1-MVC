package com.order.order.controller;

//http://localhost:7080/TFA105G1-MVC/MVC/ProductManageController
import java.io.IOException;
import java.io.Serializable;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import com.member.model.MemberVO;
import com.order.order.model.OrderBean;
import com.order.order.model.OrderService;
import com.order.order.model.memberupdate.MemberBean;
import com.order.order.model.memberupdate.MemberService;
import com.order.orderdetail.model.OrderdetailBean;
import com.order.orderdetail.model.OrderdetailService;
import com.order.travelerlist.model.TravelerlistBean;
import com.order.travelerlist.model.TravelerlistService;

import redis.clients.jedis.Jedis;

@WebServlet("/order.do")
public class OrderServlet extends HttpServlet implements Serializable {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		ServletContext applicationContext = this.getServletContext();
		ApplicationContext context = (ApplicationContext) applicationContext
				.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);

		OrderService orderService = context.getBean("orderService", OrderService.class);
		OrderdetailService orderdetailService = context.getBean("orderdetailService", OrderdetailService.class);
		TravelerlistService travelerlistService = context.getBean("travelerlistService", TravelerlistService.class);
		MemberService memberServiceOrder = context.getBean("memberService", MemberService.class);
		com.member.model.MemberService memberService = new com.member.model.MemberService();

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if (action == null) { // 這是select全部的狀況
			List<OrderBean> list = orderService.select(null);
			List<OrderdetailBean> list123 = orderdetailService.select(null);

			HttpSession session = req.getSession();
			HttpSession session1 = req.getSession();

			session.setAttribute("list", list);
			session1.setAttribute("list123", list123);

			List<MemberVO> allMembers = memberService.getAll();

			HttpSession session3 = req.getSession();
			session3.setAttribute("allMembers", allMembers);

			String url = "order/listAllOrder.jsp";
//			res.sendRedirect(url); 
			RequestDispatcher sucessView = req.getRequestDispatcher(url);
			sucessView.forward(req, res);

		}

//		

		if ("insert".equals(action)) { // 來自add-post.jsp的請求

			try {
				// order
				HttpSession session = req.getSession();
				MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
				Integer memberid1 = memberVO.getMemberid();
//				Integer memberid1 = (Integer)session.getAttribute("memberid");//抓session傳入資料庫
				Integer orderpriceamount = Integer.parseInt(req.getParameter("orderpriceamount").trim());
//				Integer usedfunpoints = Integer.parseInt(req.getParameter("usedfunpoints").trim());

				DateTimeFormatter dtf4 = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
				LocalDateTime orderdate = LocalDateTime.now();
//				String orderdate = dtf4.format(LocalDateTime.now());

				OrderBean bean = new OrderBean();
				bean.setMemberid(memberid1);
				bean.setOrderdate(orderdate);
				bean.setOrderpriceamount(orderpriceamount);
				System.out.println("orderpriceamount = " + orderpriceamount);
				bean.setUsedfunpoints(50);

				orderService.insert(bean);

				/// orderdetail

//				List<OrderdetailBean> orderdetailBeans = new ArrayList();

				String[] productids = req.getParameterValues("productid"); // 跑迴圈裝進bean
				String[] numberoftravelers = req.getParameterValues("numberoftraveler");
				String[] productprices = req.getParameterValues("productprice");
//				String[] orderrewardpoints = req.getParameterValues("orderrewardpoints");
				String[] specialneeds = req.getParameterValues("specialneeds");
				String[] imgids = req.getParameterValues("imgid");

//				Integer productid = Integer.parseInt(req.getParameter("productid").trim());
//				Integer numberoftraveler = Integer.parseInt(req.getParameter("numberoftraveler").trim());
//				Integer orderrewardpoints = Integer.parseInt(req.getParameter("orderrewardpoints").trim());
//				String specialneeds = req.getParameter("specialneeds");
//				Integer productprice = Integer.parseInt(req.getParameter("productprice").trim());

				OrderdetailBean bean2 = new OrderdetailBean();
				bean2.setOrderid(bean.getOrderid());
				for (int i = 0; i < productids.length; i++) {
					bean2.setProductid(Integer.valueOf(productids[i]));
					bean2.setNumberoftraveler(Integer.valueOf(numberoftravelers[i]));
					bean2.setProductprice(Integer.valueOf(productprices[i]));
					bean2.setOrderrewardpoints(5);
					bean2.setSpecialneeds(specialneeds[i]);
					bean2.setImgid(Integer.valueOf(imgids[i]));

					orderdetailService.insert(bean2);

				}

				// traveler
//				String lastname = req.getParameter("lastname");
//				String firstname = req.getParameter("firstname");
//				String gender = req.getParameter("gender");
//				Date birthday = Date.valueOf(req.getParameter("birthday").trim());
//				String idno = req.getParameter("idno");

				String[] lastnames = req.getParameterValues("lastname");
				String[] firstnames = req.getParameterValues("firstname");
				String[] genders = req.getParameterValues("gender");
				String[] birthdays = req.getParameterValues("birthday");
				String[] idnos = req.getParameterValues("idno");

				TravelerlistBean bean3 = new TravelerlistBean();

				for (int k = 0; k < productids.length; k++) {
					bean3.setOrderdetailno(bean2.getOrderdetailno());

					for (int i = 0; i < numberoftravelers.length; i++) {

						bean3.setLastname(lastnames[i]);
						bean3.setFirstname(firstnames[i]);
						bean3.setGender(genders[i]);
						bean3.setBirthday(Date.valueOf(birthdays[i]));
						bean3.setIdno(idnos[i]);
						travelerlistService.insert(bean3);
					}
				}

//				bean3.setOrderdetailno(bean2.getOrderdetailno());
//				bean3.setLastname(lastname);
//				bean3.setFirstname(firstname);
//				bean3.setGender(gender);
//				bean3.setBirthday(birthday);
//				bean3.setIdno(idno);

				// 更新會員資料
				Integer memberid = (Integer) session.getAttribute("memberid");
				String memberLastname = req.getParameter("memberLastname");
				String memberFirstname = req.getParameter("memberFirstname");
				String memberPhone = req.getParameter("memberPhone");
				String memberEmail = req.getParameter("memberEmail");
				String memberIdno = req.getParameter("memberIdno");

//				System.out.println("memberid = " + memberid);
//				System.out.println("memberLastname = " + memberLastname);
//				System.out.println("memberFirstname = " + memberFirstname);
//				System.out.println("memberPhone = " + memberPhone);
//				System.out.println("memberEmail = " + memberEmail);
//				System.out.println("memberIdno = " + memberIdno);

				MemberBean bean1 = new MemberBean();
				bean1.setMemberid(memberid1);
				bean1.setEmail(memberEmail);
				bean1.setFirstname(memberFirstname);
				bean1.setLastname(memberLastname);
				bean1.setPhone(memberPhone);
				bean1.setIdno(memberIdno);

				memberServiceOrder.update(bean1);

				// 購物車項目刪除
				Jedis jedis = new Jedis();

				jedis.del("會員" + memberid);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
//				List<OrderBean> list = orderService.select(bean);//新增完成後，秀出剩餘訂單
//
//				HttpSession session = req.getSession();
//				session.setAttribute("orderBean", list.get(0));//why新增用list.get(0)，但刪除用list就好?

				String url = "order/booking_confirm.jsp";
				res.sendRedirect(url);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/emp/addEmp.jsp");
//				failureView.forward(req, res);
				System.out.print("新增資料失敗");
			}
		}

//		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求
//
//			try {
//				/*************************** 1.接收請求參數 ****************************************/
//				Integer orderid = new Integer(req.getParameter("orderid"));
//				System.out.println(orderid);
//				
//
//				/*************************** 2.開始查詢資料 ****************************************/
//
//				OrderBean bean = new OrderBean();
//				bean.setOrderid(orderid);
//				List<OrderBean> list = orderService.select(bean);
//
//				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
//
//				HttpSession session = req.getSession();
//				session.setAttribute("orderBean", list.get(0));
//				session.setAttribute("orderid", req.getParameter("orderid"));
//
//				String url = "order/update_order_input.jsp";
//				res.sendRedirect(url);
//
//				/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				e.printStackTrace();
////				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
////				RequestDispatcher failureView = req
////						.getRequestDispatcher("/emp/listAllEmp.jsp");
////				failureView.forward(req, res);
//				System.out.println("尋找單一目標失敗");
//			}
//		}
//
//		if ("update".equals(action)) { // 來自add-post.jsp的請求
//
//			try {
//				Integer memberid = Integer.parseInt(req.getParameter("memberid").trim());
//				Integer orderpriceamount = Integer.parseInt(req.getParameter("orderpriceamount").trim());
//				Integer usedfunpoints = Integer.parseInt(req.getParameter("usedfunpoints").trim());
//				LocalDateTime orderdate = LocalDateTime.now();
//				// 以上先拿到參數
//
//				/*************************** 2.開始修改資料 ***************************************/
//
//				OrderBean bean = new OrderBean();
//				HttpSession session = req.getSession();
////				Integer orderid = (Integer)session.getAttribute("orderid");
//				Integer orderid = Integer.parseInt(req.getParameter("orderid").trim());
//
////				System.out.println(orderid);
//				bean.setOrderid(orderid);
//				bean.setMemberid(memberid);
//				bean.setOrderdate(orderdate);
//				bean.setOrderpriceamount(orderpriceamount);
//				bean.setUsedfunpoints(usedfunpoints);
//
//				orderService.update(bean);
//
////				System.out.println(bean);
//
//				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
//				List<OrderBean> list = orderService.select(bean); //??
//
////				System.out.println(list);
//
//				session.setAttribute("orderBean", list.get(0));
//
//				String url = "order/listOneOrder.jsp";
//				res.sendRedirect(url);
//
//				/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
////				errorMsgs.add(e.getMessage());
////				RequestDispatcher failureView = req
////						.getRequestDispatcher("/emp/addEmp.jsp");
////				failureView.forward(req, res);
//				System.out.print("修改資料失敗");
//			}
//		}

//	if ("delete".equals(action)) {
		//
//					try {
//						/*************************** 1.接收請求參數 ***************************************/
//						Integer orderid = new Integer(req.getParameter("orderid"));
		//
//						/*************************** 2.開始刪除資料 ***************************************/
		//
//						OrderBean bean = new OrderBean();
//						bean.setOrderid(orderid);
//						orderService.delete(bean);
		//
//						/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
//						List<OrderBean> list = orderService.select(bean); //刪除完成後，秀出剩餘訂單
		//
//						HttpSession session = req.getSession();
//						session.setAttribute("list", list);
		//
//						String url = "order/listAllOrder.jsp";
//						res.sendRedirect(url);
		//
//						/*************************** 其他可能的錯誤處理 **********************************/
//					} catch (Exception e) {
//						e.printStackTrace();
//						errorMsgs.add("刪除資料失敗:"+e.getMessage());
//						RequestDispatcher failureView = req
//								.getRequestDispatcher("/emp/listAllEmp.jsp");
//						failureView.forward(req, res);
//						System.out.print("刪除資料失敗");
//					}

//				}

//		if ("getOne_For_Display".equals(action)) { 
//
//			try {
//				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
//				Integer orderid = Integer.valueOf((String)req.getParameter("orderid"));
//
//				/*************************** 2.開始查詢資料 *****************************************/
//
//				OrderBean bean = orderService.getOneOrder(orderid);
//
//				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
//
//				HttpSession session2 = req.getSession();
//				session2.setAttribute("orderBean", bean);
//				String url = "order/listOneOrder.jsp";
//				res.sendRedirect(url);
//
//				/*************************** 其他可能的錯誤處理 *************************************/
//			} catch (Exception e) {
//				e.printStackTrace();
////				errorMsgs.add("刪除資料失敗:"+e.getMessage());
////				RequestDispatcher failureView = req
////						.getRequestDispatcher("/emp/listAllEmp.jsp");
////				failureView.forward(req, res);
//				System.out.print("查詢資料失敗");
//			}
//		}
	}
}
