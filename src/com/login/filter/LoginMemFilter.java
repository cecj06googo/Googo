package com.login.filter;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Enumeration;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.model.MemVO;

public class LoginMemFilter implements Filter {
	Collection<String> url = new ArrayList<String>();
	String servletPath;
	String contextPath;
	String requestURI;

	public void init(FilterConfig fConfig) throws ServletException {
		// 存放必須登入的頁面路徑, 其定義在web.xml中
		Enumeration<String> e = fConfig.getInitParameterNames();
		while (e.hasMoreElements()) {
			String path = e.nextElement();
			url.add(fConfig.getInitParameter(path));
		}
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		request.setCharacterEncoding("UTF-8");
		boolean isRequestedSessionIdValid = false;
		if (request instanceof HttpServletRequest && response instanceof HttpServletResponse) {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse resp = (HttpServletResponse) response;
			HttpSession session = req.getSession();
			servletPath = req.getServletPath();  
			contextPath = req.getContextPath();
			requestURI  = req.getRequestURI();
			session.setAttribute("referURI", req.getHeader("referer"));    // 將原網頁路徑存入session
			isRequestedSessionIdValid = req.isRequestedSessionIdValid();
			
			// 取得商品id, 給訂單使用
			if(req.getParameter("detail_prod_id") != null) 
				session.setAttribute("detail_prod_id", req.getParameter("detail_prod_id"));
			
			// 需要登入
			if (mustLogin()) {
				if (checkLogin(req)) {    // 檢查是否已登入   
					chain.doFilter(request, response);    // 已經登入
				}
				else {    // 尚未登入
					session.setAttribute("requestURI", requestURI);
					if ( ! isRequestedSessionIdValid ) {
						session.setAttribute("timeOut", "使用逾時，請重新登入");
						resp.sendRedirect(contextPath + "/_01_login/login.jsp");
						return;
					}
					session.setAttribute("mustMemLogin", "mustMemLogin");
					System.out.println("mem I'll be back.");
					resp.sendRedirect(req.getHeader("referer"));
					return;
				}
			} 
			else {    	 // 不需要登入
				chain.doFilter(request, response);
			}
		}
		else {
			throw new ServletException("Request / Response 型態錯誤");
		}
	}

	private boolean checkLogin(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemVO loginToken = (MemVO) session.getAttribute("LoginMemOK");
		if (loginToken == null) {
			return false;
		} else {
			return true;
		}
	}

	private boolean mustLogin() {
		boolean login = false;
		for (String sURL : url) {
			if (sURL.endsWith("*")) {    // 判斷是否為 * 結尾, 成立回傳true
				System.out.println("( " + sURL + " )");
				sURL = sURL.substring(0, sURL.length() - 1);
				System.out.println("[ " + sURL + " ]");
				if (servletPath.startsWith(sURL)) {
					login = true;
					break;
				}
			} 
			else {
				if (servletPath.equals(sURL)) {
					login = true;
					break;
				}
			}
		}
//		System.out.println("mem------------------");
		return login;
	}

	public void destroy() {
	}

}
