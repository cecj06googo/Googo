package com.search.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
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
		   System.out.println("進入doGet");
		   String location = new String((request.getParameter("location")).getBytes("ISO-8859-1"),"UTF-8");
		   String prod_type_str = new String((request.getParameter("prod_type")).getBytes("ISO-8859-1"),"UTF-8");
		   String keySearch = new String((request.getParameter("keySearch")).getBytes("ISO-8859-1"),"UTF-8");
   
		   doPostdoGetShare(request,response,location,prod_type_str,keySearch);
		}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("進入doPost");
	    String location = request.getParameter("location");
	    String prod_type_str = request.getParameter("prod_type");
		String keySearch = request.getParameter("keySearch");
		
		doPostdoGetShare(request,response,location,prod_type_str,keySearch);
     }//protected void doPost	
	protected void doPostdoGetShare(HttpServletRequest request, HttpServletResponse response,String location,String prod_type_str,String keySearch) throws ServletException, IOException{
		  		
			//----------可能需要改變的參數-------------------
			String nonLocation= "地區";
			String nonProdType= "交通工具";
			//----------------------------------------------
			HttpSession session = request.getSession(true);
			/*------------Debug用------------*/
			System.out.println("有進來SearchServlet");
			System.out.println("share_location="+location);
			System.out.println("share_prod_type="+prod_type_str);
			System.out.println("share_keySearch="+keySearch);
			
			//將預設或空白都轉換為null
			if(location.equals(nonLocation)||location.isEmpty()){
				location=null;
			}
			if(prod_type_str.equals(nonProdType)||prod_type_str.isEmpty()){
				prod_type_str=null;
			}
			if(keySearch.isEmpty()){
				keySearch = null;
			}
			
			//檢查是否輸入查詢條件全部空白
			if((location==null)&&(prod_type_str==null)&&(keySearch==null)){ //地區和交通工具和關鍵字都沒有選擇
				request.setAttribute("ErrMsg", "請輸入"+nonLocation+"或"+nonProdType+"或關鍵字搜尋");
				RequestDispatcher rd = request.getRequestDispatcher("/index.jsp"); //這裡要改成記錄上一個頁面!!!!!!!!!
				rd.forward(request, response);
				return;
			}
			//檢查是否有違法字元，以避免injection攻擊
			CharSequence illegal1 = "'" , illegal2 = "\"" , illegal3 = ";" ,illegal4 = "=", illegal5 = "," ;
			try{
				if(keySearch != null){ //關鍵字搜尋不等於空的
					if (keySearch.contains(illegal1) || keySearch.contains(illegal2)|| keySearch.contains(illegal3) || keySearch.contains(illegal4)|| keySearch.contains(illegal5)) {
						request.setAttribute("ErrMsg", "不可含有以下字元:   ' \" ; = ,");
						RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");//這裡要改成記錄上一個頁面!!!!!!!!!
						rd.forward(request, response);
						return;
					}
				}
			}catch(Exception e){
				System.out.println("錯誤:關鍵字檢查違法字元發生錯誤");
			}
					
			try{
				//避免發生中文字轉數字發生轉換錯誤
				Integer prod_type=null;
				if(prod_type_str != null && !prod_type_str.isEmpty()){//不等於Null且長度不為0
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
				request.setAttribute("comList", comList);//為了給research.jsp計算總商店筆數
				request.setAttribute("location", location);//給換分頁時傳回使用
				request.setAttribute("prod_type", prod_type);//給換分頁時傳回使用
				request.setAttribute("keySearch", keySearch);//給換分頁時傳回使用
			
				RequestDispatcher rd = request.getRequestDispatcher("/_03_research/research.jsp");
				System.out.println("SearchServlete執行完畢轉跳research.jsp");
				rd.forward(request, response);

			} catch(NumberFormatException e){
				System.out.println("錯誤:prod_type從String轉Integer轉換錯誤");
				throw new ServletException(e); 
			} 
	 }
}//public class SearchServlet 

