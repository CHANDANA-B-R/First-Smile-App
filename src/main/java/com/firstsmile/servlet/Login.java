package com.firstsmile.servlet;

import java.io.IOException;

import com.firstsmile.dao.UserDAO;
import com.firstsmile.daoimpl.UserDAOImpl;
import com.firstsmile.dto.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet {
 @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	UserDAO udao=new UserDAOImpl();
	User user=udao.getUserByMailAndPassword(req.getParameter("email"), req.getParameter("password"));
	HttpSession session=req.getSession();
	if(user!=null) {
		
		session.setAttribute("baby", user);
	    resp.sendRedirect("Admin.jsp");
	}
	else {
		req.setAttribute("baby", "User doesn't exist");
		req.getRequestDispatcher("Register.jsp").forward(req,resp);
	}
}
}
