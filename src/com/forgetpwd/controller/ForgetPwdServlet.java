package com.forgetpwd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ForgetPwdServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	        throws ServletException, IOException{
		doPost(req,res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
	        throws ServletException, IOException{
		String userEmail = req.getParameter("inputEmail");
	}

}
