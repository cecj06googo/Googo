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

public class GetOneCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public GetOneCompany() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		Map<String, String> errorMsgs = new HashMap<String, String>();
		req.setAttribute("errorMsgs", errorMsgs);
		
		// 1.接收請求參數 - 重複註冊的錯誤處理
		try {
			String str = req.getParameter("comID");

			if (str == null || (str.trim()).length() == 0)
				errorMsgs.put("errorComIDEmpty", "請輸入商家編號");
			// 若有輸入內容不符, 返回首頁提示錯誤訊息
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/C_index.jsp");
				failureView.forward(req, res);
				return;    //程式中斷
			}
			
			Integer comID = null;
			try {
				comID = new Integer(str);
			} catch (Exception e) {
				e.getStackTrace();
				errorMsgs.put("errorComIDFormat", "員工編號格式不正確");
			}
			// 若有輸入內容不符, 返回首頁提示錯誤訊息
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/C_index.jsp");
				failureView.forward(req, res);
				return;    //程式中斷
			}
			
			// 2.開始查詢資料
			CompanyService comService = new CompanyService();
			CompanyVO oneComVO = comService.getOneCom(comID);
			if (oneComVO == null)
				errorMsgs.put("errorComIDDup","查無資料");
			
			// 若有輸入內容不符, 返回首頁提示錯誤訊息
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/C_index.jsp");
				failureView.forward(req, res);
				return;    //程式中斷
			}
			
			// 3.查詢完成,準備轉交
			req.setAttribute("companyVO", oneComVO);
			RequestDispatcher successView = req.getRequestDispatcher("/Temp/_06_manage/edit_company.jsp");
			successView.forward(req, res);

		// 其他可能的錯誤處理
		} catch (Exception e) {
			errorMsgs.put("errorNull","無法取得資料:" + e.getMessage());
			RequestDispatcher failureView = req.getRequestDispatcher("/C_index.jsp");
			failureView.forward(req, res);
		}
	} // end doPost()
}
