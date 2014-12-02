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
import com.util.HashService;

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
//		HttpSession session = req.getSession();
		Map<String, String> errMsgs = new HashMap<String, String>();
		Integer userId = null;
		MemVO memVO = null;
		CompanyVO comVO = null;
		//errorMsgs放入request物件內，識別字串為 "ErrorMsgs"
		req.setAttribute("errMsgs", errMsgs);
		
		//1.讀取使用者輸入資料
		String userAccount = req.getParameter("inputEmail");
		String userIdentity = req.getParameter("optionsRadios");
		String requestURI = req.getHeader("referer");
		System.out.println("requestURI is: "+requestURI);
		boolean error = false;
		// 2. 進行必要的資料轉換
		// 無
		// 3. 檢查使用者輸入資料
		//如果userEmail欄位為空白，放一個錯誤訊息到errorMsgMap之內
		if(userAccount == null || userAccount.trim().length() == 0){
			errMsgs.put("errAccount","E-mail欄必須輸入");
		}else if(userAccount != null && !userAccount.matches("[0-9a-zA-Z_-]+@[0-9a-zA-Z_-]+\\.[0-9a-zA-Z_-]+(\\.[0-9a-zA-Z_-])*")){
			errMsgs.put("errAccount","E-mail格式不正確");
		}
/*		if(!errMsgs.isEmpty()){
			RequestDispatcher failureView = req.getRequestDispatcher("/_01_login/forgetPwd.jsp");
			failureView.forward(req, res);
			return;//程式中斷
		}
*/		
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
		try{
		
		
	    ForgetPwdService forgetPwdSvc = new ForgetPwdService();
		userId = forgetPwdSvc.findId(userAccount, userIdentity);
		System.out.println("userId: " + userId);
		if("Mem".equals(userIdentity)){
			MemService memSvc = new MemService();
			memVO = memSvc.getOneMem(userId);
			String encrypedString1 = MemService.encryptString(memVO.getMem_account());
			String mem_qq =MemService.getMD5Endocing(encrypedString1);
			memVO.setMem_qq(mem_qq);
//			session.setAttribute("checkMemOK", memVO);
			System.out.println("VO內的mem_account: "+memVO.getMem_account());
			}else if("Com".equals(userIdentity)){
				CompanyService comSvc = new CompanyService();
				comVO = comSvc.getOneCom(userId);
				String encrypedString2 = HashService.encryptString(comVO.getComAccount());
				String comHashURL = HashService.getMD5Endocing(encrypedString2);
				comVO.setComHashURL(comHashURL);
//				session.setAttribute("checkComOK", comVO);
				System.out.println("session內的com_account: "+comVO.getComAccount());
			}
/*		if(!errMsgs.isEmpty()){
			RequestDispatcher failureView = req.getRequestDispatcher("/_01_login/forgetPwd.jsp");
			failureView.forward(req, res);
			return;//程式中斷

		}
*/		
		}catch(Exception e){
			System.out.println("出現exception!");
			errMsgs.put("errException", e.getMessage());
//			session.setAttribute("checkAccountError", "該帳號不存在");
//			session.setAttribute("noExistAccount", userAccount);
			error = true;
			RequestDispatcher failureView = req.getRequestDispatcher("/_01_login/reset.jsp");
			failureView.forward(req, res);
			
		}//end of catch
		
		/***************************3.查詢完成,準備轉交(Send the Success view)*************/
		if(!error){
//		session.removeAttribute("checkAccountError");
//		session.removeAttribute("noExistAccount");
		if("Mem".equals(userIdentity)){
			SendResetPwdEmail.sendMemResetEmail(memVO, req.getServerName(), req.getLocalPort(), req.getContextPath());
			
		}else if("Com".equals(userIdentity)){
			SendResetPwdEmail.sendComResetEmail(comVO, req.getServerName(), req.getLocalPort(), req.getContextPath());
		}
		
		System.out.println("已寄出ResetMail");
		String url = "/index.jsp";
		RequestDispatcher successView = req.getRequestDispatcher(url);
		successView.forward(req, res);
		}//end of if(!error)
	
	}//end of doPost	
	}//end of class

