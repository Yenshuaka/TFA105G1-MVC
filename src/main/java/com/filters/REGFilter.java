//package com.filters;
//
//import java.io.IOException;
//
//import javax.servlet.*;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.admin.model.AdminVO;
//import com.member.model.MemberVO;
//
//@WebFilter(filterName = "REGFilter")
//public class REGFilter  implements Filter {
//
//	private FilterConfig config;
//
//	public void init(FilterConfig config) throws ServletException {
//		this.config = config;
//	}
//
//	public void destroy() {
//		config = null;
//	}
//
//	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//			throws IOException, ServletException {
//
//		response.setContentType("text/html; charset=UTF-8");
//
//		HttpServletRequest req = (HttpServletRequest) request;
//		HttpServletResponse res = (HttpServletResponse) response;
//
//		HttpSession session = req.getSession();
//		System.out.println("REGFilter work!!!!!!!!");
//		
////		AdminVO adminVO = (AdminVO) session.getAttribute("adminVO");
////		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
////		if (memberVO == null) {
////			System.out.println("memberVO is null");
////			session.setAttribute("location", req.getRequestURI());
////			System.out.println("來源網站: "+req.getRequestURI());
////			
////			res.sendRedirect(req.getContextPath() + "/download/FS-login.jsp");
////			return;
////		}
//
//		String sourceURL = (String) session.getAttribute("sourceURL");
//		if (sourceURL != null) {
//			session.removeAttribute("sourceURL");
//			res.sendRedirect(sourceURL);
//			return;
//		} else {
//			chain.doFilter(request, response);
//		}
////		chain.doFilter(request, response);
//	}
//}
