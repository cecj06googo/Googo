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


public class OrdersActionMem extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public Map<String, String> errorMsg = new HashMap<String, String>();
	public Map<String, String> msgOK = new HashMap<String, String>();
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		System.out.println("orderStatus:"+request.getParameter("orderStatus"));
//		System.out.println("orderTime:"+request.getParameter("orderTime"));
		page(request,response);
		
	}

	protected void page(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException{
		HttpSession session = request.getSession();
		request.setAttribute("MsgOK", msgOK); // 顯示成功訊息
	//分頁用
		errorMsg.clear();
		msgOK.clear();
		MemVO memVO = new MemVO();
		Integer userId = null;
		Integer orderStatus = null;
		String orderTime = "";
		
		memVO = (MemVO) session.getAttribute("LoginMemOK");
		userId = memVO.getMem_id();
		orderStatus = Integer.parseInt(request.getParameter("orderStatus").toString());
		orderTime = request.getParameter("orderTime").toString();
	
		OrdersService odrSvc = new OrdersService();
		List<OrdersVO> ordVO = odrSvc.ordSearch_com(userId,
				orderStatus, orderTime);
		request.setAttribute("ordVO", ordVO);
		request.setAttribute("orderStatusMem", orderStatus);
		request.setAttribute("orderTimeMem", orderTime);
		if (ordVO.isEmpty()) {
			msgOK.put("SearchNull", "沒有資料");
		}
		String url = "/_04_member/orderMem.jsp";
		RequestDispatcher successView = request
				.getRequestDispatcher(url);
		successView.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Map<String, String> errorMsg = new HashMap<String, String>();
		Map<String, String> msgOK = new HashMap<String, String>();
		request.setAttribute("ErrorMsg", errorMsg); // 顯示錯誤訊息
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
		System.out.println("進入OrdersActionMem");
		System.out.println("action = " + action);
		
		if ("insert".equals(action)) {
			errorMsg.clear();
			msgOK.clear();
			//logic給值
			Integer ord_status = 1;
			// 暫時接收參數
//			Object _com_id = "";
//			Object _mem_id = "";
			String _ord_getday = "";
			String _ord_reday = "";
			Object _item_total = "";
			Object _prod_id = "";
			// 真接收參數
			String item_name = "";
			String item_phone = "";
			String item_tel = "";
			String item_email = "";
			String pritem_acc = "";
			String item_all = "abc";
			Integer com_id = null;
			Integer mem_id = null;
			Timestamp ord_time = null;
			Timestamp ord_getday = null;
			Timestamp ord_reday = null;
			Integer item_total = null;
			Integer prod_id = null;
			Integer acc_id = 0; //用不到了
			CompanyVO comVO = new CompanyVO();
			MemVO memVO = new MemVO();
			//給值
			ord_time = new Timestamp(System.currentTimeMillis());

			// ------------------表單驗證+資料接收----------------------
			try {
				Map<String, String[]> dataMap = request.getParameterMap();
				Iterator<Map.Entry<String, String[]>> entries = dataMap
						.entrySet().iterator();
				if (entries != null ) { // 如果這是一個上傳資料的表單
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

						// equalsIgnoreCase 忽略大小寫，
						// "ABC".equalsIgnoreCase("abc")==ture
						// equals "ABC".equals("abc")=false

						if (name.equalsIgnoreCase("ord_getday")) {
							_ord_getday = value;
						} else if (name.equalsIgnoreCase("ord_reday")) {
							_ord_reday = value;
						} else if (name.equalsIgnoreCase("item_total")) {
							_item_total = value;
						} else if (name.equalsIgnoreCase("item_name")) {
							item_name = value;
						} else if (name.equalsIgnoreCase("item_phone")) {
							item_phone = value;
						} else if (name.equalsIgnoreCase("item_tel")) {
							item_tel = value;
						} else if (name.equalsIgnoreCase("item_email")) {
							item_email = value;
						} else if (name.equalsIgnoreCase("pritem_acc")) {
							pritem_acc = value;
						} else if (name.equalsIgnoreCase("item_all")) {
							item_all = value; //目前沒用到
						} else if (name.equalsIgnoreCase("prod_id")) {
							_prod_id = value;
						} else if (name.equalsIgnoreCase("item_total")) {
							_item_total = value;
						}
						else{
							continue;
						}
					} // end while
					
					//接值 (com在商品VO, mem在session內的MemVO)
					comVO = (CompanyVO) session.getAttribute("ord_comVO");
					memVO = (MemVO) session.getAttribute("LoginMemOK");

//					_prod_id = session.getAttribute("prod_id");
					
//					_item_total = request.getParameter("item_total");
//					_item_total = 3000;
					// ------------------資料驗證+轉型----------------------
					// 日期轉型限定日期選擇器選擇的值，使用者自行輸入的話很有可能會轉不了
					// 檢查使用者輸入資料
					try {
						com_id = comVO.getComID();
//								Integer.parseInt(_com_id.toString().trim());
					} catch (Exception e) {
						System.out.println("com_id出錯");
					} 
					try {
						mem_id = memVO.getMem_id();
//								Integer.parseInt(_mem_id.toString().trim());
					} catch (Exception e) {
						System.out.println("mem_id出錯");
					}
					try {
						ord_getday = Timestamp.valueOf(_ord_getday);
					} catch (Exception e) {
						System.out.println("ord_getday出錯");
					}
					try {
						ord_reday = Timestamp.valueOf(_ord_reday);
					} catch (Exception e) {
						System.out.println("ord_reday出錯");;
					}
					try {
						System.out.println("_item_total:"+_item_total);
						item_total = Integer.parseInt(_item_total.toString());
						System.out.println("item_total:"+item_total);
					} catch (Exception e) {
						item_total = 8200;
					}
					try {
						prod_id = Integer.parseInt(_prod_id.toString());
					} catch (NumberFormatException e) {
						errorMsg.put("errorProd_id", "看到鬼，商品編號應該為整數");
					} catch (NullPointerException e) {
						errorMsg.put("errorMem_id", "看到鬼，會員ID應該為整數不應為空值");
					}
					
//					if (item_name == null || item_name.trim().length() == 0) {
//						errorMsg.put("errorItem_name", "領車人姓名欄必須輸入");
//					}
//					
//					
//					if (item_phone.trim().length() != 0
//							|| item_tel.trim().length() != 0) { // 其中一項有輸入，繼續比對
//						if (item_phone.trim().length() != 0) {// 手機有輸入
//							if (item_phone.trim().length() != 10) {
//								// 先暫時不用正則來驗證
//								errorMsg.put("errorPhone", "手機號碼格式錯誤");
//							}
//						}
//						if (item_tel.trim().length() != 0) { // 市話有輸入
//							if (item_tel.trim().length() < 8
//									|| item_tel.trim().length() > 10
//									|| item_tel.trim().length() == 9) {
//								// 先暫時不用正則來驗證
//								errorMsg.put("errorTel", "市內電話格式錯誤");
//							}
//						}
//					} else {
//						// 兩項都沒輸入
//						errorMsg.put("errorPT", "至少輸入一種聯絡方式");
//					}
//					if (item_email == null || item_email.trim().length() == 0) {
//						errorMsg.put("errorEmail", "Email必須輸入");
//					}
					System.out.println("item_total:"+item_total);
					System.out.println("item_phone:"+item_phone);
					System.out.println("item_tel:"+item_tel);
					System.out.println("item_email:"+item_email);
					// pritem_acc , item_all 可不輸入;

					// ---------------寫入database----------------------
					if (errorMsg.isEmpty()) {
						OrdersService odrSvc = new OrdersService();
						odrSvc.addOrder(ord_status, com_id,
								mem_id, ord_time, ord_getday, ord_reday,
								item_total, prod_id, acc_id, item_name,
								item_phone, item_tel, item_email, pritem_acc,
								item_all);

//						request.setAttribute("ordersVO", ordersVO);
						msgOK.put("InsertOK",
								"<Font color='red'>訂單新增成功</Font><hr>");
						String url = "/_07_order/ThanksForOrdering.jsp";
						RequestDispatcher successView = request
								.getRequestDispatcher(url);
						successView.forward(request, response);
						/******************** (轉向)*******************/
					} else {
						System.out.println("新增失敗");
						// 有errorMsg轉回原頁面
						String url = "/_07_order/placeOrder.jsp";
						RequestDispatcher successView = request
								.getRequestDispatcher(url);
						successView.forward(request, response);
					}
				} else {
					errorMsg.put("errTitle", "此表單不是上傳檔案的表單");
				} // end if 表單驗證

			} catch (Exception e) {
				e.printStackTrace();
			}
		} // end insert
		
		if ("selectMem".equals(action)) {
			errorMsg.clear();
			msgOK.clear();
			try {
				// ------------------資料接收----------------------
				// String暫時接收屬性
				String _orderStatus = "";
				// 真接收屬性
				MemVO memVO = new MemVO();
				Integer mem_id = null;
				Integer orderStatus = null;
				String orderTime = "";
				try {
					memVO = (MemVO) session.getAttribute("LoginMemOK");
					mem_id = memVO.getMem_id();
					_orderStatus = request.getParameter("orderStatus");
					orderTime = request.getParameter("orderTime");
				} catch (Exception e) {
					System.out.println("selectMem 資料接收出錯");
					e.printStackTrace();
				}
				// ------------------資料驗證+轉型----------------------
				// 其實也可以直接轉(值都是用選擇器選的)，只怕有其他未知安全漏洞
				try {
					orderStatus = Integer.parseInt(_orderStatus.toString()
							.trim());
				} catch (NumberFormatException e) {
					errorMsg.put("ErrOrderStatus", "請選擇訂單狀態");
				} catch (Exception e) {
					errorMsg.put("ErrOrderStatus", "請選擇訂單狀態");
				}

				if (orderTime.trim().length() < 2
						|| orderTime.trim().length() > 3) {
					errorMsg.put("ErrOrderTime", "請選擇訂單時間");
				}

				/******************* (存取資料) *********************/
				if (errorMsg.isEmpty()) {
					OrdersService odrSvc = new OrdersService();
					List<OrdersVO> ordVO = odrSvc.ordSearch_mem(mem_id,
							orderStatus, orderTime);
					request.setAttribute("ordVO", ordVO);
					if (ordVO.isEmpty()) {
						msgOK.put("SearchNull", "沒有資料");
					}
				}

				/******************* (轉向) *********************/
				request.setAttribute("orderStatusMem", orderStatus);
				request.setAttribute("orderTimeMem", orderTime);
				String url = "/_04_member/orderMem.jsp";
				RequestDispatcher successView = request
						.getRequestDispatcher(url);
				successView.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // end selectMem
		
		if ("cancelMem".equals(action)) {
			// 訂單狀態(5 = 會員取消 )
			Integer ord_status = 5;
			errorMsg.clear();
			msgOK.clear();
			
			MemVO memVO = new MemVO();
			Integer mem_id = null;
			Integer ord_id = null;
			Integer orderStatus = null;
			String orderTime = "";
			// 現在時間
			Timestamp updateTime = null;
			// ------------------給值----------------------
			try {
				updateTime = new Timestamp(System.currentTimeMillis());
				memVO = (MemVO) session.getAttribute("LoginMemOK");
				mem_id = memVO.getMem_id();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("session內的'memVO'物件接收出錯");
			}
			// ------------------接值----------------------
			ord_id = Integer.parseInt(request.getParameter("ord_id"));
			orderStatus = Integer.parseInt(request.getParameter("orderStatus"));
			orderTime = request.getParameter("orderTime");
			/******************* (存取資料) *********************/
				OrdersService odrSvc = new OrdersService();
				odrSvc.ordCancel(ord_id, ord_status, updateTime);
				List<OrdersVO> ordVO = odrSvc.ordSearch_mem(mem_id,
						orderStatus, orderTime);
				request.setAttribute("ordVO", ordVO);
				request.setAttribute("orderStatusMem", orderStatus);
				request.setAttribute("orderTimeMem", orderTime);
				if (ordVO.isEmpty()) {
					msgOK.put("SearchNull", "沒有資料");
				}
			
			/******************* (轉向) *********************/
			String url = "/_04_member/orderMem.jsp";
			RequestDispatcher successView = request
					.getRequestDispatcher(url);
			successView.forward(request, response);
			/***********************************************/
		} // end cancelMem
				
		
		
		if ("mem_ord".equals(action)) {
			// 訂單新增成功頁面，會員點頁面上"訂單管理"btn會跑這onload
			// 訂單狀態(1 = 未處理 )
			errorMsg.clear();
			msgOK.clear();
			Integer ord_status = 1;
			String orderTime = "1W";
			Integer mem_id = null;
			try {
				MemVO memVO = new MemVO();
				memVO = (MemVO) session.getAttribute("LoginMemOK");
				mem_id = memVO.getMem_id();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("session內的'memVO'物件接收出錯");
			}
			/******************* (存取資料+轉向) *********************/
			OrdersService odrSvc = new OrdersService();
			List<OrdersVO> ordVO = odrSvc.ordSearch_mem(mem_id, ord_status,
					orderTime);
			System.out.println("(條件)未處理訂單數量:" + ordVO.size());
			request.setAttribute("ordVO", ordVO);
			request.setAttribute("orderStatusMem", ord_status);
			request.setAttribute("orderTimeMem", orderTime);
			String url = "/_04_member/orderMem.jsp";
			RequestDispatcher successView = request.getRequestDispatcher(url);
			successView.forward(request, response);
			/******************* (以上不做驗證) *********************/
		} // end mem_ord
	} // end doPost
} // end class