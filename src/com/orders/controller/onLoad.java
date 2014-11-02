package com.orders.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.model.LoginVO;
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
		String action = request.getParameter("action");

		if ("login".equals(action)) {

			
			Integer com_id = new Integer(session.getAttribute("user_id").toString().trim());
			Integer sel_stus = 0;
			String sel_time = "all";

			OrdersService odrSvc = new OrdersService();
			List<OrdersVO> ordVO = odrSvc.ordSearch_com(com_id, sel_stus,
					sel_time);

			System.out.println(ordVO.size());

			int newOrd = 0;
			int noReCar = 0;
			for (int i = 0; i < ordVO.size(); i++) {
				OrdersVO obj = ordVO.get(i);
				if("未處理".equals(obj.getStatus_char())){
					newOrd++;
				}else if ("已出車".equals(obj.getStatus_char())){
					noReCar++;
				}
			}

			session.setAttribute("ordVO", ordVO);
			session.setAttribute("newOrd", newOrd);
			session.setAttribute("noReCar", noReCar);
			/******************** (Send the Success view) ************/
			String url = "/manage.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);
			successView.forward(request, response);
		}

		
		
		if ("fakeLogin_mem".equals(action)) {
			try {
				Integer user_id = null;
				String Identity = "Mem";
		
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
					List<OrdersVO> ordVO = odrSvc.ordSearch_mem(user_id,
							sel_stus, sel_time);

					/******************** (Send the Success view) ************/
					request.setAttribute("ordVO", ordVO);
					session.setAttribute("sel_stus", sel_stus);
					session.setAttribute("sel_time", sel_time);
					session.setAttribute("Identity", Identity);
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
		}
		
		
		if (!"login".equals(action)) {
			try {
				Integer user_id = null;
				String Identity = (String)session.getAttribute("Identity");
				if("Com".equals(Identity)){//暫時寫這樣，要分開!
					String url = "/_05_company/orderCom.jsp";
					RequestDispatcher successView = request
							.getRequestDispatcher(url);

					successView.forward(request, response);
					
					
					
				}
				
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
					List<OrdersVO> ordVO = odrSvc.ordSearch_mem(user_id,
							sel_stus, sel_time);

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
		}
	}// end post
}
