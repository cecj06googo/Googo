package com.forgetpwd.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ForgetPwdServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res)
	        throws ServletException, IOException{
		doPost(req,res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
	        throws ServletException, IOException{
		//文字資料轉內碼
		req.setCharacterEncoding("UTF-8");
		//準備存放錯誤訊息的Map物件
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		//errorMsgMap放入request物件內，識別字串為 "ErrorMsgKey"
		req.setAttribute("ErrorMsgKey", errorMsgMap);
		//1.讀取使用者輸入資料
		String userEmail = req.getParameter("inputEmail");
		String userIdentity = req.getParameter("optionsRadios");
		// 2. 進行必要的資料轉換
		// 無
		// 3. 檢查使用者輸入資料
		//如果userEmail欄位為空白，放一個錯誤訊息到errorMsgMap之內
		if(userEmail == null || userEmail.trim().length() == 0){
			errorMsgMap.put("AccountEmptyError", "E-mail欄必須輸入");
		}else if(userEmail != null && !userEmail.matches("[0-9a-zA-Z_-]+@[0-9a-zA-Z_-]+\\.[0-9a-zA-Z_-]+(\\.[0-9a-zA-Z_-])*")){
			errorMsgMap.put("AccountFormatError", "E-mail格式不正確");
		}else if()
		
	}

}
