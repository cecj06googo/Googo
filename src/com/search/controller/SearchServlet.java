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
		
		String location = request.getParameter("location");
		String prod_type_str = request.getParameter("prod_type");
//		System.out.println("location1="+location);
		
		try{
		// 進行資料型態的轉換
			int prod_type = Integer.parseInt(prod_type_str.trim());
			SearchService searchSvc = new SearchService();
			Set<SearchComVO> comSet= searchSvc.getCompanysByCondition(location, prod_type);
			for (SearchComVO acomVO : comSet) {
				System.out.print(acomVO.getCom_id() + ",");
				System.out.print(acomVO.getCom_name() + ",");
				System.out.print(acomVO.getCom_address());
				System.out.println();
			}
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
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
