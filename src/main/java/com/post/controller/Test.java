package com.post.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

import com.post.model.PostService;


@WebServlet("/Test")
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServletContext applicationContext = this.getServletContext();
		ApplicationContext context = (ApplicationContext) applicationContext.getAttribute
				(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		try {
			Connection con = context.getBean("dataSource", DataSource.class).getConnection();
			PreparedStatement pstmt = con.prepareStatement("select * from POST");
			ResultSet rs = pstmt.executeQuery();

		while (rs.next()) {
			System.out.println(rs.getInt("POST_ID"));
}
			
		} catch (BeansException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
