package com.company.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.Flushable;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.company.model.CompanyService;
import com.company.model.CompanyVO;


@MultipartConfig
public class UpdateCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");

		Map<String, String> errorMsgs = new HashMap<String, String>();
		Map<String, String> successMsgs = new HashMap<String, String>();

		// HttpSession session = req.getSession();
		// session.setAttribute("successMsgs", successMsgs); //顯示正常訊息
		req.setAttribute("successMsgs", successMsgs);
		req.setAttribute("errorMsgs", errorMsgs);

		byte[] comPic = null;
		Integer comID = null;
		String comAccount = null, comPwd = null, comName = null, comOwner = null, 
			   comAddr = null, comTel = null, comFax = null, comVAT = null;

		if (ServletFileUpload.isMultipartContent(req)) {
			try {
				// 檔案名稱
				List<FileItem> multiparts = new ServletFileUpload(
						new DiskFileItemFactory()).parseRequest(req);
				
				// 逐筆讀取form表單內容
				for (FileItem item : multiparts) {
					if (item.isFormField()) {
						// 將接到的內容字串轉成UTF-8編碼字串
						String fieldvalue = item.getString("UTF-8");
//						fieldvalue = new String(
//						        fieldvalue.getBytes("iso-8859-1"), "UTF-8");
						
						//表單資料驗證
						// getFieldName()取得form中input欄位name
						if ("comID".equals(item.getFieldName())) {
							comID = new Integer(fieldvalue.trim());
						} 
						else if ("comAccount".equals(item.getFieldName())) {
							comAccount = fieldvalue;
						} 
						else if ("comPwd".equals(item.getFieldName())) {
							comPwd = fieldvalue.trim();
							if (comPwd == null || comPwd.trim().length() == 0)
								errorMsgs.put("errorPwdEmpty", "密碼欄請勿空白");
							
							String comPwdReg = "^[\\w]{6,12}$";
							if (!comPwd.trim().matches(comPwdReg))
								errorMsgs.put("errorPwdFormat",	"密碼格式有誤(英數各一,長度限6~12字數");
						} 
						else if ("comName".equals(item.getFieldName())) {
							comName = fieldvalue;
							if (comName == null || comName.trim().length() == 0)
								errorMsgs.put("errorNameEmpty", "公司名稱請勿空白");
							
							String comNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,32}$";
							if (!comName.trim().matches(comNameReg))
								errorMsgs.put("errorNameFormat", "公司名稱:只能是中、英文字母、數字和_ , 且長度必需在1到32之間");
						} 
						else if ("comOwner".equals(item.getFieldName())) {
							comOwner = fieldvalue;
							if (comOwner == null || comOwner.trim().length() == 0)
								errorMsgs.put("errorOwnerEmpty", "公司代表人姓名請勿空白");
							
							String comOwnerReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,32}$";
							if (!comOwner.trim().matches(comOwnerReg))
								errorMsgs.put("errorOwnerFormat", "公司名:只能是中、英文字母、數字和_ , 且長度必需在1到32之間");
						}
						else if ("comAddr".equals(item.getFieldName())) {
							comAddr = fieldvalue;
							if (comAddr == null || comAddr.trim().length() == 0)
								errorMsgs.put("errorAddrEmpty", "公司地址請勿空白");
								
							String comAddrReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{1,32}$";
							if (!comAddr.trim().matches(comAddrReg))
								errorMsgs.put("errorAddrFormat", "公司名:只能是中、英文字母、數字和_ , 且長度必需在1到32之間");
						} 
						else if ("comTel".equals(item.getFieldName())) {
							comTel = fieldvalue;
							if (comTel == null || comTel.trim().length() == 0)
								errorMsgs.put("errorTelEmpty", "公司電話請勿空白");
							
							String comTelReg = "^[(0-9)-]{8,15}$";
							if (!comTel.trim().matches(comTelReg))
								errorMsgs.put("errorTelFormat", "公司電話:只能是數字和-，且至少8碼");
						} 
						else if ("comFax".equals(item.getFieldName())) {
							comFax = fieldvalue;
							String comFaxReg = "^[(0-9)-]{8,15}$";
							if ((comFax.trim().length() != 0) && !comFax.trim().matches(comFaxReg))
								errorMsgs.put("errorFaxFormat", "公司傳真:只能是數字和-，且至少8碼");
						} 
						else if ("comVAT".equals(item.getFieldName())) {
							comVAT = fieldvalue;
						}
					} 
					else {
						// **需在前端設計圖片格式驗證
						String picName = item.getName();    // 取得文件名稱
						System.out.println(picName);
						if (picName == null || picName.trim().length() == 0) {
							continue;	
						}
						else {
							try {
								BufferedInputStream in = new BufferedInputStream(
										item.getInputStream());      // 讀入圖片串流資料
								comPic = new byte[in.available()];   // available()取得字節長度
								// **有空回來處理網路斷訊產生的問題
								in.read(comPic);
								in.close();
							} catch (Exception e) {
								e.getStackTrace();
							}
						}
					} // end outer else
				} // end for loop

				// 準備傳回jsp網頁顯示內容的VO
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
				companyVO.setComPic(comPic);    // 替換圖片
				
				// 1.接收請求參數 - 重複註冊的錯誤處理
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("companyVO", companyVO);
					RequestDispatcher failureView = req
							.getRequestDispatcher("/Temp/_06_manage/edit_company.jsp");
					failureView.forward(req, res);
					return;
				}

				// 2.開始新增資料
				CompanyService comService = new CompanyService();
				if (comPic == null) {
					comPic =  comService.getOneCom(comID).getComPic();    // 取出原商家圖片
				}
				companyVO = comService.updateCompany(comID, comAccount, comPwd,
						comName, comOwner, comAddr, comTel, comFax, comVAT,
						comPic);
				
				// 3.新增完成,準備轉交(Send the Success view)				
				req.setAttribute("companyVO", companyVO);
				successMsgs.put("seccessUpdate", "修改完成");
				String url = "/Temp/_06_manage/edit_company.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				// res.sendRedirect(url);

			// 其他可能的錯誤處理				
			} catch (Exception e) {
				errorMsgs.put("errorException", e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/Temp/_06_manage/edit_company.jsp");
				failureView.forward(req, res);
			}
		} // end if
	} // end doPost() 
}