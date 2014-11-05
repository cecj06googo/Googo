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
import com.member.model.MemVO;

public class MemServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
//新增-------------------------------------------------------------------------------------		
		if ("insertMem".equals(action)) { 
			Map<String, String> errorMsgs = new HashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String mem_account = req.getParameter("mem_account").trim();
				if (mem_account == null || mem_account.trim().length() == 0) {
					errorMsgs.put("errorAccount", "帳號欄請勿空白");
				}
				String memAccountReg = "^\\S+@\\S+\\.\\S{2,3}$"; 
				if (!mem_account.trim().matches(memAccountReg)) {
					errorMsgs.put("errorAccount","帳號格式有誤，請輸入Email");
				}
				
				
				String mem_pwd = req.getParameter("mem_pwd").trim();
				if (mem_pwd == null || mem_pwd.trim().length() == 0) {
					errorMsgs.put("errorPwd", "密碼欄請勿空白");
				}
				String memPwdReg = "^[\\w]{6,12}$";
				if (!mem_pwd.trim().matches(memPwdReg)) {
					errorMsgs.put("errorPwd", "密碼格式有誤(英數各一,長度限6~12字數");
				}
				String mem_name = req.getParameter("mem_name").trim();
				if (mem_name == null || mem_name.trim().length() == 0) {
					errorMsgs.put("errorName", "姓名請勿空白");
				}
				String comNameReg = "^[(\u4e00-\u9fa5)]{1,32}$";
				if (!mem_name.trim().matches(comNameReg)) {
					errorMsgs.put("errorName","請輸入中文姓名");
				}
				String str = req.getParameter("mem_gender".trim());
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.put("errorGender","請選擇性別");
				}
				Integer mem_gender = null;
				try {
					mem_gender = new Integer(str);
				} catch (Exception e) {
					errorMsgs.put("errorGender","請選擇性別");
				}
				java.sql.Date mem_bdate = null;
				try {
					mem_bdate = java.sql.Date.valueOf(req.getParameter("mem_bdate").trim());
				} catch (IllegalArgumentException e) {
					mem_bdate=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.put("errorDate","請輸入正確日期!");
				}
				String mem_idnumber = req.getParameter("mem_idnumber").trim();
				if (mem_idnumber == null || mem_idnumber.trim().length() == 0) {
					errorMsgs.put("errorIdnumber","請輸入身分證!");
				}
				String mem_tel = req.getParameter("mem_tel").trim();
				if (mem_tel == null || mem_tel.trim().length() == 0) {
					errorMsgs.put("errorTel", "電話請勿空白");
				}
				String memTelReg = "^[(0-9)-]{8,15}$";
				if (!mem_tel.trim().matches(memTelReg)) {
					errorMsgs.put("errorTel", "電話格式錯誤，請輸入數字且至少8碼");
				}
				String mem_phone = req.getParameter("mem_phone").trim();
				if (mem_phone == null || mem_phone.trim().length() == 0) {
					errorMsgs.put("errorPhone", "行動電話請勿空白");
				}
				String memPhoneReg = "^[(0-9)-]{10,15}$";
				if (!mem_phone.trim().matches(memPhoneReg)) {
					errorMsgs.put("errorPhone", "行動電話格式錯誤，請輸入數字且至少10碼");
				}
				String mem_address = req.getParameter("mem_address").trim();
				if (mem_address == null || mem_address.trim().length() == 0) {
					mem_address="不給地址";
				}
				
				MemVO memVO = new MemVO();
				memVO.setMem_account(mem_account);
				memVO.setMem_pwd(mem_pwd);
				memVO.setMem_name(mem_name);
				memVO.setMem_gender(mem_gender);
				memVO.setMem_bdate(mem_bdate);
				memVO.setMem_idnumber(mem_idnumber);
				memVO.setMem_tel(mem_tel);
				memVO.setMem_phone(mem_phone);
				memVO.setMem_address(mem_address);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memVO", memVO); // 存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/_02_register/register.jsp");
					failureView.forward(req, res);
					return;
					
				}
				
				/***************************2.開始新增資料***************************************/
				MemService memSvc = new MemService();
				memVO = memSvc.addMem(mem_account,mem_pwd,mem_name,mem_gender,mem_bdate,mem_idnumber,mem_tel,mem_phone,mem_address);				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				Thread.sleep(5000);
				String url = "/index.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);		
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.put("errorException",e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/_02_register/register.jsp");
				failureView.forward(req, res);
			}
		}
		
