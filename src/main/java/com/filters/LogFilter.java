package com.filters;

import java.io.IOException;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemberVO;

@WebFilter(filterName = "logFilter", urlPatterns = {
	    "/download/FS-my-profile.jsp", 
	    "/download/FS-Index-Demo.jsp",
	    "/download/FS-edit-profile.jsp",
	    "/MVC/ShoppingCart",
	    "/order/FS-order.jsp",
	    "/order/FS-update_travelerlist.jsp",
	    "/MVC/Mylikes"
	    
})
public class LogFilter  implements Filter {

	private FilterConfig config;

	public void init(FilterConfig config) throws ServletException {
		this.config = config;
	}

	public void destroy() {
		config = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		
		System.out.println("LogFilter work!!!!!!!!");
		
		System.out.println("使用者 從來的? filter: "+req.getHeader("referer"));

		
		
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		if (memberVO == null) {
			System.out.println("memberVO is null");
			System.out.println("使用者 想去哪? filter: "+req.getRequestURI());
			
			session.setAttribute("sourceURL", req.getRequestURI());
			res.sendRedirect(req.getContextPath() + "/download/FS-login.jsp");
			return;
		}

//		String sourceURL = (String) session.getAttribute("sourceURL");
//		if (sourceURL != null) {
//			session.removeAttribute("sourceURL");
//			res.sendRedirect(sourceURL);
//			return;
//		} else {
//			chain.doFilter(request, response);
//		}
		chain.doFilter(request, response);
	}
}
