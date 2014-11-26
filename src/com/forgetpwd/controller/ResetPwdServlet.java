package com.forgetpwd.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ResetPwdServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	              throws ServletException,IOException{
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
	              throws ServletException, IOException{
		req.setCharacterEncoding("UTF-8");
		
		Map<String, String> errorMsgs = new HashMap<String, String>();
		req.setAttribute("errorMsgs", errorMsgs);
		try{
			/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
			String userAccount = req.getParameter("resetPwdMail");
			if(userAccount == null || userAccount.trim().length() == 0){
				errorMsgs.put("errorAccount", "帳號欄請勿空白");
			}
			String accountReg = "^\\S+@\\S+\\.\\S{2,3}$";
			if(!userAccount.trim().matches(accountReg)){
				errorMsgs.put("errorAccount", "帳號格式有誤，請輸入Email");
			}
			String userIdentity = req.getParameter("optionsRadios");
			String newPwd = req.getParameter("newpwd");
			if(newPwd == null || newPwd.trim().length() == 0){
				errorMsgs.put("errorPwd", "密碼欄請勿空白");
			}
			String pwdReg ="^[\\w]{6,12}$";
			if(!newPwd.trim().matches(pwdReg)){
				errorMsgs.put("errorPwd", "密碼格式有誤(英數各一,長度限6~12字數");
			}
			String newPwdCheck = req.getParameter("newpwdcheck");
			if(!newPwd.equals(newPwdCheck)){
				errorMsgs.put("errorPwdCheck", "兩次輸入的密碼不一致");
			}
			// Send the use back to the form, if there were errors
			if(!errorMsgs.isEmpty()){
				RequestDispatcher failureView = req.getRequestDispatcher("/_01_login/resetPwd.jsp");
				failureView.forward(req, res);
			}
			
		}catch(Exception e){
			errorMsgs.put("errorException", e.getMessage());
			RequestDispatcher failureView = req.getRequestDispatcher("/_01_login/resetPwd.jsp");
			failureView.forward(req, res);
			
		}//end of catch
		
	}//end of doPost

}//end of class
