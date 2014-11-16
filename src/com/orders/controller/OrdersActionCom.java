package com.orders.controller;

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

import com.company.model.CompanyVO;
import com.member.model.MemVO;
import com.orders.model.OrdersService;
import com.orders.model.OrdersVO;
/*********************商家訂單動作**********************/
public class OrdersActionCom extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Map<String, String> errorMsg = new HashMap<String, String>();
		Map<String, String> msgOK = new HashMap<String, String>();
		request.setAttribute("ErrMsg", errorMsg); // 顯示錯誤訊息
		request.setAttribute("MsgOK", msgOK); // 顯示成功訊息
		String action = request.getParameter("action");
		//---訂單狀態對照表
		// 1 ('未處理');
		// 2 ('已接受');
		// 3 ('已出車');
		// 4 ('結單');
		// 5 ('會員取消');
		// 6 ('商家取消');
		// 7 ('會員逾時');
		// 8 ('商家逾時');
		// 9 ('異常未還');
		/*********************找時間刪掉**********************/
		if ("fakeLogin_mem".equals(action)) {
			try {
				Integer user_id = null;
				String Identity = "Mem";

				try {
					user_id = Integer.parseInt(session.getAttribute("user_id")
							.toString().trim());
				} catch (Exception e) {
					errorMsg.put("errorlogin", "真的不要這樣..");
				}

			/*******************(存取資料+轉向) *********************/
			if (errorMsg.isEmpty()) {
			Integer sel_stus = 1;
			String sel_time = "all";
			OrdersService odrSvc = new OrdersService();
			List<OrdersVO> ordVO = odrSvc.ordSearch_mem(user_id,
					sel_stus, sel_time);

		
			request.setAttribute("ordVO", ordVO);
			session.setAttribute("sel_stus", sel_stus);
			session.setAttribute("sel_time", sel_time);
			session.setAttribute("Identity", Identity);
			String url = "/_04_member/orderMem.jsp";
			RequestDispatcher successView = request
					.getRequestDispatcher(url);

				successView.forward(request, response);
			} else {
				String url = "/index.jsp";
				RequestDispatcher successView = request
						.getRequestDispatcher(url);

				successView.forward(request, response);
			}

			} catch (Exception e) {
				e.printStackTrace();
			}
		}// end fakeLogin_mem if
		/*******************************************/
		
		if ("selectCom".equals(action)) {
			try {
					// ------------------資料接收----------------------
					// String暫時接收屬性
					String _orderStatus = "";
					// 真接收屬性
					CompanyVO comVO = new CompanyVO();
					Integer userId = null;
					Integer orderStatus = null;
					String orderTime = "";
					try {
					comVO = (CompanyVO)session.getAttribute("LoginComOK");
					userId = comVO.getComID();
					_orderStatus = request.getParameter("orderStatus");
					orderTime = request.getParameter("orderTime");
					}catch(Exception e){
						System.out.println("selectCom 資料接收出錯");
						e.printStackTrace();
					}
					// ------------------資料驗證+轉型----------------------
					// 其實也可以直接轉(值都是用選擇器選的)，只怕有其他未知安全漏洞
					try {
						orderStatus = Integer
								.parseInt(_orderStatus.toString().trim());
					} catch (NumberFormatException e) {
						errorMsg.put("ErrOrderStatus", "請選擇訂單狀態");
					} catch (Exception e) {
						errorMsg.put("ErrOrderStatus", "請選擇訂單狀態");
					}

					if (orderTime.trim().length() < 2
							|| orderTime.trim().length() > 3) {
						errorMsg.put("ErrOrderTime", "請選擇訂單時間");
					}

					/*******************(存取資料) *********************/
					if (errorMsg.isEmpty()) {
						OrdersService odrSvc = new OrdersService();
						List<OrdersVO> ordVO = odrSvc.ordSearch_com(userId,
								orderStatus, orderTime);
						request.setAttribute("ordVO", ordVO);
						if (ordVO.isEmpty()) {
							msgOK.put("SearchNull", "沒有資料");
						}
					}

					/*******************(轉向) *********************/
					request.setAttribute("orderStatus", orderStatus);
					request.setAttribute("orderTime", orderTime);
					String url = "/_05_company/orderCom.jsp";
					RequestDispatcher successView = request
							.getRequestDispatcher(url);
					successView.forward(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
		} // end select
		
		
		
		
		
		if ("newOrdCom".equals(action)) {
			// 訂單狀態(1 = 未處理 )
			Integer ord_status = 1;
			String  orderTime = "all";
			Integer com_id = null;
			
			try{
			CompanyVO comVO = new CompanyVO();
			comVO = (CompanyVO)session.getAttribute("LoginComOK");
			com_id = comVO.getComID();
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("session內的'comVO'物件有出錯");
			}
			/*******************(存取資料+轉向) *********************/
			OrdersService odrSvc = new OrdersService();
			List<OrdersVO> ordVO = odrSvc.ordSearch_com(com_id, ord_status,
					orderTime);
			System.out.println("未處理訂單數量:" + ordVO.size());
			request.setAttribute("ordVO", ordVO);
			session.setAttribute("orderStatus", ord_status);
			session.setAttribute("orderTime", orderTime);
			String url = "/_05_company/orderCom.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);
			successView.forward(request, response);
			/*******************(以上不做驗證) *********************/
		} // end newOrd if
		
		if ("reCarCom".equals(action)) {
			// 訂單狀態(3 = 已出車 )
			Integer ord_status = 3;
			String  orderTime = "all";
			Integer com_id = null;
			
			try{
			CompanyVO comVO = new CompanyVO();
			comVO = (CompanyVO)session.getAttribute("LoginComOK");
			com_id = comVO.getComID();
			}catch(Exception e){
				e.printStackTrace();
				System.out.println("session內的'comVO'物件有出錯");
			}
			
			/*******************(存取資料+轉向) *********************/
			OrdersService odrSvc = new OrdersService();
			List<OrdersVO> ordVO = odrSvc.ordSearch_com(com_id, ord_status,
					orderTime);
			System.out.println("未還車訂單數量:"+ordVO.size());
			request.setAttribute("ordVO", ordVO);
			session.setAttribute("orderStatus", ord_status);
			session.setAttribute("orderTime", orderTime);
			/******************** (Send the Success view) ************/
			String url = "/_05_company/orderCom.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);
			successView.forward(request, response);
			/*******************(以上不做驗證) *********************/
		} // end noreCar if
		
		if ("accept".equals(action)) {
			// 訂單狀態(2 = 已接受 )
			Integer ord_status = 2;
			// 暫時接收參數
			String _ord_id = "";
			Object _orderStatus = "";
			Object _orderTime = "";
			// 真接收屬性
			CompanyVO comVO = new CompanyVO();
			Integer com_id = null;
			Integer ord_id = null;
			Integer orderStatus = null;
			String orderTime = "";
			// 現在時間
			Timestamp cancelTime = null;
			// ------------------給值----------------------
			try{
				cancelTime = new Timestamp(System.currentTimeMillis());;
				comVO = (CompanyVO)session.getAttribute("LoginComOK");
				com_id = comVO.getComID();
				}catch(Exception e){
					e.printStackTrace();
					System.out.println("session內的'comVO'物件有出錯");
				}
			// ------------------表單驗證----------------------
			try {
				Map<String, String[]> dataMap = request.getParameterMap();
				Iterator<Map.Entry<String, String[]>> entries = dataMap
						.entrySet().iterator();
				if (entries != null) { // 如果這是一個上傳資料的表單
					// 讀取使用者輸入資料
					String name = "";
					String value = "";
					while (entries.hasNext()) {
						Map.Entry<String, String[]> entry = entries.next();
						name = entry.getKey();
						Object valueObj = entry.getValue();

						if (valueObj == null) {
							value = "";
						} else if (valueObj instanceof String[]) {
							String[] values = (String[]) valueObj;
							for (int i = 0; i < values.length; i++) {
								value = values[i] + ",";
							}
							value = value.substring(0, value.length() - 1);
						} else {
							value = valueObj.toString();
						}

						if (name.equalsIgnoreCase("_ord_id")) {
							_ord_id = value;
						} else {
							continue;
						}

					} // end 表單驗證 while
					// ------------------資料接收----------------------
					_ord_id = request.getParameter("ord_id");
					_orderStatus = session.getAttribute("orderStatus");
					_orderTime = session.getAttribute("orderTime");
					// ------------------資料驗證+轉型----------------------
					
					try {
						ord_id = Integer.parseInt(_ord_id.toString().trim());
					} catch (NumberFormatException e) {
						errorMsg.put("ErrSelect", "訂單ID不是整數");
					} catch (NullPointerException e) {
						errorMsg.put("ErrSelect", "訂單ID是null");
					}

					try {
						orderStatus = Integer
								.parseInt(_orderStatus.toString().trim());
					} catch (NumberFormatException e) {
						errorMsg.put("ErrSelect", "訂單Status不是整數");
					} catch (NullPointerException e) {
						errorMsg.put("ErrSelect", "訂單Status是null");
					}

					try {
						orderTime = _orderTime.toString().trim();

						if (orderTime.trim().length() < 2
								|| orderTime.trim().length() > 3) {
							errorMsg.put("ErrOrderTime", "訂單期間長度不對");
						}
					} catch (NumberFormatException e) {
						errorMsg.put("ErrOrderTime", "訂單期間不是整數");
					} catch (NullPointerException e) {
						errorMsg.put("ErrOrderTime", "訂單期間是null");
					}

					/*******************(存取資料) *********************/
					if (errorMsg.isEmpty()) {
						OrdersService odrSvc = new OrdersService();
						odrSvc.ordCancel(ord_id, ord_status, cancelTime);
						List<OrdersVO> ordVO = odrSvc.ordSearch_com(com_id,
								orderStatus, orderTime);
						request.setAttribute("ordVO", ordVO);
						session.setAttribute("orderStatus", ord_status);
						session.setAttribute("orderTime", orderTime);
						if (ordVO.isEmpty()) {
							msgOK.put("SearchNull", "沒有資料");
						}
					}
					/*******************(轉向) *********************/
					String url = "/_05_company/orderCom.jsp";
					RequestDispatcher successView = request
							.getRequestDispatcher(url);
					successView.forward(request, response);
				} else {
					errorMsg.put("errTitle", "此表單不是上傳檔案的表單");
				} // end if 表單驗證
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // end accept 
		
		
		if ("cancelCom".equals(action)) {
			// 訂單狀態(6 = 商家取消 )
			Integer ord_status = 6;
			// 暫時接收參數
			String _ord_id = "";
			Object _orderStatus = "";
			Object _orderTime = "";
			// 真接收屬性
			CompanyVO comVO = new CompanyVO();
			Integer com_id = null;
			Integer ord_id = null;
			Integer orderStatus = null;
			String orderTime = "";
			// 現在時間
			Timestamp cancelTime = null;
			// ------------------給值----------------------
			try{
				cancelTime = new Timestamp(System.currentTimeMillis());;
				comVO = (CompanyVO)session.getAttribute("LoginComOK");
				com_id = comVO.getComID();
				}catch(Exception e){
					e.printStackTrace();
					System.out.println("session內的'comVO'物件有出錯");
				}
			// ------------------表單驗證----------------------
			try {
				Map<String, String[]> dataMap = request.getParameterMap();
				Iterator<Map.Entry<String, String[]>> entries = dataMap
						.entrySet().iterator();
				if (entries != null) { // 如果這是一個上傳資料的表單
					// 讀取使用者輸入資料
					String name = "";
					String value = "";
					while (entries.hasNext()) {
						Map.Entry<String, String[]> entry = entries.next();
						name = entry.getKey();
						Object valueObj = entry.getValue();

						if (valueObj == null) {
							value = "";
						} else if (valueObj instanceof String[]) {
							String[] values = (String[]) valueObj;
							for (int i = 0; i < values.length; i++) {
								value = values[i] + ",";
							}
							value = value.substring(0, value.length() - 1);
						} else {
							value = valueObj.toString();
						}

						if (name.equalsIgnoreCase("_ord_id")) {
							_ord_id = value;
						} else {
							continue;
						}

					} // end 表單驗證 while
					// ------------------資料接收----------------------
					_ord_id = request.getParameter("ord_id");
					_orderStatus = session.getAttribute("orderStatus");
					_orderTime = session.getAttribute("orderTime");
					// ------------------資料驗證+轉型----------------------
					
					try {
						ord_id = Integer.parseInt(_ord_id.toString().trim());
					} catch (NumberFormatException e) {
						errorMsg.put("ErrSelect", "訂單ID不是整數");
					} catch (NullPointerException e) {
						errorMsg.put("ErrSelect", "訂單ID是null");
					}

					try {
						orderStatus = Integer
								.parseInt(_orderStatus.toString().trim());
					} catch (NumberFormatException e) {
						errorMsg.put("ErrSelect", "訂單Status不是整數");
					} catch (NullPointerException e) {
						errorMsg.put("ErrSelect", "訂單Status是null");
					}

					try {
						orderTime = _orderTime.toString().trim();

						if (orderTime.trim().length() < 2
								|| orderTime.trim().length() > 3) {
							errorMsg.put("ErrOrderTime", "訂單期間長度不對");
						}
					} catch (NumberFormatException e) {
						errorMsg.put("ErrOrderTime", "訂單期間不是整數");
					} catch (NullPointerException e) {
						errorMsg.put("ErrOrderTime", "訂單期間是null");
					}

					/*******************(存取資料) *********************/
					if (errorMsg.isEmpty()) {
						OrdersService odrSvc = new OrdersService();
						odrSvc.ordCancel(ord_id, ord_status, cancelTime);
						List<OrdersVO> ordVO = odrSvc.ordSearch_com(com_id,
								orderStatus, orderTime);
						request.setAttribute("ordVO", ordVO);
						session.setAttribute("orderStatus", ord_status);
						session.setAttribute("orderTime", orderTime);
						if (ordVO.isEmpty()) {
							msgOK.put("SearchNull", "沒有資料");
						}
					}
					/*******************(轉向) *********************/
					String url = "/_05_company/orderCom.jsp";
					RequestDispatcher successView = request
							.getRequestDispatcher(url);
					successView.forward(request, response);
				} else {
					errorMsg.put("errTitle", "此表單不是上傳檔案的表單");
				} // end if 表單驗證
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // end cancelCom 
	}// end post
}
