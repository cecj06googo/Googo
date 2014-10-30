package com.company.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.company.model.CompanyService;
import com.company.model.CompanyVO;

public class UpdateCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req,
			HttpServletResponse res) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if("getOne_For_Display".equals(action)){
			Map<String, String> errorMsgs = new HashMap<String, String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				String str = req.getParameter("comID");

				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.put("errorComIDEmpty", "請輸入商家編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("index.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				Integer comID = null;
				try {
					comID = new Integer(str);
				} catch (Exception e) {
					errorMsgs.put("errorComIDFormat", "員工編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("index.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				CompanyService comSvc = new CompanyService();
				CompanyVO comVO = comSvc.getOneCom(comID);
				if (comVO == null) {
					errorMsgs.put("errorComIDDup","查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("index.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("companyVO", comVO); // 資料庫取出的comVO物件,存入req
				
				res.setContentType("image/jpeg");
				try{
					OutputStream os = res.getOutputStream();
					os.write(comVO.getComPic());
					os.flush();
					os.close();
				} catch(Exception e) {
					
				}
//				try{
//					FileOutputStream fos = new FileOutputStream("C:\\images\\output.jpg");
//					fos.write(comVO.getComPic());
//					fos.close();
//					} catch(Exception e) {
//						e.printStackTrace();
//					}
				
				String url = "edit_company.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 manage.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.put("errorNull","無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("index.jsp");
				failureView.forward(req, res);
			}
			
		}
		
		if ("update".equals(action)) {
			Map<String, String> errorMsgs = new HashMap<String, String>();
			Map<String, String> successMsgs = new HashMap<String, String>();
			
//			HttpSession session = req.getSession();
//	        session.setAttribute("successMsgs", successMsgs);  //顯示正常訊息
			req.setAttribute("successMsgs", successMsgs);
			req.setAttribute("errorMsgs", errorMsgs);
	        
			try {
				/* =====  接收請求參數 - 輸入格式的錯誤處理   ===== */
				Integer comID = new Integer(req.getParameter("comID").trim());
				
				String comAccount = req.getParameter("comAccount");

				String comPwd = req.getParameter("comPwd").trim();
				if(comPwd == null || comPwd.trim().length() == 0) {
					errorMsgs.put("errorPwdEmpty", "密碼欄請勿空白");
				}
				String comPwdReg = "^[\\w]{6,12}$";
				if(!comPwd.trim().matches(comPwdReg)) {
					errorMsgs.put("errorPwdFormat", "密碼格式有誤(英數各一,長度限6~12字數");
				}
				
				String comName = req.getParameter("comName");
				if(comName == null || comName.trim().length() == 0) {
					errorMsgs.put("errorNameEmpty", "公司名稱請勿空白");
				}
				String comNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,32}$";
				if(!comName.trim().matches(comNameReg) ) { 
					errorMsgs.put("errorNameFormat", "公司名稱:只能是中、英文字母、數字和_ , 且長度必需在1到32之間");
	            }
				
				String comOwner = req.getParameter("comOwner");
				if(comOwner == null || comOwner.trim().length() == 0) {
					errorMsgs.put("errorOwnerEmpty", "公司代表人姓名請勿空白");
				}
				String comOwnerReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,32}$";
				if(!comOwner.trim().matches(comOwnerReg) ) { 
					errorMsgs.put("errorOwnerFormat", "公司名:只能是中、英文字母、數字和_ , 且長度必需在1到32之間");
	            }
				
				String comAddr = req.getParameter("comAddr");
				if(comAddr == null || comAddr.trim().length() == 0) {
					errorMsgs.put("errorAddrEmpty", "公司地址請勿空白");
				}
				//以下練習正則(規)表示式(regular-expression)
				String comAddrReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,32}$";
				if(!comAddr.trim().matches(comAddrReg) ) { 
					errorMsgs.put("errorAddrFormat", "公司名:只能是中、英文字母、數字和_ , 且長度必需在1到32之間");
	            }
				
				String comTel = req.getParameter("comTel");
				if(comTel == null || comTel.trim().length() == 0) {
					errorMsgs.put("errorTelEmpty", "公司電話請勿空白");
				}
				String comTelReg = "^[(0-9)-]{8,15}$";
				if(!comTel.trim().matches(comTelReg) ) { 
					errorMsgs.put("errorTelFormat", "公司電話:只能是數字和-，且至少8碼");
	            }
				
				String comFax = req.getParameter("comFax");
				String comFaxReg = "^[(0-9)-]{8,15}$";
				if( (comFax.trim().length() != 0 ) && !comFax.trim().matches(comFaxReg)) { 
					errorMsgs.put("errorFaxFormat", "公司傳真:只能是數字和-，且至少8碼");
	            }			
				String comVAT = req.getParameter("comVAT");
				
				
				File file = new File("pics/pic2.jpg");
				byte[] comPic = new byte[(int) file.length()];

				try {
				    FileInputStream fileInputStream = new FileInputStream(file);
				    fileInputStream.read(comPic);
				    fileInputStream.close();
				} catch (Exception e) {
				    e.printStackTrace();
				}
				
				CompanyVO companyVO = new CompanyVO();
				companyVO.setComID(comID);
				companyVO.setComAccount(comAccount);
				companyVO.setComPwd(comPwd);
				companyVO.setComName(comName);
				companyVO.setComOwner(comOwner);
				companyVO.setComAddr(comAddr);
				companyVO.setComTel(comTel);
				companyVO.setComFax(comFax);
				companyVO.setComVAT(comVAT);
				companyVO.setComPic(comPic);
				
				/* =====  1.接收請求參數 - 重複註冊的錯誤處理   ===== */
				
				CompanyService cs = new CompanyService();

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("companyVO", companyVO); // 含有輸入格式錯誤的companyVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("edit_company.jsp");
					failureView.forward(req, res);
					return;
				}

				/* =====  2.開始新增資料   ===== */
					CompanyService ComSvc = new CompanyService();
					companyVO = ComSvc.updateCompany(comID, comAccount, comPwd, comName,
							comOwner, comAddr, comTel, comFax, comVAT, comPic);
//					CompanyDAO dao = new CompanyDAO();
//					dao.insert(companyVO);

				/* =====  3.新增完成,準備轉交(Send the Success view)  ===== */
					req.setAttribute("companyVO", companyVO);
					successMsgs.put("seccessUpdate", "修改完成");
					String url = "edit_company.jsp";
					RequestDispatcher successView = req
							.getRequestDispatcher(url); // 新增成功後轉交
					successView.forward(req, res);
//					res.sendRedirect(url);
				/* =====  其他可能的錯誤處理  ===== */
			} catch (Exception e) {
				errorMsgs.put("errorException", e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("edit_company.jsp");
				failureView.forward(req, res);
			}
		}
	}

}
