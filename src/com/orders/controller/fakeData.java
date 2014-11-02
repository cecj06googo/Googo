package com.orders.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class fakeData extends HttpServlet{
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
		
		if ("insert".equals(action)) {
		
		String com_id = request.getParameter("com_id");
		String mem_id = request.getParameter("mem_id");
		
		session.setAttribute("com_id", com_id);  //session存值
		session.setAttribute("mem_id", mem_id);  //session存值
		
		/******************** (Send the Success view) ************/
		String url = "/_04_member/productsDetails.jsp";
		RequestDispatcher successView = request
				.getRequestDispatcher(url);									
		successView.forward(request, response);
		}// end insert
		
		if ("select".equals(action)) {
			String user_id = request.getParameter("user_id");
			//登入時要去資料庫檢查看帳號是屬於com_id(商家)還是mem_id(會員)
			session.setAttribute("user_id", user_id);  //session存值
			
			/******************** (Send the Success view) ************/
			String url = "/ordersSearch.jsp";
			RequestDispatcher successView = request
					.getRequestDispatcher(url);									
			successView.forward(request, response);
		}// end select
		
		
		if ("fakeLogin_mem".equals(action)) {
			String user_id = request.getParameter("user_id");
			//登入時要去資料庫檢查看帳號是屬於com_id(商家)還是mem_id(會員)
			session.setAttribute("user_id", user_id);  //session存值
			session.setAttribute("Identity", "Mem");  //session存值(代表登入的是會員)
			request.removeAttribute("action");
			/******************** (Send the Success view) ************/
			String url = "/orderOnLoad.gg";
			
			RequestDispatcher successView = request
					.getRequestDispatcher(url);									
			successView.forward(request, response);
		}// end login
		
	}

}
