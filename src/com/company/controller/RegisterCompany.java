package com.company.controller;

import java.io.File;
import java.io.FileInputStream;
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

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.company.model.CompanyDAO;
import com.company.model.CompanyService;
import com.company.model.CompanyVO;
import com.util.HashService;

public class RegisterCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");

		Map<String, String> errorMsgs = new HashMap<String, String>();
		// Map<String, String> successMsgs = new HashMap<String, String>();

		// HttpSession session = req.getSession();
		// session.setAttribute("MsgOK", msgOK); //顯示常訊息
		req.setAttribute("errorMsgs", errorMsgs);

		try {
			// 1.接收請求參數 - 輸入格式的錯誤處理
			String comAccount = req.getParameter("comAccount");
			if (comAccount == null || comAccount.trim().length() == 0) {
				errorMsgs.put("errorAccount", "帳號欄請勿空白，請填入E-mail");
			}
			// \S 非空白字元; \.  跳脫字元"."	
			String comAccountReg = "^\\S+@\\S+\\.\\S{2,4}$"; 
			if (!comAccount.trim().matches(comAccountReg)) {
				errorMsgs.put("errorAccount", "帳號格式有誤(Email)");
			}

			String comPwd = req.getParameter("comPwd").trim();
			if (comPwd == null || comPwd.trim().length() == 0) {
				errorMsgs.put("errorPwd", "密碼欄請勿空白");
			}
			String comPwdReg = "^[\\w]{6,12}$";
			if (!comPwd.trim().matches(comPwdReg)) {
				errorMsgs.put("errorPwd", "密碼格式有誤(英數各一,長度限6~12字數)");
			}

			String comName = req.getParameter("comName");
			if (comName == null || comName.trim().length() == 0) {
				errorMsgs.put("errorName", "公司名稱請勿空白");
			}
			String comNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,32}$";
			if (!comName.trim().matches(comNameReg)) {
				errorMsgs.put("errorName",
						"公司名稱:只能是中、英文字母、數字和_ , 且長度必需在1到32之間");
			}

			String comOwner = req.getParameter("comOwner");
			if (comOwner == null || comOwner.trim().length() == 0) {
				errorMsgs.put("errorOwner", "公司代表人姓名請勿空白");
			}
			String comOwnerReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,32}$";
			if (!comOwner.trim().matches(comOwnerReg)) {
				errorMsgs.put("errorOwner",
						"公司名:只能是中、英文字母、數字和_ , 且長度必需在1到32之間");
			}

			String comAddr = req.getParameter("comAddr");
			if (comAddr == null || comAddr.trim().length() == 0) {
				errorMsgs.put("errorAddr", "公司地址請勿空白");
			}
//			String comAddrReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,32}$";
//			if (!comAddr.trim().matches(comAddrReg) ) {
//			    errorMsgs.put("errorAddr",
//			    		"公司名:只能是中、英文字母、數字和_ , 且長度必需在1到32之間");
//			}

			String comTel = req.getParameter("comTel");
			if (comTel == null || comTel.trim().length() == 0) {
				errorMsgs.put("errorTel", "公司電話請勿空白");
			}
			String comTelReg = "^[(0-9)-]{8,15}$";
			if (!comTel.trim().matches(comTelReg)) {
				errorMsgs.put("errorTel", "公司電話:只能是數字和-，且至少8碼");
			}

			String comFax = req.getParameter("comFax");
			if (comFax != null) {
			    String comFaxReg = "^[(0-9)-]{8,15}$";
			    if ((comFax.trim().length() != 0) && !comFax.trim().matches(comFaxReg))
				    errorMsgs.put("errorFax", "公司傳真:只能是數字和-，且至少8碼");
			}
			
			String comVAT = req.getParameter("comVAT");
			if (comVAT == null || comVAT.trim().length() == 0) {
				errorMsgs.put("errorVAT", "公司統編請勿空白");
			}
			String comVATReg = "^[(0-9)]{8}$";
			if (!comVAT.trim().matches(comVATReg)) {
				errorMsgs.put("errorVAT", "公司統編:只能是數字且為8碼");
			}
			
			Integer comStatus = 0;    // 未開通狀態
			System.out.println(comStatus);
			
			String encrypedStr  = HashService.encryptString(comAccount);
			String comHashURL = HashService.getMD5Endocing(encrypedStr);
			
			// 準備傳回jsp網頁顯示內容的VO
			CompanyVO companyVO = new CompanyVO();
			companyVO.setComAccount(comAccount);
			companyVO.setComPwd(comPwd);
			companyVO.setComName(comName);
			companyVO.setComOwner(comOwner);
			companyVO.setComAddr(comAddr);
			companyVO.setComTel(comTel);
			companyVO.setComFax(comFax);
			companyVO.setComVAT(comVAT);
			companyVO.setComStatus(comStatus);
			companyVO.setComHashURL(comHashURL);

			// 1.接收請求參數 - 重複註冊的錯誤處理
			CompanyService comService = new CompanyService();
//			if (!comService.verifyAccount(comAccount))
//				errorMsgs.put("errorAccountDup", "帳號重複，請重新輸入");
//			if (!comService.verifyVAT(comVAT))
//				errorMsgs.put("errorVATDup", "此統一編號已存在，請重新輸入");

			// 若有輸入內容不符, 返回首頁提示錯誤訊息
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("companyVO", companyVO);
				RequestDispatcher failureView = req
						.getRequestDispatcher("/_02_register/registerCom.jsp");
				failureView.forward(req, res);
				return;    //程式中斷
			}

			// 2.開始新增資料
			companyVO = comService.addCompany(comAccount, comPwd, comName,
					comOwner, comAddr, comTel, comFax, comVAT, comStatus, comHashURL);
			
			// 3.新增完成,準備轉交(寄送認證信)
//			SendActivateAccount.sendAccount(companyVO,req.getServerName(),req.getLocalPort(),req.getContextPath());
			String url = req.getContextPath() + "/index.jsp";
			res.sendRedirect(res.encodeRedirectURL(url));
		// 其他可能的錯誤處理
		} catch (Exception e) {
			errorMsgs.put("errorException", e.getMessage());
			RequestDispatcher failureView = req
					.getRequestDispatcher("/_02_register/registerCom.jsp");
			failureView.forward(req, res);
		}
	} // end doPost()

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
}


