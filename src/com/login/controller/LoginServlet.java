package com.login.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.company.model.CompanyService;
import com.company.model.CompanyVO;
import com.login.model.LoginService;
import com.login.model.LoginVO;
import com.member.model.MemService;
import com.member.model.MemVO;

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
		// request.setAttribute("MsgOK", msgOK); // 顯示成功訊息

		// 1. 讀取使用者資料
		String userAccount = request.getParameter("userAccount");
		String userPwd = request.getParameter("userPwd");
		String userIdentity = request.getParameter("optionsRadios");
//		String rm = request.getParameter("rememberMe");
		String requestURI = (String) session.getAttribute("requestURI");
		
		// 2. 檢查使用者輸入資料 (前端做, 這裡暫不做)
		// 如果 userId 欄位為空白，放一個錯誤訊息到 errorMsgMap 之內
//		if (userAccount == null || userAccount.trim().length() == 0) {
//			errorMsg.put("AccountEmptyError", "帳號欄必須輸入");
//		}
//		// 如果 password 欄位為空白，放一個錯誤訊息到 errorMsgMap 之內
//		if (userPwd == null || userPwd.trim().length() == 0) {
//			errorMsg.put("PasswordEmptyError", "密碼欄必須輸入");
//		}
		
		// RememberMe  (暫不做)
		Cookie cookieUser = null;
		Cookie cookiePassword = null;
		Cookie cookieRememberMe = null;
		
//		if (rm != null) {
//			cookieUser = new Cookie("user", userAccount);
//			cookieUser.setMaxAge(30*60*60);
//			cookieUser.setPath(request.getContextPath());
////			String encodePassword = Base64.encode(password.getBytes());
//			cookiePassword = new Cookie("password", userPwd);
//			cookiePassword.setMaxAge(30*60*60);
//			cookiePassword.setPath(request.getContextPath());
//			cookieRememberMe = new Cookie("rm", "true");
//			cookieRememberMe.setMaxAge(30*60*60);
//			cookieRememberMe.setPath(request.getContextPath());
//		} else {
//			cookieUser = new Cookie("user", userAccount);
//			cookieUser.setMaxAge(0);
//			cookieUser.setPath(request.getContextPath());
//			cookiePassword = new Cookie("password", userPwd);
////			String encodePassword = Base64.encode(password.getBytes());
////			cookiePassword = new Cookie("password", encodePassword);
//			cookiePassword.setMaxAge(0);
//			cookiePassword.setPath(request.getContextPath());
//			cookieRememberMe = new Cookie("rm", "false");
//			cookieRememberMe.setMaxAge(30*60*60);
//			cookieRememberMe.setPath(request.getContextPath());
//		}
//		response.addCookie(cookieUser);
//		response.addCookie(cookiePassword);
//		response.addCookie(cookieRememberMe);
		
		// 如果 errorMsgMap 不是空的，表示有錯誤，交棒給login.jsp
		if (!errorMsg.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("/_01_login/login.jsp");
			rd.forward(request, response);
			return;
		}
		
		// 3. 進行 Business Logic 運算
		
		System.out.println("會員種類: " + userIdentity);
		
		Integer	userId;
		MemVO memVO = null;
		CompanyVO comVO = null;
		try {
			LoginService loginService = new LoginService();
			userId =  loginService.loginCheckId(userAccount, userPwd, userIdentity);

			if ("Mem".equals(userIdentity)) {
				MemService memService = new MemService();
				System.out.println("mem會員ID = " + userId);
				memVO = memService.getOneEmp(userId);
				session.setAttribute("LoginMemOK", memVO);
			}
			else if ("Com".equals(userIdentity)) {
				CompanyService comService = new CompanyService();
				comVO = comService.getOneCom(userId);
				session.setAttribute("LoginComOK", comVO);
				System.out.println("session裡面: " + comVO.getComName());
			}
		} catch(Exception e) {
			e.getStackTrace();
			errorMsg.put("LoginError", "該帳號不存在或密碼錯誤");

		}

		// 4. 轉交
		if (errorMsg.isEmpty()) {
			if (memVO != null) {
				if (requestURI != null) {
					requestURI = (requestURI.length() == 0 ? request
							.getContextPath() : requestURI);
					response.sendRedirect(response.encodeRedirectURL(requestURI));
					return;
				} else {
					response.sendRedirect(response.encodeRedirectURL(request
							.getContextPath()));
					return;
				}
			}
			else if (comVO != null) {
				if (requestURI != null) {
					requestURI = (requestURI.length() == 0 ? request.getContextPath() + "/manage.jsp" : requestURI);
					response.sendRedirect(response.encodeRedirectURL(requestURI));
					return;
				} else {
					System.out.println("進入商家後端");
					response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/manage.jsp"));
					return;
				}
			}
		}
		else {
			// 如果errorMsgMap不是空的，表示有錯誤，交棒給login.jsp
						RequestDispatcher rd = request.getRequestDispatcher("/_01_login/login.jsp");
						rd.forward(request, response);
						return;
		}
		
//		
//		// ------------------新增訂單----------------------
//
//			String user_account = "";
//			String user_pwd = "";
//			String user_identity = "";
//
//			user_account = request.getParameter("user_account");
//			user_pwd = request.getParameter("user_pwd");
//			user_identity = request.getParameter("optionsRadios");
//
//			System.out.println(user_account);
//			System.out.println(user_pwd);
//			System.out.println(user_identity);
//
//			// ---------------寫入database----------------------
//			try {
//
//				LoginService loginSvc = new LoginService();
//				LoginVO loginVO = loginSvc.loginCheck(user_account, user_pwd,
//						user_identity);
//				String url = "/index.jsp";
//				
//				//目前沒登出功能    重複登入會掛掉
//				if (loginVO.getMem_id() != null) {
//					session.setAttribute("Identity", user_identity);
//					session.setAttribute("user_id", loginVO.getMem_id()); 
//					System.out.println(loginVO.getMem_id());
//				} else if (loginVO.getCom_id() != null) {
//					session.setAttribute("Identity", user_identity);
//					session.setAttribute("user_id", loginVO.getCom_id()); 
//					url = "/orderOnLoad.gg";
//					System.out.println(loginVO.getCom_id());
//				} else {
//					errorMsg.put("errorLogin", "登入失敗，請檢查e-mail帳號及密碼");
//					
//				}
//
//				/******************** (Send the Success view) ************/
//				RequestDispatcher successView = request
//						.getRequestDispatcher(url);
//				successView.forward(request, response);
//				
//			
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//
	} // end doPost
}
