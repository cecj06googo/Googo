package com.forgetpwd.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
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
import com.forgetpwd.model.ForgetPwdVO;
import com.forgetpwd.model.SendResetPwdEmail;
import com.member.model.MemService;
import com.member.model.MemVO;

public class ForgetPwdServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	        throws ServletException, IOException{
		doPost(req,res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
	        throws ServletException, IOException{
		//文字資料轉內碼
		req.setCharacterEncoding("UTF-8");
		//準備存放錯誤訊息的物件
		HttpSession session = req.getSession();
		Map<String, String> errorMsgs = new HashMap<String, String>();
		//errorMsgs放入request物件內，識別字串為 "ErrorMsgs"
		req.setAttribute("errorMsgs", errorMsgs);
		//1.讀取使用者輸入資料
		String userAccount = req.getParameter("inputEmail");
		String userIdentity = req.getParameter("optionsRadios");
		// 2. 進行必要的資料轉換
		// 無
		// 3. 檢查使用者輸入資料
		//如果userEmail欄位為空白，放一個錯誤訊息到errorMsgMap之內
		if(userAccount == null || userAccount.trim().length() == 0){
			errorMsgs.put("errorAccount","E-mail欄必須輸入");
		}else if(userAccount != null && !userAccount.matches("[0-9a-zA-Z_-]+@[0-9a-zA-Z_-]+\\.[0-9a-zA-Z_-]+(\\.[0-9a-zA-Z_-])*")){
			errorMsgs.put("errorAccount","E-mail格式不正確");
		}
		if(!errorMsgs.isEmpty()){
			RequestDispatcher failureView = req.getRequestDispatcher("/_01_login/forgetPwd.jsp");
			failureView.forward(req, res);
			return;//程式中斷
		}
		
		/***************************2.開始查詢資料*****************************************/
/*		ForgetPwdService fpSvc = new ForgetPwdService();
		ForgetPwdVO forgetPwdVO = fpSvc.getOneUser(userAccount, userIdentity);
		if(forgetPwdVO == null){
			errorMsgs.add("查無此帳號");
		}
		if(!errorMsgs.isEmpty()){
			RequestDispatcher failureView = req.getRequestDispatcher("/_01_login/forgetPwd.jsp");
			failureView.forward(req, res);
			return;//程式中斷
		}
*/
		Integer userId = null;
		MemVO memVO = null;
		CompanyVO comVO = null;
		
		
	    ForgetPwdService forgetPwdSvc = new ForgetPwdService();
		userId = forgetPwdSvc.findId(userAccount, userIdentity);
		if("Mem".equals(userIdentity)){
			MemService memSvc = new MemService();
			memVO = memSvc.getOneMem(userId);
			session.setAttribute("memVO", memVO);
			if(memVO == null){
				errorMsgs.put("errorAccount", "查無此mem帳號");
			}
			}else if("Com".equals(userIdentity)){
				CompanyService comSvc = new CompanyService();
				comVO = comSvc.getOneCom(userId);
				session.setAttribute("comVO", comVO);
				if(comVO == null){
					errorMsgs.put("errorAccount","查無此com帳號");
				}
			}
		if(!errorMsgs.isEmpty()){
			RequestDispatcher failureView = req.getRequestDispatcher("/_01_login/forgetPwd.jsp");
			failureView.forward(req, res);
			return;//程式中斷
		}
		/***************************3.查詢完成,準備轉交(Send the Success view)*************/
		SendResetPwdEmail.sendResetEmail(userAccount, req.getServerName(), req.getLocalPort(), req.getContextPath());
		System.out.println("已寄出ResetMail");
		String url = "/_01_login/sendMailSuccess.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url);
		successView.forward(req, res);
		
		
	}//end of class

}
