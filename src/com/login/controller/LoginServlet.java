package com.login.controller;

import java.io.IOException;

import java.util.HashMap;

import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.model.LoginService;
import com.login.model.LoginVO;

public class LoginServlet extends HttpServlet {

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
		// request.setAttribute("MsgOK", msgOK); // 顯示錯誤訊息

		String action = request.getParameter("action");

		// ------------------新增訂單----------------------
		if ("login".equals(action)) {

			String user_account = "";
			String user_pwd = "";
			String user_identity = "";

			user_account = request.getParameter("user_account");
			user_pwd = request.getParameter("user_pwd");
			user_identity = request.getParameter("optionsRadios");

			System.out.println(user_account);
			System.out.println(user_pwd);
			System.out.println(user_identity);

			// ---------------寫入database----------------------
			try {

				LoginService loginSvc = new LoginService();
				LoginVO loginVO = loginSvc.loginCheck(user_account, user_pwd,
						user_identity);
				String url = "/index.jsp";
				
				//目前沒登出功能    重複登入會掛掉
				if (loginVO.getMem_id() != null) {
					session.setAttribute("Identity", user_identity);
					session.setAttribute("user_id", loginVO.getMem_id()); 
					System.out.println(loginVO.getMem_id());
				} else if (loginVO.getCom_id() != null) {
					session.setAttribute("Identity", user_identity);
					session.setAttribute("user_id", loginVO.getCom_id()); 
					url = "/orderOnLoad.gg";
					System.out.println(loginVO.getCom_id());
				} else {
					errorMsg.put("errorLogin", "登入失敗，請檢查e-mail帳號及密碼");
					
				}

				/******************** (Send the Success view) ************/
				RequestDispatcher successView = request
						.getRequestDispatcher(url);
				successView.forward(request, response);
				
			
			} catch (Exception e) {
				e.printStackTrace();
			}

		} // end login

	} // end doPost
}
