package com.products.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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

import com.company.model.CompanyService;
import com.company.model.CompanyVO;
import com.products.model.AccService;
import com.products.model.AccessoryVO;
import com.products.model.ProductVO;
import com.products.model.ProductsService;

public class AccInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		Map<String, String> errorMsgs = new HashMap<String, String>();
		Map<String, String> successMsgs = new HashMap<String, String>();

		HttpSession session = request.getSession(false);
		request.setAttribute("MsgOK", successMsgs); // 顯示成功訊息
		request.setAttribute("errorMsgs", errorMsgs);

		AccService accService = new AccService();
		AccessoryVO accVO = new AccessoryVO();
		int _comId = 1;
		String accName = "1";
		double accPrice = 0;
		byte[] bs = new byte[4];
		bs[1] = 1;
		byte[] accPic = bs;

		String accDetail = "2";
		System.out.println("begin insert: in other controller");
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				// 檔案名稱
				List<FileItem> multiparts = new ServletFileUpload(
						new DiskFileItemFactory()).parseRequest(request);
				// 逐筆讀取form表單內容
				for (FileItem item : multiparts) {
					if (item.isFormField()) {
						// 將接到的內容字串轉成UTF-8編碼字串
						String fieldvalue = item.getString("UTF-8");
						// fieldvalue = new String(
						// fieldvalue.getBytes("iso-8859-1"), "UTF-8");
						// 表單資料驗證
						// getFieldName()取得form中input欄位name
						if ("accName".equals(item.getFieldName())) {
							accName = fieldvalue;
							System.out.println(accName + ": NAME");
						} else if ("accPrice".equals(item.getFieldName())) {
							accPrice = new Double(fieldvalue.trim());
							System.out.println(accPrice + "price");
						} else if ("accDetail".equals(item.getFieldName())) {
							accDetail = fieldvalue;
							System.out.println(accDetail + " detail");
							if (accDetail == null
									|| accDetail.trim().length() == 0)
								errorMsgs.put("errorProdArticle", "說明請勿空白");
						}
					} else {
						if ("accPic".equals(item.getFieldName())) {
							try {
								BufferedInputStream in = new BufferedInputStream(
										item.getInputStream()); // 讀入圖片串流資料
								accPic = new byte[in.available()];
								System.out.println(accPic + "++");
								byte[] data = item.get();
								System.out.println(accPic);
								System.out.println(accPic.length + " pic");
								// available()取得字節長度
								// **有空回來處理網路斷訊產生的問題
								in.read(accPic);
								in.close();
							} catch (Exception e) {
								e.getStackTrace();
							}
						}

					} // end outer else
				} // end for loop
					// 存入商家編號
				CompanyVO loginComToken = (CompanyVO) session
						.getAttribute("LoginComOK");
				_comId = loginComToken.getComID();

				// ---------------寫入database----------------------
				if (errorMsgs.isEmpty()) {
					accVO = accService.addAcc(_comId, accName, accPrice,
							accPic, accDetail);
					// 資料新增後轉回原畫面
					String url = "/_06_manage/AccInsert.jsp";
					RequestDispatcher successView = request
							.getRequestDispatcher(url);
					successMsgs.put("InsertOK",
							"<Font color='red'>新增成功</Font><hr>");

					successView.forward(request, response);
					System.out.println("success");
					/******************** (Send the Success view) ************/
				} else {
					// 有errorMsg轉回原頁面
					String url = "/_06_manage/AccInsert.jsp";
					RequestDispatcher successView = request
							.getRequestDispatcher(url);
					successView.forward(request, response);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	} // end doPost()
}