package com.products.controller;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Iterator;
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

import com.products.model.ProductsService;
import com.products.model.ProductVO;

public class ProductServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		// 顯示的訊息
		Map<String, String> succesMsgs = new HashMap<String, String>();
		Map<String, String> errorMsgs = new HashMap<String, String>();
		request.setAttribute("ErrorMsg", errorMsgs); // 顯示錯誤訊息
		request.setAttribute("MsgOK", succesMsgs); // 顯示錯誤訊息
//		String abc = "abc";
//		request.setAttribute("abc", abc); // 顯示錯誤訊息
		System.out.println("Ready? servlet begins~");
		ProductsService productsService = new ProductsService();

		// List<ProductsVO> list = ProdSvc.getAll();
		// request.setAttribute("list",list);
		//
		byte[] bs = new byte[4];
		bs[1] = 1;

		ProductVO ProductsVO = new ProductVO();
		@SuppressWarnings("unused")
		int memId = 1;
		int prodId = 1;
		String plateId = "POP-123";
		int _comId = 1;
		String prodName = "1";
		int prodType = 0;
		double prodPrice = 0;
		double prodDisc = 0;// 5
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
		String action = request.getParameter("action");
		//System.out.println(action);
		
		if ("prodDelete".equals(action)) {
			//System.out.println(action);
			prodId=Integer.parseInt(request.getParameter("prodId"));
			System.out.println("in delete prodId="+prodId+" =_=");
			productsService.delProd(prodId);
			
			String url2 = "/prod.show";
			String url = "/_06_manage/product.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url2);
			System.out.println("End servlet delete O_Q");
			successView.forward(request, response);
		} // end delete
		
		else {
			System.out.println("in insert");
			// ------------------表單驗證+資料接收----------------------
			if (ServletFileUpload.isMultipartContent(request)) {
				try {
					// 檔案名稱
					List<FileItem> multiparts = new ServletFileUpload(
							new DiskFileItemFactory()).parseRequest(request);
					System.out.println("where am i?");
					// 逐筆讀取form表單內容
					for (FileItem item : multiparts) {
						if (item.isFormField()) {
							// 將接到的內容字串轉成UTF-8編碼字串
							String fieldvalue = item.getString("UTF-8");
							// fieldvalue = new String(
							// fieldvalue.getBytes("iso-8859-1"), "UTF-8");

							// 表單資料驗證
							// getFieldName()取得form中input欄位name
							if ("comId".equals(item.getFieldName())) {
								_comId = new Integer(fieldvalue.trim());
							} else if ("prodName".equals(item.getFieldName())) {
								prodName = fieldvalue;
								// if (prodName == null ||
								// prodName.trim().length() == 0)
								// errorMsgs.put("errorNameEmpty", "商品名稱請勿空白");
							} else if ("prodPlate".equals(item.getFieldName())) {
								prodPlate = fieldvalue;
								System.out.println(prodPlate);
								// if (prodName == null ||
								// prodName.trim().length() == 0)
								// errorMsgs.put("errorNameEmpty", "商品名稱請勿空白");
							} else if ("prodType".equals(item.getFieldName())) {
								prodType = new Integer(fieldvalue.trim());
							} // 4
							else if ("prodPrice".equals(item.getFieldName())) {
								prodPrice = new Double(fieldvalue.trim());
							} else if ("prodDisc".equals(item.getFieldName())) {
								prodDisc = new Double(fieldvalue.trim());
							} else if ("prodArticle"
									.equals(item.getFieldName())) {
								prodArticle = fieldvalue;
								if (prodArticle == null
										|| prodArticle.trim().length() == 0)
									errorMsgs.put("errorProdArticle",
											"商品說明請勿空白");
							} else if ("prodKind".equals(item.getFieldName())) {
								prodKind = new Integer(fieldvalue.trim());
							} else if ("prodCc".equals(item.getFieldName())) {
								prodCc = new Double(fieldvalue.trim());
							} else if ("prodCarrier"
									.equals(item.getFieldName())) {
								prodCarrier = new Integer(fieldvalue.trim());
							} else if ("prodControl"
									.equals(item.getFieldName())) {
								prodControl = new Integer(fieldvalue.trim());
							}
							// }
							// else {
							// // **需在前端設計圖片格式驗證
							// String picName = item.getName(); // 取得文件名稱
							// System.out.println(picName);
							// if (picName == null || picName.trim().length() ==
							// 0)
							// {
							// continue;
							// }
							// else {
							// try {
							// BufferedInputStream in = new BufferedInputStream(
							// item.getInputStream()); // 讀入圖片串流資料
							// comPic = new byte[in.available()]; //
							// available()取得字節長度
							// // **有空回來處理網路斷訊產生的問題
							// in.read(comPic);
							// in.close();
							// } catch (Exception e) {
							// e.getStackTrace();
							// }
							// }
						} // end outer else
					} // end for loop
						// 存入商家編號
						// comId = (int) session.getAttribute("comId");

					// ---------------寫入database----------------------
					if (errorMsgs.isEmpty()) {
						ProductsVO = productsService
								.addProd(prodId, _comId, prodName, plateId,
										prodType, prodPrice, prodDisc, prodPic,
										prodArticle, prodSubPic1, prodSubPic2,
										prodSubPic3, prodKind, prodCc,
										prodCarrier, prodControl, prodPlate,
										prodStatus);

						System.out.println(ProductsVO.getProdId());
						System.out.println(ProductsVO.getComId());
						System.out.println(ProductsVO.getProdName());
						System.out.println(ProductsVO.getProdType());

						request.setAttribute("ProductsVO", ProductsVO);
						succesMsgs.put("InsertOK",
								"<Font color='red'>商品新增成功</Font><hr>");

						// 資料新增後轉回原畫面
						String url = "/_06_manage/productInsert.jsp";
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

		}

		
	}// end post

}
