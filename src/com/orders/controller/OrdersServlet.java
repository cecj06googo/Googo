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

import com.member.model.MemVO;
import com.orders.model.OrdersService;
import com.orders.model.OrdersVO;

public class OrdersServlet extends HttpServlet {

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
		request.setAttribute("ErrorMsg", errorMsg); // 顯示錯誤訊息
		request.setAttribute("MsgOK", msgOK); // 顯示錯誤訊息
		// 1 ('未處理');
		// 2 ('已接受');
		// 3 ('已出車');
		// 4 ('結單');
		// 5 ('會員取消');
		// 6 ('商家取消');
		// 7 ('會員逾時');
		// 8 ('商家逾時');
		// 9 ('異常未還');
		String action = request.getParameter("action");
		String Identity = session.getAttribute("Identity").toString();
		// ------------------新增訂單----------------------
		if ("insert".equals(action)) {
			Integer ord_status = 1;

			// String暫時接收屬性
			Object _com_id = "";
			Object _mem_id = "";
			String _ord_time = "";
			String _ord_getday = "";
			String _ord_reday = "";
			String _item_total = "";
			String _prod_id = "";
			String _acc_id = "";
			// 真接收屬性
			String item_name = "";
			String item_phone = "";
			String item_tel = "";
			String item_email = "";
			String pritem_acc = "";
			String item_all = "";
			Integer com_id = null;
			Integer mem_id = null;
			Timestamp ord_time = null;
			Timestamp ord_getday = null;
			Timestamp ord_reday = null;
			Integer item_total = null;
			Integer prod_id = null;
			Integer acc_id = null;

			// ------------------表單驗證+資料接收----------------------
			try {
				Map<String, String[]> dataMap = request.getParameterMap();
				Iterator<Map.Entry<String, String[]>> entries = dataMap
						.entrySet().iterator();
				if (entries != null && session.getAttribute("com_id") != null
						&& session.getAttribute("mem_id") != null) { // 如果這是一個上傳資料的表單
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

						if (name.equalsIgnoreCase("ord_time")) {
							_ord_time = value;
						} else if (name.equalsIgnoreCase("ord_getday")) {
							_ord_getday = value;
						} else if (name.equalsIgnoreCase("ord_reday")) {
							_ord_reday = value;
						} else if (name.equalsIgnoreCase("item_total")) {
							_item_total = value;
						} else if (name.equalsIgnoreCase("prod_id")) {
							_prod_id = value;
						} else if (name.equalsIgnoreCase("acc_id")) {
							_acc_id = value;
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
							item_all = value;
						} else {
							continue;
						}
					} // end while
					_com_id = session.getAttribute("com_id");
					_mem_id = session.getAttribute("mem_id");

					// ------------------資料驗證+轉型----------------------
					// 日期轉型限定日期選擇器選擇的值，使用者自行輸入的話很有可能會轉不了
					// 檢查使用者輸入資料
					try {
						com_id = Integer.parseInt(_com_id.toString().trim());
					} catch (NumberFormatException e) {
						errorMsg.put("errorCom_id", "看到鬼，商家ID應該為整數");
					} catch (NullPointerException e) {
						errorMsg.put("errorCom_id", "看到鬼，商家ID應該為整數不應為空值");
					}
					try {
						mem_id = Integer.parseInt(_mem_id.toString().trim());
					} catch (NumberFormatException e) {
						errorMsg.put("errorMem_id", "看到鬼，會員ID應該為整數");
					} catch (NullPointerException e) {
						errorMsg.put("errorMem_id", "看到鬼，會員ID應該為整數不應為空值");
					}
					try {
						ord_time = Timestamp.valueOf(_ord_time);
					} catch (Exception e) {
						errorMsg.put("errorOrd_time",
								"格式錯誤，範例： 2014-10-20 07:06:32");
					}
					try {
						ord_getday = Timestamp.valueOf(_ord_getday);
					} catch (Exception e) {
						errorMsg.put("errorOrd_getday",
								"格式錯誤，範例： 2014-10-20 07:06:32");
					}
					try {
						ord_reday = Timestamp.valueOf(_ord_reday);
					} catch (Exception e) {
						errorMsg.put("errorOrd_reday",
								"格式錯誤，範例： 2014-10-20 07:06:32");
					}
					try {
						item_total = Integer.parseInt(_item_total.trim());
					} catch (Exception e) {
						errorMsg.put("errorItem_total", "訂單金額應該為整數");
					}
					try {
						prod_id = Integer.parseInt(_prod_id.trim());
					} catch (NumberFormatException e) {
						errorMsg.put("errorProd_id", "看到鬼，商品編號應該為整數");
					}
					try {
						acc_id = Integer.parseInt(_acc_id.trim());
					} catch (NumberFormatException e) {
						errorMsg.put("errorAcc_id", "看到鬼，配備ID應該為整數");
					}

					if (item_name == null || item_name.trim().length() == 0) {
						errorMsg.put("errorItem_name", "領車人姓名欄必須輸入");
					}
					if (item_phone.trim().length() != 0
							|| item_tel.trim().length() != 0) { // 其中一項有輸入，繼續比對
						if (item_phone.trim().length() != 0) {// 手機有輸入
							if (item_phone.trim().length() != 10) {
								// 先暫時不用正則來驗證
								errorMsg.put("errorPhone", "手機號碼格式錯誤");
							}
						}
						if (item_tel.trim().length() != 0) { // 市話有輸入
							if (item_tel.trim().length() < 8
									|| item_tel.trim().length() > 10
									|| item_tel.trim().length() == 9) {
								// 先暫時不用正則來驗證
								errorMsg.put("errorTel", "市內電話格式錯誤");
							}
						}
					} else {
						// 兩項都沒輸入
						errorMsg.put("errorPT", "至少輸入一種聯絡方式");
					}
					if (item_email == null || item_email.trim().length() == 0) {
						errorMsg.put("errorEmail", "Email必須輸入");
					}

					// pritem_acc , item_all 可不輸入;

					// ---------------寫入database----------------------
					if (errorMsg.isEmpty()) {
						OrdersService odrSvc = new OrdersService();
						OrdersVO ordersVO = odrSvc.addOrder(ord_status, com_id,
								mem_id, ord_time, ord_getday, ord_reday,
								item_total, prod_id, acc_id, item_name,
								item_phone, item_tel, item_email, pritem_acc,
								item_all);

						request.setAttribute("ordersVO", ordersVO);
						msgOK.put("InsertOK",
								"<Font color='red'>訂單新增成功</Font><hr>");
						String url = "/_04_member/ThanksForOrdering.jsp";
						RequestDispatcher successView = request
								.getRequestDispatcher(url);
						successView.forward(request, response);
						/******************** (Send the Success view) ************/
					} else {

						// 有errorMsg轉回原頁面
						String url = "/_04_member/productsDetails.jsp";
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

		// ------------------搜尋訂單----------------------
		if ("select".equals(action)) {
			if ("Mem".equals(Identity)) {
				try {
					// ------------------資料接收----------------------
					// String暫時接收屬性
					Object _user_id = "";
					String _sel_stus = "";
					// 真接收屬性
					Integer user_id = null;
					Integer sel_stus = null;
					String sel_time = "";

					_user_id = session.getAttribute("user_id");
					_sel_stus = request.getParameter("sel_stus");
					sel_time = request.getParameter("sel_time");

					// ------------------資料驗證+轉型----------------------
					// 其實也可以直接轉(值都是用選擇器選的)，只怕有其他未知安全漏洞
					try {
						user_id = Integer.parseInt(_user_id.toString().trim());
					} catch (NumberFormatException e) {
						errorMsg.put("errorSelect", "看到鬼，ID應該為整數");
					} catch (NullPointerException e) {
						errorMsg.put("errorUser_id", "請重新登入");
					}
					try {
						sel_stus = Integer
								.parseInt(_sel_stus.toString().trim());
					} catch (NumberFormatException e) {
						errorMsg.put("errorSel_stus", "請選擇訂單狀態");
					} catch (Exception e) {
						errorMsg.put("errorSel_stus", "請選擇訂單狀態");
					}

					if (sel_time.trim().length() < 2
							|| sel_time.trim().length() > 3) {
						errorMsg.put("errorSel_time", "請選擇訂單時間");
					}

					// ---------------呼叫database----------------------
					if (errorMsg.isEmpty()) {
						OrdersService odrSvc = new OrdersService();
						List<OrdersVO> ordVO = odrSvc.ordSearch_mem(user_id,
								sel_stus, sel_time);
						request.setAttribute("ordVO", ordVO);
						if (ordVO.isEmpty()) {
							msgOK.put("SearchNull", "沒有資料");
						}
					}

					/******************** (Send the Success view) ************/
					session.setAttribute("sel_stus", sel_stus);
					session.setAttribute("sel_time", sel_time);
					String url = "/_04_member/orderMem.jsp";
					RequestDispatcher successView = request
							.getRequestDispatcher(url);

					successView.forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} // end Mem if

			if ("Com".equals(Identity)) {
				try {
					// ------------------資料接收----------------------
					// String暫時接收屬性
					Object _user_id = "";
					String _sel_stus = "";
					// 真接收屬性
					Integer user_id = null;
					Integer sel_stus = null;
					String sel_time = "";

					_user_id = session.getAttribute("user_id");
					_sel_stus = request.getParameter("sel_stus");
					sel_time = request.getParameter("sel_time");
					System.out.println(_sel_stus);
					System.out.println(sel_time);
					// ------------------資料驗證+轉型----------------------
					// 其實也可以直接轉(值都是用選擇器選的)，只怕有其他未知安全漏洞
					try {
						user_id = Integer.parseInt(_user_id.toString().trim());
					} catch (NumberFormatException e) {
						errorMsg.put("errorSelect", "看到鬼，ID應該為整數");
					} catch (NullPointerException e) {
						errorMsg.put("errorUser_id", "請重新登入");
					}
					try {
						sel_stus = Integer
								.parseInt(_sel_stus.toString().trim());
					} catch (NumberFormatException e) {
						errorMsg.put("errorSel_stus", "請選擇訂單狀態");
					} catch (Exception e) {
						errorMsg.put("errorSel_stus", "請選擇訂單狀態");
					}

					if (sel_time.trim().length() < 2
							|| sel_time.trim().length() > 3) {
						errorMsg.put("errorSel_time", "請選擇訂單時間");
					}

					// ---------------呼叫database----------------------
					if (errorMsg.isEmpty()) {
						OrdersService odrSvc = new OrdersService();
						List<OrdersVO> ordVO = odrSvc.ordSearch_com(user_id,
								sel_stus, sel_time);
						request.setAttribute("ordVO", ordVO);
						if (ordVO.isEmpty()) {
							msgOK.put("SearchNull", "沒有資料");
						}
					}

					/******************** (Send the Success view) ************/
					session.setAttribute("sel_stus", sel_stus);
					session.setAttribute("sel_time", sel_time);
					String url = "/_05_company/orderCom.jsp";
					RequestDispatcher successView = request
							.getRequestDispatcher(url);

					successView.forward(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} // end Com if

		} // end select

		// ------------------取消訂單----------------------
		if ("cancelMem".equals(action)) {
			// 訂單狀態(5 = 會員取消 )
			Integer ord_status = 5;

			// String暫時接收屬性
			Object _user_id = "";
			String _ord_id = "";
			Object _sel_stus = "";
			Object _sel_time = "";
			// 真接收屬性
			Integer user_id = null;
			Integer ord_id = null;
			Integer sel_stus = null;
			String sel_time = "";
			// 現在時間
			Timestamp cancelTime = null;
			cancelTime = new Timestamp(System.currentTimeMillis());

			// ------------------資料接收----------------------
			try {
				// ------------------表單驗證----------------------
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

					} // end while

					_ord_id = request.getParameter("ord_id");
					_user_id = session.getAttribute("user_id");
					_sel_stus = session.getAttribute("sel_stus");
					_sel_time = session.getAttribute("sel_time");
					// ------------------資料驗證+轉型----------------------
					try {
						user_id = Integer.parseInt(_user_id.toString().trim());
					} catch (NumberFormatException e) {
						errorMsg.put("errorSelect", "看到鬼，ID應該為整數");
					} catch (NullPointerException e) {
						errorMsg.put("errorSelect", "看到鬼，ID應該為整數不應為空值");
					}

					try {
						ord_id = Integer.parseInt(_ord_id.toString().trim());
					} catch (NumberFormatException e) {
						errorMsg.put("errorSelect", "看到鬼，訂單編號被竄改");
					} catch (NullPointerException e) {
						errorMsg.put("errorSelect", "看到鬼，訂單編號應該為整數不應為空值");
					}

					try {
						sel_stus = Integer
								.parseInt(_sel_stus.toString().trim());
					} catch (NumberFormatException e) {
						errorMsg.put("errorSelect", "看到鬼，訂單狀態編號被竄改");
					} catch (NullPointerException e) {
						errorMsg.put("errorSelect", "看到鬼，訂單編號應該為整數不應為空值");
					}

					try {
						sel_time = _sel_time.toString().trim();

						if (sel_time.trim().length() < 2
								|| sel_time.trim().length() > 3) {
							errorMsg.put("errorSelect", "看到鬼，訂單日期被竄改");
						}
					} catch (NumberFormatException e) {
						errorMsg.put("errorSelect", "看到鬼，訂單日期被竄改");
					} catch (NullPointerException e) {
						errorMsg.put("errorSelect", "看到鬼，訂單日期應該為整數不應為空值");
					}

					// ---------------寫入database----------------------
					if (errorMsg.isEmpty()) {
						OrdersService odrSvc = new OrdersService();
						odrSvc.ordCancel(ord_id, ord_status, cancelTime);
						List<OrdersVO> ordVO = odrSvc.ordSearch_mem(user_id,
								sel_stus, sel_time);

						request.setAttribute("ordVO", ordVO);
						if (ordVO.isEmpty()) {
							msgOK.put("SearchNull", "沒有資料");
						}
					}

					/******************** (Send the Success view) ************/

					String url = "/_04_member/orderMem.jsp";
					RequestDispatcher successView = request
							.getRequestDispatcher(url);

					successView.forward(request, response);

				} else {
					errorMsg.put("errTitle", "此表單不是上傳檔案的表單");
				} // end if 表單驗證
			} catch (Exception e) {
				e.printStackTrace();
			}

		} // end deleteMem

		if ("cancelCom".equals(action)) {
			// 訂單狀態(6 = 商家取消 )
			Integer ord_status = 6;

			// String暫時接收屬性
			Object _user_id = "";
			String _ord_id = "";
			Object _sel_stus = "";
			Object _sel_time = "";
			// 真接收屬性
			Integer user_id = null;
			Integer ord_id = null;
			Integer sel_stus = null;
			String sel_time = "";
			// 現在時間
			Timestamp cancelTime = null;
			cancelTime = new Timestamp(System.currentTimeMillis());
			// ------------------資料接收----------------------
			try {
				// ------------------表單驗證----------------------
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

					} // end while

					_ord_id = request.getParameter("ord_id");
					_user_id = session.getAttribute("user_id");
					_sel_stus = session.getAttribute("sel_stus");
					_sel_time = session.getAttribute("sel_time");
					// ------------------資料驗證+轉型----------------------
					try {
						user_id = Integer.parseInt(_user_id.toString().trim());
					} catch (NumberFormatException e) {
						errorMsg.put("errorSelect", "看到鬼，ID應該為整數");
					} catch (NullPointerException e) {
						errorMsg.put("errorSelect", "看到鬼，ID應該為整數不應為空值");
					}

					try {
						ord_id = Integer.parseInt(_ord_id.toString().trim());
					} catch (NumberFormatException e) {
						errorMsg.put("errorSelect", "看到鬼，訂單編號被竄改");
					} catch (NullPointerException e) {
						errorMsg.put("errorSelect", "看到鬼，訂單編號應該為整數不應為空值");
					}

					try {
						sel_stus = Integer
								.parseInt(_sel_stus.toString().trim());
					} catch (NumberFormatException e) {
						errorMsg.put("errorSelect", "看到鬼，訂單狀態編號被竄改");
					} catch (NullPointerException e) {
						errorMsg.put("errorSelect", "看到鬼，訂單編號應該為整數不應為空值");
					}

					try {
						sel_time = _sel_time.toString().trim();

						if (sel_time.trim().length() < 2
								|| sel_time.trim().length() > 3) {
							errorMsg.put("errorSelect", "看到鬼，訂單日期被竄改");
						}
					} catch (NumberFormatException e) {
						errorMsg.put("errorSelect", "看到鬼，訂單日期被竄改");
					} catch (NullPointerException e) {
						errorMsg.put("errorSelect", "看到鬼，訂單日期應該為整數不應為空值");
					}

					// ---------------寫入database----------------------
					if (errorMsg.isEmpty()) {
						OrdersService odrSvc = new OrdersService();
						odrSvc.ordCancel(ord_id, ord_status, cancelTime);
						List<OrdersVO> ordVO = odrSvc.ordSearch_com(user_id,
								sel_stus, sel_time);
						request.setAttribute("ordVO", ordVO);
						if (ordVO.isEmpty()) {
							msgOK.put("SearchNull", "沒有資料");
						}
					}

					/******************** (Send the Success view) ************/

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

		} // end delete

	} // end doPost
}
