//package com.orders.controller;
//import java.sql.Timestamp;
//import java.text.SimpleDateFormat;
//import java.util.Date;
//import java.io.IOException;
//import java.sql.Timestamp;
//import java.text.SimpleDateFormat;
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//public class fakeData extends HttpServlet{
//	private static final long serialVersionUID = 1L;
//	public void doGet(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		doPost(request, response);
//	}
//
//	protected void doPost(HttpServletRequest request,
//			HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
//		
//		String action = request.getParameter("action");
//		
//		HttpSession session = request.getSession();
//		
//		if ("insert".equals(action)) {
//		
//		String com_id = request.getParameter("com_id");
//		String mem_id = request.getParameter("mem_id");
//		
//		session.setAttribute("com_id", com_id);  //session存值
//		session.setAttribute("mem_id", mem_id);  //session存值
//		
//		/******************** (Send the Success view) ************/
//		String url = "/_04_member/productsDetails.jsp";
//		RequestDispatcher successView = request
//				.getRequestDispatcher(url);									
//		successView.forward(request, response);
//		}// end insert
//		
//		if ("select".equals(action)) {
//			String user_id = request.getParameter("user_id");
//			//登入時要去資料庫檢查看帳號是屬於com_id(商家)還是mem_id(會員)
//			session.setAttribute("user_id", user_id);  //session存值
//			
//			/******************** (Send the Success view) ************/
//			String url = "/ordersSearch.jsp";
//			RequestDispatcher successView = request
//					.getRequestDispatcher(url);									
//			successView.forward(request, response);
//		}// end select
//		
//		
//		if ("fakeLogin_mem".equals(action)) {
//			String user_id = request.getParameter("user_id");
//			//登入時要去資料庫檢查看帳號是屬於com_id(商家)還是mem_id(會員)
//			session.setAttribute("user_id", user_id);  //session存值
//			session.setAttribute("Identity", "Mem");  //session存值(代表登入的是會員)
//			request.removeAttribute("action");
//			/******************** (Send the Success view) ************/
//			String url = "/onloadMem.gg";
//			
//			RequestDispatcher successView = request
//					.getRequestDispatcher(url);									
//			successView.forward(request, response);
//		}// end login
//		
//		
//		
//		if ("fake_ord".equals(action)) {
//			
//			
//			String com_id = request.getParameter("com_id");
//			String mem_id = request.getParameter("mem_id");
//			String item_total =request.getParameter("item_total");
//			String prod_id = request.getParameter("prod_id");
//			String acc_id = request.getParameter("acc_id");
//			
//			
//			session.setAttribute("com_id", com_id);
//			session.setAttribute("mem_id", mem_id);
//			session.setAttribute("item_total", item_total);
//			session.setAttribute("prod_id", prod_id);
//			session.setAttribute("acc_id", acc_id);
//			
//			String url = "/_07_order/test.jsp";
//			
//			RequestDispatcher successView = request
//					.getRequestDispatcher(url);									
//			successView.forward(request, response);
//			
//			
//			
//		
//		}//end fake_ord
//		
//		if ("TimestampTest".equals(action)) {
//			Object _com_id = "";
//			Object _mem_id = "";
//			String _ord_getday = "";
//			String _ord_reday = "";
//			String _item_total = "";
//			String _prod_id = "";
//			String _acc_id = "";
//			// 真接收參數
//			String item_name = "";
//			String item_phone = null;
//			String item_tel = null;
//			String item_email = "";
//			String pritem_acc = null;
//			String item_all = null;
//			Integer com_id = null;
//			Integer mem_id = null;
//			Timestamp ord_time = null;
//			Timestamp ord_getday = null;
//			Timestamp ord_reday = null;
//			Integer item_total = null;
//			Integer prod_id = null;
//			Integer acc_id = null;
//			
//	//			ord_getday = Timestamp.valueOf(request.getParameter("ord_getday"));
////			ord_reday = Timestamp.valueOf(request.getParameter("ord_reday"));
////		
////			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
////			java.util.Date dt = df.parse(request.getParameter("ord_getday"));
//
////			String text = "2011-10-02 18:48:05.123";
//			
//			ord_getday = Timestamp.valueOf(request.getParameter("ord_getday"));
//			ord_reday = Timestamp.valueOf(request.getParameter("ord_reday"));
////		
//		System.out.println("分格線----------------------------------------");	
//		System.out.println("_com_id: "+session.getAttribute("com_id"));
//		System.out.println("_mem_id: "+session.getAttribute("mem_id"));
//		System.out.println("_item_total: "+session.getAttribute("item_total"));
//		System.out.println("_prod_id: "+session.getAttribute("prod_id"));
//		System.out.println("_acc_id: "+session.getAttribute("acc_id"));
//		System.out.println("ord_getday:------ "+ ord_getday);
//		System.out.println("ord_reday:------ "+ ord_reday);
//		System.out.println("_ord_getday: "+request.getParameter("ord_getday"));
//		System.out.println("_ord_reday: "+request.getParameter("ord_reday"));
//		System.out.println("_item_name: "+request.getParameter("item_name"));
//		System.out.println("_item_total: "+request.getParameter("item_phone"));
//		System.out.println("_prod_id: "+request.getParameter("item_tel"));
//		System.out.println("_acc_id: "+request.getParameter("item_email"));
//	
//		
//		
//		
//		}
//		
//		
//	}//end doPost
//
//		
//		public void test(){
//		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		
//		Timestamp today = Timestamp.valueOf(df.format(new Date()));
//		
//		System.out.println(df.format(new Date().getTime()));
//		System.out.println(df.format(today));
//		
//		System.out.println(today);
//		
//		
//		
//		
//		String _mem_account = "ggyy40706@abc.com.tw";
//		
//		StringBuilder mem_account = new StringBuilder().append(_mem_account);
//		
//		int index= mem_account.indexOf("@");
//		StringBuilder ago = new StringBuilder().append(mem_account.substring(0,index));
//		int length = ago.length()-2;
//		
//		StringBuilder ago_first = new StringBuilder().append(mem_account.substring(0,1));
//		StringBuilder ago_last = new StringBuilder().append(mem_account.substring(index-1));
//
//		
//		
//		
//		
//
//		StringBuilder newAccount = new StringBuilder();
//		newAccount.append(ago_first);
//		for(int i = 0; i < length; i++){
//			newAccount.append("*");
//		}
//		newAccount.append(ago_last);
//		System.out.println(newAccount);
//		System.out.println(ago.length());
//
//		
//		String aa="012345".substring(4);
//		System.out.println(aa);
//		}
//	}
//
