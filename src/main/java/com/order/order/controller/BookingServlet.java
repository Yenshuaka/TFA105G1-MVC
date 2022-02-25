package com.order.order.controller;

import java.io.IOException;
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

//import com.member.model.MemberService;
import com.member.model.MemberVO;
import com.order.order.model.memberupdate.*;
import com.order.order.model.memberupdate.MemberBean;
import com.product.product.model.ProductBean;
import com.product.product.model.ProductService;

@WebServlet("/booking.do")
public class BookingServlet extends HttpServlet {
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

		ProductService productService = context.getBean("productService", ProductService.class);

		com.member.model.MemberService memberService = new com.member.model.MemberService();

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("booking".equals(action)) {

			try {

				HttpSession session = req.getSession();
				String[] productids = req.getParameterValues("productid");// 傳來多個productid
				List<ProductBean> productBeans = new ArrayList<ProductBean>();
				for (int i = 0; i < productids.length; i++) {
					ProductBean bean = new ProductBean();
					bean.setProductid(Integer.valueOf(productids[i]));
					productService.select(bean);
					productBeans.add(productService.select(bean).get(0));

				}
				session.setAttribute("products", productBeans);

				
				/////////所有商品//////////
				List<ProductBean> products = productService.select(null);
				HttpSession session3 = req.getSession();
				session3.setAttribute("allProducts", products);

				
				
				
				// 會員session
				Integer memberid = (Integer) session.getAttribute("memberid");

				MemberVO memberVO = new MemberVO();
				memberVO.setMemberid(memberid);

				List<MemberVO> memberVOs = new ArrayList<MemberVO>();
				memberVOs.add(memberService.getOneMember(memberid));
//				memberVOs.add(memberService.select(memberVO).get(0));
				session.setAttribute("member", memberVO);

				List<MemberVO> allMember = memberService.getAll();
				System.out.println("allmember = " + allMember);
				HttpSession session4 = req.getSession();
				session4.setAttribute("allMember", allMember);

			

				String url = "order/orderbooking.jsp";
//				res.sendRedirect(url);
				RequestDispatcher sucessView = req.getRequestDispatcher(url);
				sucessView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				e.printStackTrace();
//				errorMsgs.add("刪除資料失敗:"+e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/emp/listAllEmp.jsp");
//				failureView.forward(req, res);
				System.out.print("導向booking失敗");
			}
		}

	}

}
