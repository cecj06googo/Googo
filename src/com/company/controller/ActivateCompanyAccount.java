package com.company.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.model.CompanyService;
import com.company.model.CompanyVO;
import com.member.model.MemService;
//import com.member.model.MemVO;


public class ActivateCompanyAccount extends HttpServlet {  
	    private static final long serialVersionUID = 1L;  
	         
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
	    	
	    	request.setCharacterEncoding("UTF-8");
	    	Map<String, String> errorMsgs = new HashMap<String, String>();
	    	request.setAttribute("errorMsgs", errorMsgs);
	    	// 1.接收請求參數 - 輸入格式的錯誤處理
	    	try{
	    	String comHashURL = request.getParameter("v");
	        if (comHashURL == null || comHashURL.trim().length() == 0) {
				errorMsgs.put("errorv","無此商家帳號");
			}
	        if (!errorMsgs.isEmpty()) {
	        	RequestDispatcher failureView = request.getRequestDispatcher("/index.jsp");
				failureView.forward(request, response);
				return;	
			}
	        
	        // 2.開通帳號 
	        CompanyVO comVO = null;
	        CompanyService comService = new CompanyService();
	        Integer comID = comService.openComAccount(comHashURL);
	        if (comID != null) {
	        	comVO = comService.updateComStatus(comID, 1);
	        }
	        else {
	        	RequestDispatcher failureView = request
						.getRequestDispatcher("/_02_register/errorAccount.jsp");
				failureView.forward(request, response);
				return;
	        }
			
			// 3.新增完成,準備轉交(Send the Success view)
			request.getSession().setAttribute("LoginComOK", comVO); 
			String requestURI = request.getContextPath() + "/manage.jsp";
			response.sendRedirect(response.encodeRedirectURL(requestURI));
			// 其他可能的錯誤處理
	    	}catch (Exception e) {
				errorMsgs.put("errorException",e.getMessage());
				RequestDispatcher failureView = request
						.getRequestDispatcher("/_02_register/errorAccount.jsp");
				failureView.forward(request, response);
			}
	    }
	    	
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
	        doGet(request, response);  
	    }  
	}  

