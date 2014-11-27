package com.login.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.codec.binary.Base64;

import com.util.HashService;




public class FindUserPassword implements Filter {

	
	public FindUserPassword() {
	}


	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		if (request instanceof HttpServletRequest && response instanceof HttpServletResponse ) {
			HttpServletRequest req = (HttpServletRequest) request;
			HttpServletResponse res = (HttpServletResponse) response;
			HttpSession session = req.getSession();
		
//		System.out.println("找餅乾!");    // 測試用訊息
		String cookieName = "";
		String user = "";
		String decrypPassword = "";
		String rememberMe = "false";
		String userIdentity = "";
		
		Cookie[] cookies = req.getCookies();
		
		if (cookies != null) {
//			System.out.println("找到Cookie, cookies.length=" + cookies.length);    // 測試用訊息
			for (int i = 0; i < cookies.length; i++) {
				cookieName = cookies[i].getName();
				if (cookieName.equals("user")) {
					user = cookies[i].getValue();
				}
				else if (cookieName.equals("password")) {
					String tmp = cookies[i].getValue();
					if (tmp != null) {    // AES + Base64 解密
						decrypPassword = HashService.decryptString(HashService.KEY, tmp);
					}
				}
				else if (cookieName.equals("rm")) {
					rememberMe = cookies[i].getValue();
				}
				else if (cookieName.equals("or")) {
					userIdentity = cookies[i].getValue();
				}
			} // end of for loop
		}
		else {
			System.out.println("找不到餅乾!!!!!");    // 測試用訊息
		} // end outer if..else
		session.setAttribute("user", user);
		session.setAttribute("password", decrypPassword);
		session.setAttribute("rememberMe", rememberMe);
		session.setAttribute("userIdentity", userIdentity);
		}
		chain.doFilter(request, response);
		
	} // end of doFilter
	
	public void init(FilterConfig fConfig) throws ServletException {
	}
	
	public void destroy() {
	}

}
