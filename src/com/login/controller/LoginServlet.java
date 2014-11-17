package com.login.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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
import com.member.model.MemService;
import com.member.model.MemVO;
import com.orders.model.LoginOrdersOnLoad;
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

		// 1. 讀取使用者資料
		String userAccount = request.getParameter("userAccount");
		String userPwd = request.getParameter("userPwd");
		String userIdentity = request.getParameter("optionsRadios");
//		String rm = request.getParameter("rememberMe");
		String requestURI = (String) session.getAttribute("requestURI");
		String referURI = (String) session.getAttribute("referURI");      // 登入前原網頁路徑
		boolean error = false;
		
		// 2. RememberMe  (暫不做)
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
		
		// 3. 進行會員身分驗證與登入確認
		System.out.println("會員種類: " + userIdentity);
		
		Integer	userId = null;    // 要設初值才能傳進方法內
		MemVO memVO = null;
		CompanyVO comVO = null;
		try {
			LoginService loginService = new LoginService();
			userId =  loginService.loginCheckId(userAccount, userPwd, userIdentity);

			if ("Mem".equals(userIdentity)) {
				MemService memService = new MemService();
				System.out.println("mem會員ID = " + userId);    // 測試用訊息
				memVO = memService.getOneMem(userId);
				session.setAttribute("LoginMemOK", memVO);
			}
			else if ("Com".equals(userIdentity)) {
				CompanyService comService = new CompanyService();
				comVO = comService.getOneCom(userId);
				session.setAttribute("LoginComOK", comVO);
				System.out.println("session裡面, 商家名稱: " + comVO.getComName());    // 測試用訊息
			}
			// 方便比對會員身分
			session.setAttribute("userIdentity", userIdentity);
		} catch(Exception e) {
			e.getStackTrace();
			session.setAttribute("LoginError", "該帳號不存在或密碼錯誤");
			error = true;

		}

		// 4. 登入成功, 準備導向
		if (!error) {
			session.removeAttribute("LoginError");
			session.removeAttribute("timeOut");
//			session.removeAttribute("referURI");
			if (memVO != null) {
				if (requestURI != null) {
					requestURI = (requestURI.length() == 0 ? request
							.getContextPath() : requestURI);
					response.sendRedirect(response.encodeRedirectURL(requestURI));
					return;
				} 
				else {
					response.sendRedirect(response.encodeRedirectURL(request
							.getContextPath()));
					return;
				}
			}
			else if (comVO != null) {
					System.out.println("進入商家後端");    // 測試用訊息
					// 商家訂單OnLoad
					LoginOrdersOnLoad OCOL = new LoginOrdersOnLoad();  
					session = OCOL.ComOnLoad(session,userId);
					response.sendRedirect(response.encodeRedirectURL(request.getContextPath() + "/manage.jsp"));
					return;
			}
		}
		else {    // 登入失敗, 返回上一頁
			System.out.println("檢查referURI = " + referURI);    // 測試用訊息
			if (referURI == null || referURI.length() == 0) {
				response.sendRedirect(response.encodeRedirectURL(request.
						getContextPath()));
				return;
			} 
			else {
				response.sendRedirect(referURI);    // 導向至登入前的原網頁
				return;
			}
		}
	} // end doPost
}
