package com.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.model.MemService;
//import com.member.model.MemVO;


public class ActivateAccountServlet extends HttpServlet {  
	    private static final long serialVersionUID = 1L;  
	         
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {  
	    	
	    	request.setCharacterEncoding("UTF-8");
	    	Map<String, String> errorMsgs = new HashMap<String, String>();
	    	request.setAttribute("errorMsgs", errorMsgs);
	    	/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
	    	try{
	    	String mem_qq = request.getParameter("mem_qq");  
	        if (mem_qq == null || mem_qq.trim().length() == 0) {
				errorMsgs.put("errorQQ","無此帳號");
			}
	        if (!errorMsgs.isEmpty()) {
	        	RequestDispatcher failureView = request.getRequestDispatcher("/index.jsp");
				failureView.forward(request, response);
				return;	
			}
	        MemService memSvc = new MemService();
			memSvc.openMem(mem_qq);				
			

			/***************************3.新增完成,準備轉交(Send the Success view)***********/
			//request.getSession().setAttribute("memVO", memVO); 
			String url = "/index.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url); 
			successView.forward(request, response);		
			/***************************其他可能的錯誤處理**********************************/
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

