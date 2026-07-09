package com.firstsmile.servlet;

import java.io.IOException;

import com.firstsmile.dao.UserDAO;
import com.firstsmile.daoimpl.UserDAOImpl;
import com.firstsmile.dto.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/Register")
public class Register extends HttpServlet {
   @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	UserDAO udao=new UserDAOImpl();
	User user=new User();
	user.setName(req.getParameter("name"));
	user.setEmail(req.getParameter("email"));
	user.setPassword(req.getParameter("password"));
	user.setPhone(req.getParameter("phone"));
	user.setLocation(req.getParameter("address"));
	udao.addUser(user);
	req.setAttribute("baby", "User Registration Successful");
	RequestDispatcher rd=req.getRequestDispatcher("Login.jsp");
    rd.forward(req, resp);
	
}
}
