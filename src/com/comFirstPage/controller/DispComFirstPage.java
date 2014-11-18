package com.comFirstPage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DispComFirstPage
 */
@WebServlet("/DispComFirstPage")
public class DispComFirstPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("我有進來DispComfirst.java doGet");
		String comId=request.getParameter("comId");
		request.setAttribute("comId", comId);		
		System.out.println("comId="+comId);
		RequestDispatcher rd = request.getRequestDispatcher("/_05_company/company.jsp");
		System.out.println("跳轉company.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("我有進來DispComfirst.java doPost");
		String comId=request.getParameter("comId");
		System.out.println("comId="+comId);
	}
}
