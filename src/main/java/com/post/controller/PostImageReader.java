package com.post.controller;

import java.io.*;
import java.sql.*;
import java.util.List;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import com.post.model.PostBean;
import com.post.model.PostDAO;
import com.post.model.PostDAOHibernate;
import com.post.model.PostService;


@WebServlet("/PostImageReader")
public class PostImageReader extends HttpServlet {


	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("image/gif");
		ServletOutputStream out = res.getOutputStream();
		
		ServletContext applicationContext = this.getServletContext();
		ApplicationContext context = (ApplicationContext) applicationContext.getAttribute
				(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		PostService postService = context.getBean("postService", PostService.class);
		
		req.setCharacterEncoding("UTF-8");
		String postid = req.getParameter("postid");
		PostBean bean = new PostBean();
		bean.setPostid(Integer.parseInt(postid));
		List<PostBean> list = postService.select(bean);
		PostBean bean2 = list.get(0);
		
		byte[] pic = bean2.getPostpicture();
		out.write(pic);
	}
		

}