package com.search.controller;

import java.io.IOException;
import java.util.List;
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
		//檢查是否輸入查詢條件全部空白
		if((location.equals(nonLocation))&&(prod_type_str.equals(nonProdType)&&keySearch.isEmpty())){ //地區和交通工具和關鍵字都沒有選擇
			request.setAttribute("ErrMsg", "請輸入"+nonLocation+"或"+nonProdType+"搜尋");
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
			return;
		}
		//檢查是否有違法字元，以避免injection攻擊
		CharSequence illegal1 = "'" , illegal2 = "\"" , illegal3 = ";" ,illegal4 = "=" ;
		if (keySearch.contains(illegal1) || keySearch.contains(illegal2)|| keySearch.contains(illegal3) || keySearch.contains(illegal4)) {
			request.setAttribute("ErrMsg", "不可含有以下字元:   ' \" ; =");
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
			return;
		}
				
		try{
			//避免發生中文字轉數字發生轉換錯誤
			Integer prod_type=null;
			if(!(prod_type_str.equals(nonProdType))){ //交通工具非空的
			    prod_type = Integer.parseInt(prod_type_str);
			}
			
			SearchService searchSvc = new SearchService();
			List<SearchComVO> comList= searchSvc.getCompanysByCondition(location, prod_type,keySearch);
			for (SearchComVO acomVO : comList) {
				System.out.print(acomVO.getCom_id() + ",");
				System.out.print(acomVO.getCom_name() + ",");
				System.out.print(acomVO.getCom_address());
				System.out.println();
			}
			request.setAttribute("comList", comList);
			RequestDispatcher rd = request.getRequestDispatcher("/_03_research/research.jsp");
			rd.forward(request, response);

		} catch(NumberFormatException e){
			throw new ServletException(e); 
		}
		
     }//protected void doPost	
}//public class SearchServlet 