// 更新-------------------------------------------------------------------------------------
		if ("updateMem".equals(action)) { 
			
			Map<String, String> errorMsgs = new HashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				Integer mem_id = new Integer(req.getParameter("mem_id").trim());
				
				String mem_pwd = req.getParameter("mem_pwd").trim();
				if (mem_pwd == null || mem_pwd.trim().length() == 0) {
					errorMsgs.put("errorPwd", "密碼欄請勿空白");
				}
				String memPwdReg = "^[\\w]{6,12}$";
				if (!mem_pwd.trim().matches(memPwdReg)) {
					errorMsgs.put("errorPwd", "密碼格式有誤(英數各一,長度限6~12字數");
				}
				String mem_name = req.getParameter("mem_name").trim();
				if (mem_name == null || mem_name.trim().length() == 0) {
					errorMsgs.put("errorName", "姓名請勿空白");
				}
				String comNameReg = "^[(\u4e00-\u9fa5)]{1,32}$";
				if (!mem_name.trim().matches(comNameReg)) {
					errorMsgs.put("errorName","請輸入中文姓名");
				}
				String str = req.getParameter("mem_gender".trim());
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.put("errorGender","請選擇性別");
				}
				Integer mem_gender = null;
				try {
					mem_gender = new Integer(str);
				} catch (Exception e) {
					errorMsgs.put("errorGender","請選擇性別");
				}
				java.sql.Date mem_bdate = null;
				try {
					mem_bdate = java.sql.Date.valueOf(req.getParameter("mem_bdate").trim());
				} catch (IllegalArgumentException e) {
					mem_bdate=new java.sql.Date(System.currentTimeMillis());
					errorMsgs.put("errorDate","請輸入正確日期!");
				}
				String mem_idnumber = req.getParameter("mem_idnumber").trim();
				if (mem_idnumber == null || mem_idnumber.trim().length() == 0) {
					errorMsgs.put("errorIdnumber","請輸入身分證!");
				}
				String mem_tel = req.getParameter("mem_tel").trim();
				if (mem_tel == null || mem_tel.trim().length() == 0) {
					errorMsgs.put("errorTel", "電話請勿空白");
				}
				String memTelReg = "^[(0-9)-]{8,15}$";
				if (!mem_tel.trim().matches(memTelReg)) {
					errorMsgs.put("errorTel", "電話格式錯誤，請輸入數字且至少8碼");
				}
				String mem_phone = req.getParameter("mem_phone").trim();
				if (mem_phone == null || mem_phone.trim().length() == 0) {
					errorMsgs.put("errorPhone", "行動電話請勿空白");
				}
				String memPhoneReg = "^[(0-9)-]{10,15}$";
				if (!mem_phone.trim().matches(memPhoneReg)) {
					errorMsgs.put("errorPhone", "行動電話格式錯誤，請輸入數字且至少10碼");
				}
				String mem_address = req.getParameter("mem_address").trim();
				if (mem_address == null || mem_address.trim().length() == 0) {
					mem_address="不給地址";
				}
				
				MemVO memVO = new MemVO();
				memVO.setMem_id(mem_id);
				memVO.setMem_pwd(mem_pwd);
				memVO.setMem_name(mem_name);
				memVO.setMem_gender(mem_gender);
				memVO.setMem_bdate(mem_bdate);
				memVO.setMem_idnumber(mem_idnumber);
				memVO.setMem_tel(mem_tel);
				memVO.setMem_phone(mem_phone);
				memVO.setMem_address(mem_address);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("memVO", memVO); // 存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/_04_member/modMem.jsp");
					failureView.forward(req, res);
					return;
					
				}
				
				/***************************2.開始修改資料****************************************/
				MemService memSvc = new MemService();
				memVO = memSvc.updateMem(mem_pwd,mem_name,mem_gender,mem_bdate,mem_idnumber,mem_tel,mem_phone,mem_address,mem_id);
				/***************************3.修改完成,準備轉交(Send the Success view)*************/				
				String url = "/_04_member/modMem.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); 
				successView.forward(req, res);	

				/***************************其他可能的錯誤處理**************************************/
			} catch (Exception e) {
				errorMsgs.put("errorException",e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/_04_member/modMem.jsp");
				failureView.forward(req, res);
			}
		}
		
		
	}
}
