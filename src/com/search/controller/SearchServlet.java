package com.search.controller;

import java.io.IOException;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.search.model.*;

public class SearchServlet extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       doPost(request, response);
		}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		//----------可能需要改變的參數-------------------
		String nonLocation= "地區";
		String nonProdType= "交通工具";
		//----------------------------------------------
        //思考若空白要返回何頁面是否是原來頁面?
		
		String location = request.getParameter("location");
		String prod_type_str = request.getParameter("prod_type");
		String keySearch = request.getParameter("keySearch");
		System.out.println("location="+location);
		System.out.println("prod_type="+prod_type_str);
		System.out.println("keySearch="+keySearch);
		System.out.println("有進來SearchServlet");
		
		if((location.equals(nonLocation))&&(prod_type_str.equals(nonProdType)&&keySearch.isEmpty())){ //地區和交通工具和關鍵字都沒有選擇
			request.setAttribute("ErrMsg", "請輸入"+nonLocation+"或"+nonProdType+"搜尋");
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
			return;
		}
		
		
		try{
		// 進行資料型態的轉換
			Integer prod_type=null;
			if(!(prod_type_str.equals(nonProdType))){ //交通工具非空的
			    prod_type = Integer.parseInt(prod_type_str);
			}
			
			SearchService searchSvc = new SearchService();
			Set<SearchComVO> comSet= searchSvc.getCompanysByCondition(location, prod_type,keySearch);
			for (SearchComVO acomVO : comSet) {
				System.out.print(acomVO.getCom_id() + ",");
				System.out.print(acomVO.getCom_name() + ",");
				System.out.print(acomVO.getCom_address());
				System.out.println();
			}
			RequestDispatcher rd = request.getRequestDispatcher("/_03_research/research.jsp");
			rd.forward(request, response);

		} catch(NumberFormatException e){
			throw new ServletException(e); 
		}
		
		
		
		
		
//		try{
//			// 進行資料型態的轉換
//			qty = Integer.parseInt(qtyStr.trim());
//			bookID = Integer.parseInt(idStr.trim());
//			price = Double.parseDouble(priceStr.trim());
//			discount = Double.parseDouble(discountStr.trim());
//		} catch(NumberFormatException e){
//			throw new ServletException(e); 
//		}
//		RequestDispatcher rd = request.getRequestDispatcher("/_03_listBooks/DisplayPageProducts?pageNo=" + pageNo);
//		rd.forward(request, response);
		
	}
	
	
//	public static void main(String args[]){
//		String location ="";
//		int prod_type =1;
//		SearchService searchSvc = new SearchService();
//		Set<SearchComVO> comSet= searchSvc.getCompanysByCondition(location, prod_type);
//		for (SearchComVO acomVO : comSet) {
//			System.out.print(acomVO.getCom_id() + ",");
//			System.out.print(acomVO.getCom_name() + ",");
//			System.out.print(acomVO.getCom_address());
//			System.out.println();
//		}
//	
//	}//main
}
