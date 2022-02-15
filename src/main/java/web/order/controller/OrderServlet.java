package web.order.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import web.order.model.OrderBean;
import web.order.model.OrderDAOHibernate;
import web.order.model.OrderService;
import web.order.model.hibernate.HibernateUtil;

@WebServlet("/order.do")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		SessionFactory sessionFactory = HibernateUtil.getSessionfactory();// 與model相依性太高，不好
		OrderDAOHibernate orderDAO = new OrderDAOHibernate(sessionFactory);
		OrderService orderService = new OrderService(orderDAO);//

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

//		if(action==null) {  //這是select全部的狀況
//			List<OrderBean> list = orderService.select(null);
//	
//			HttpSession session = req.getSession();
//			session.setAttribute("list", list.get(0));
//			
//			String url = "order/listAllOrder.jsp";
//			res.sendRedirect(url); 
//		}

		if ("getOne_For_Display".equals(action)) { 

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer orderid = Integer.valueOf((String)req.getParameter("orderid"));

				/*************************** 2.開始查詢資料 *****************************************/

				OrderService svc = new OrderService(orderDAO);
				OrderBean bean = svc.getOneOrder(orderid);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/

				HttpSession session = req.getSession();
				session.setAttribute("orderBean", bean);

				String url = "order/listOneOrder.jsp";
				res.sendRedirect(url);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				e.printStackTrace();
//				errorMsgs.add("刪除資料失敗:"+e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/emp/listAllEmp.jsp");
//				failureView.forward(req, res);
				System.out.print("查詢資料失敗");
			}
		}
		
	

		if ("delete".equals(action)) {

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer orderid = new Integer(req.getParameter("orderid"));

				/*************************** 2.開始刪除資料 ***************************************/

				OrderBean bean = new OrderBean();
				bean.setOrderid(orderid);
				orderService.delete(bean);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				List<OrderBean> list = orderService.select(bean); //刪除完成後，秀出剩餘訂單

				HttpSession session = req.getSession();
				session.setAttribute("list", list);

				String url = "order/listAllOrder.jsp";
				res.sendRedirect(url);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				e.printStackTrace();
//				errorMsgs.add("刪除資料失敗:"+e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/emp/listAllEmp.jsp");
//				failureView.forward(req, res);
				System.out.print("刪除資料失敗");
			}

		}
		;

		if ("insert".equals(action)) { // 來自add-post.jsp的請求

			try {

				Integer memberid = Integer.parseInt(req.getParameter("memberid").trim());
//				System.out.println(memberid);
				Integer orderpriceamount = Integer.parseInt(req.getParameter("orderpriceamount").trim());
//				System.out.println(orderpriceamount);
				Integer usedfunpoints = Integer.parseInt(req.getParameter("usedfunpoints").trim());
//				System.out.println(usedfunpoints);
				LocalDateTime orderdate = LocalDateTime.now();
//				System.out.println(orderdate);

				/*************************** 2.開始新增資料 ***************************************/

				OrderBean bean = new OrderBean();
				bean.setMemberid(memberid);
				bean.setOrderdate(orderdate);
				bean.setOrderpriceamount(orderpriceamount);
				bean.setUsedfunpoints(usedfunpoints);

				orderService.insert(bean);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				List<OrderBean> list = orderService.select(bean);//新增完成後，秀出剩餘訂單

				HttpSession session = req.getSession();
				session.setAttribute("orderBean", list.get(0));//why新增用list.get(0)，但刪除用list就好?

				String url = "order/listAllOrder.jsp";
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

		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer orderid = new Integer(req.getParameter("orderid"));
				System.out.println(orderid);

				/*************************** 2.開始查詢資料 ****************************************/

				OrderBean bean = new OrderBean();
				bean.setOrderid(orderid);
				List<OrderBean> list = orderService.select(bean);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/

				HttpSession session = req.getSession();
				session.setAttribute("orderBean", list.get(0));

				String url = "order/update_order_input.jsp";
				res.sendRedirect(url);

				/*************************** 其他可能的錯誤處理 **********************************/
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
				Integer memberid = Integer.parseInt(req.getParameter("memberid").trim());
				Integer orderpriceamount = Integer.parseInt(req.getParameter("orderpriceamount").trim());
				Integer usedfunpoints = Integer.parseInt(req.getParameter("usedfunpoints").trim());
				LocalDateTime orderdate = LocalDateTime.now();
				// 以上先拿到參數

				/*************************** 2.開始修改資料 ***************************************/

				OrderBean bean = new OrderBean();
				HttpSession session = req.getSession();
//				Integer orderid = (Integer)session.getAttribute("orderid");
				Integer orderid = Integer.parseInt(req.getParameter("orderid").trim());

//				System.out.println(orderid);
				bean.setOrderid(orderid);
				bean.setMemberid(memberid);
				bean.setOrderdate(orderdate);
				bean.setOrderpriceamount(orderpriceamount);
				bean.setUsedfunpoints(usedfunpoints);

				orderService.update(bean);

//				System.out.println(bean);

				/*************************** 3.修改完成,準備轉交(Send the Success view) ***********/
				List<OrderBean> list = orderService.select(bean); //??

//				System.out.println(list);

				session.setAttribute("orderBean", list.get(0));

				String url = "order/listOneOrder.jsp";
				res.sendRedirect(url);

				/*************************** 其他可能的錯誤處理 **********************************/
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
