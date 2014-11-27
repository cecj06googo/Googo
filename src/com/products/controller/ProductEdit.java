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
import com.products.model.ProductVO;
import com.products.model.ProductsService;

public class ProductEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		Map<String, String> errorMsgs = new HashMap<String, String>();
		Map<String, String> successMsgs = new HashMap<String, String>();

		HttpSession session = request.getSession(false);
		session.setAttribute("successMsgs", successMsgs); //顯示正常訊息
		request.setAttribute("errorMsgs", errorMsgs);

		ProductsService productsService = new ProductsService();
		ProductVO ProductVO = new ProductVO();
		int prodId = 1;
		int _comId = 1;
		String prodName = "1";
		int prodType = 0;
		double prodPrice = 0;
		double prodDisc = 0;// 5
		byte[] bs = new byte[4];
		bs[1] = 1;
		byte[] prodPic = bs;

		String prodArticle = "2";// 7
		byte[] prodSubPic1 = null;
		byte[] prodSubPic2 = null;
		byte[] prodSubPic3 = null;// 10

		int prodKind = 0;
		double prodCc = 0;
		int prodCarrier = 0;
		int prodControl = 0;// 14

		String prodPlate = "ABC-11";
		int prodStatus = 1;
		
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				// 檔案名稱
				List<FileItem> multiparts = new ServletFileUpload(
						new DiskFileItemFactory()).parseRequest(request);
				// 逐筆讀取form表單內容
				for (FileItem item : multiparts) {
					if (item.isFormField()) {
						System.out.println("begin EDIT: in other controller");
						// 將接到的內容字串轉成UTF-8編碼字串
						String fieldvalue = item.getString("UTF-8");
						// fieldvalue = new String(
						// fieldvalue.getBytes("iso-8859-1"), "UTF-8");
						
						// 表單資料驗證
						// getFieldName()取得form中input欄位name
						if ("prodId".equals(item.getFieldName())){
							prodId = new Integer(fieldvalue.trim());
							System.out.println(prodId+": prodId");
						}else if("prodName".equals(item.getFieldName())) {
							prodName = fieldvalue;
							System.out.println(prodName+": NAME");
							// if (prodName == null ||
							// prodName.trim().length() == 0)
							// errorMsgs.put("errorNameEmpty", "商品名稱請勿空白");
						} else if ("prodPlate".equals(item.getFieldName())) {
							prodPlate = fieldvalue;
							System.out.println(prodPlate+"PLATE");
							// if (prodName == null ||
							// prodName.trim().length() == 0)
							// errorMsgs.put("errorNameEmpty", "商品名稱請勿空白");
//						} else if ("prodType".equals(item.getFieldName())) {
//							prodType = new Integer(fieldvalue.trim());
//							System.out.println("type" + prodType);
						} // 4
						else if ("prodPrice".equals(item.getFieldName())) {
							prodPrice = new Double(fieldvalue.trim());
							System.out.println(prodPrice+"price");
						} else if ("prodDisc".equals(item.getFieldName())) {
							prodDisc = new Double(fieldvalue.trim());
							System.out.println(prodDisc+"DISC");
						} else if ("prodArticle"
								.equals(item.getFieldName())) {
							prodArticle = fieldvalue;
							System.out.println(prodArticle);
							if (prodArticle == null
									|| prodArticle.trim().length() == 0)
								errorMsgs.put("errorProdArticle",
										"商品說明請勿空白");
//						} else if ("prodKind".equals(item.getFieldName())) {
//							prodKind = new Integer(fieldvalue.trim());
//							System.out.println("prodKind" + prodKind);
//						} else if ("prodCc".equals(item.getFieldName())) {
//							if (prodType == 1 || prodType == 2) {
//								prodCc = new Double(fieldvalue.trim());
//								System.out.println("CC" + prodCc);
//							} else {
//								prodCc = 0;
//								System.out.println("CC" + prodCc);
//							}
//						} else if ("prodCarrier"
//								.equals(item.getFieldName())) {
//							prodCarrier = new Integer(fieldvalue.trim());
//							System.out.println("CARRIER" + prodCarrier);
//						} else if ("prodControl"
//								.equals(item.getFieldName())) {
//							prodControl = new Integer(fieldvalue.trim());
						}
					} // end outer else
				} // end for loop
					// 存入商家編號
				CompanyVO loginComToken = (CompanyVO) session
						.getAttribute("LoginComOK");
				_comId = loginComToken.getComID();

				// ---------------寫入database----------------------
				if (errorMsgs.isEmpty()) {
					ProductVO = productsService
							.editProd(prodId, _comId, prodName,prodType, prodPrice, prodDisc, prodPic,
									prodArticle, prodSubPic1, prodSubPic2,
									prodSubPic3, prodKind, prodCc,
									prodCarrier, prodControl, prodPlate,
									prodStatus);

//					System.out.println(ProductVO.getProdId());
//					System.out.println(ProductVO.getComId());
//					System.out.println(ProductVO.getProdName());
//					System.out.println(ProductVO.getProdType());

					

					// 資料新增後轉回原畫面
					String url = "/prod.show";
					RequestDispatcher successView = request
							.getRequestDispatcher(url);
					successView.forward(request, response);
					/******************** (Send the Success view) ************/
				} else {
					// 有errorMsg轉回原頁面
					String url = "/_06_manage/productInsert.jsp";
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