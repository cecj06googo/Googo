package com.forgetpwd.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.company.model.CompanyService;
import com.company.model.CompanyVO;
import com.forgetpwd.model.ForgetPwdService;
import com.member.model.MemService;
import com.member.model.MemVO;

public class ResetPwdServlet extends HttpServlet {
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	              throws ServletException,IOException{
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
	              throws ServletException, IOException{
		req.setCharacterEncoding("UTF-8");
		
		Map<String, String> errMsgs = new HashMap<String, String>();
		req.setAttribute("errMsgs", errMsgs);
		HttpSession session = req.getSession();
		try{
			/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
			String userAccount = req.getParameter("resetPwdMail");
			if(userAccount == null || userAccount.trim().length() == 0){
				errMsgs.put("errorAccount", "帳號欄請勿空白");
			}
			String accountReg = "^\\S+@\\S+\\.\\S{2,3}$";
			if(!userAccount.trim().matches(accountReg)){
				errMsgs.put("errorAccount", "帳號格式有誤，請輸入Email");
			}
			String userIdentity = req.getParameter("optionsRadios");
			String newPwd = req.getParameter("newpwd");
			if(newPwd == null || newPwd.trim().length() == 0){
				errMsgs.put("errorPwd", "密碼欄請勿空白");
			}
			String pwdReg ="^[\\w]{6,12}$";
			if(!newPwd.trim().matches(pwdReg)){
				errMsgs.put("errorPwd", "密碼格式有誤(英數各一,長度限6~12字數");
			}
			String newPwdCheck = req.getParameter("newpwdcheck");
			if(!newPwd.equals(newPwdCheck)){
				errMsgs.put("errorPwdCheck", "兩次輸入的密碼不一致");
			}
			// Send the use back to the form, if there were errors
			if(!errMsgs.isEmpty()){
				RequestDispatcher failureView = req.getRequestDispatcher("/_01_login/resetPwd.jsp");
				failureView.forward(req, res);
			}
			/***************************2.開始查詢資料*****************************************/
			ForgetPwdService forgetPwdSvc = new ForgetPwdService();
			if("Mem".equals(userIdentity)){
				forgetPwdSvc.updateUser(userIdentity,userAccount,newPwd);

				}else if("Com".equals(userIdentity)){
					forgetPwdSvc.updateUser(userIdentity,userAccount,newPwd);
				}
			/***************************3.修改完成,準備轉交(Send the Success view)*************/
			String url = "/_01_login/resetPwdSuccess.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
			successView.forward(req, res);
			
			
		}catch(Exception e){
			errMsgs.put("errorException", e.getMessage());
//			RequestDispatcher failureView = req.getRequestDispatcher("/_01_login/resetPwd.jsp");
//			failureView.forward(req, res);
			
		}//end of catch
		
	}//end of doPost

}//end of class
