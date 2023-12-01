package com.shoppingcart.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import com.shoppingcart.connection.DbCon;
import com.shoppingcart.doa.UserDoa;
import com.shoppingcart.model.User;

@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		try (PrintWriter out = response.getWriter()){
			//out.print("this is login servlet");
			String email = request.getParameter("login-email");
			String password =request.getParameter("login-password");
			try {
				UserDoa udao = new UserDoa(DbCon.getConnection());
				User user = udao.userLogin(email, password);
				if(user != null) {
					request.getSession().setAttribute("auth", user);
					response.sendRedirect("index.jsp");
					//out.print("user login");
				}else {
					out.print("user login failed");
				}
				
			}catch(ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
			//out.print(email+password);
			
		}
			
		}
	}


