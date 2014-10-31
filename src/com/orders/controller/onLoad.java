package com.orders.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.orders.model.OrdersService;
import com.orders.model.OrdersVO;

public class onLoad extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Map<String, String> errorMsg = new HashMap<String, String>();
		// Map<String, String> msgOK = new HashMap<String, String>();
		request.setAttribute("ErrorMsg", errorMsg); // 顯示錯誤訊息
		try {
			Integer user_id = null;
			try {
				user_id = Integer.parseInt(session.getAttribute("user_id")
						.toString().trim());
			} catch (Exception e) {
				errorMsg.put("errorlogin", "真的不要這樣..");
			}

			// System.out.println(request.getParameter("action"));
			// 一定要有form標籤來把值包起來，透過submit按鈕才能把封包傳到Servlet裡頭

			if (errorMsg.isEmpty()) {
				Integer sel_stus = 1;
				String sel_time = "all";
				OrdersService odrSvc = new OrdersService();
				List<OrdersVO> ordVO = odrSvc.ordSearch(user_id, sel_stus,
						sel_time);

				/******************** (Send the Success view) ************/
				request.setAttribute("ordVO", ordVO);
				session.setAttribute("sel_stus", sel_stus);
				session.setAttribute("sel_time", sel_time);
				String url = "/_04_member/orderMem.jsp";
				RequestDispatcher successView = request
						.getRequestDispatcher(url);

				successView.forward(request, response);
			} else {
				String url = "/index.jsp";
				RequestDispatcher successView = request
						.getRequestDispatcher(url);

				successView.forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}// end post
}
