package com.orders.model;

import java.sql.Timestamp;
import java.util.List;


public class OrdersService {
	private OrdersDAO_interface dao;

	public OrdersService() {
		dao = new OrdersJDBCDAO();
	}

	public OrdersVO addOrder(Integer ord_status, Integer com_id,
			Integer mem_id, Timestamp ord_time, Timestamp ord_getday,
			Timestamp ord_reday, Integer item_total, Integer prod_id,
			Integer acc_id, String item_name, String item_phone,
			String item_tel, String item_email, String pritem_acc,
			String item_all) {

		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setOrd_status(ord_status);
		ordersVO.setCom_id(com_id);
		ordersVO.setMem_id(mem_id);
		ordersVO.setOrd_time(ord_time);
		ordersVO.setOrd_getday(ord_getday);
		ordersVO.setOrd_reday(ord_reday);
		ordersVO.setItem_total(item_total);
		ordersVO.setProd_id(prod_id);
		ordersVO.setAcc_id(acc_id);
		ordersVO.setItem_name(item_name);
		ordersVO.setItem_phone(item_phone);
		ordersVO.setItem_tel(item_tel);
		ordersVO.setItem_email(item_email);
		ordersVO.setPritem_acc(pritem_acc);
		ordersVO.setItem_all(item_all);

		dao.insert(ordersVO);
		// test----------------------------------------------
		System.out.println("訂單主表--------------------------------");
		System.out.println(ordersVO.getOrd_status());
		System.out.println(ordersVO.getCom_id());
		System.out.println(ordersVO.getMem_id());
		System.out.println(ordersVO.getOrd_getday());
		System.out.println(ordersVO.getOrd_reday());
		System.out.println(ordersVO.getItem_total());
		System.out.println("訂單明細--------------------------------");
		System.out.println(ordersVO.getProd_id());
		System.out.println(ordersVO.getAcc_id());
		System.out.println(ordersVO.getItem_name());
		System.out.println(ordersVO.getItem_phone());
		System.out.println(ordersVO.getItem_tel());
		System.out.println(ordersVO.getItem_email());
		System.out.println(ordersVO.getPritem_acc());
		System.out.println(ordersVO.getItem_all());
		System.out.println("-------------------------------------");
		// --------------------------------------------------
		System.out.println("訂單新增完成");
		return ordersVO;
	} // end addOrder
	
	
	public List<OrdersVO> ordSearch_mem(Integer userId,Integer orderStatus,String orderTime){
		System.out.println("會員ID:"+userId);
		System.out.println("訂單選擇狀態:"+orderStatus);
		System.out.println("訂單選擇時間:"+orderTime);
		return dao.mem_getAll(userId,orderStatus,orderTime);
	}// end ordSearch

	public List<OrdersVO> ordSearch_com(Integer userId,Integer orderStatus,String orderTime){
		System.out.println("商家ID:"+userId);
		System.out.println("訂單選擇狀態:"+orderStatus);
		System.out.println("訂單選擇時間:"+orderTime);
		return dao.com_getAll(userId,orderStatus,orderTime);
	}// end ordSearch
	public void ordCancel(Integer ord_id, Integer orderStatus,Timestamp cancelTime){
		System.out.println("被刪除的訂單ID:"+ord_id);
		System.out.println("訂單狀態更改為:"+orderStatus);
		dao.user_cancel(ord_id , orderStatus,cancelTime);
	}// end ordSearch
}
