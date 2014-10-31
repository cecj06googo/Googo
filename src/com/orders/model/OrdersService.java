package com.orders.model;

import java.sql.Timestamp;
import java.util.List;


public class OrdersService {
	private OrdersDAO_interface dao;

	public OrdersService() {
		dao = new OrdersJDBCDAO();
	}

	public OrdersVO addOrder(Integer _ord_status, Integer _com_id,
			Integer _mem_id, Timestamp _ord_time, Timestamp _ord_getday,
			Timestamp _ord_reday, Double _item_total, Integer _prod_id,
			Integer _acc_id, String _item_name, String _item_phone,
			String _item_tel, String _item_email, String _pritem_acc,
			String _item_all) {

		OrdersVO ordersVO = new OrdersVO();
		ordersVO.setOrd_status(_ord_status);
		ordersVO.setCom_id(_com_id);
		ordersVO.setMem_id(_mem_id);
		ordersVO.setOrd_time(_ord_time);
		ordersVO.setOrd_getday(_ord_getday);
		ordersVO.setOrd_reday(_ord_reday);
		ordersVO.setItem_total(_item_total);
		ordersVO.setProd_id(_prod_id);
		ordersVO.setAcc_id(_acc_id);
		ordersVO.setItem_name(_item_name);
		ordersVO.setItem_phone(_item_phone);
		ordersVO.setItem_tel(_item_tel);
		ordersVO.setItem_email(_item_email);
		ordersVO.setPritem_acc(_pritem_acc);
		ordersVO.setItem_all(_item_all);

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
	
	
	public List<OrdersVO> ordSearch(Integer user_id,Integer sel_stus,String sel_time){
		return dao.user_getAll(user_id,sel_stus,sel_time);
	}// end ordSearch
	
	public void ordDelete(Integer ord_id, Integer ord_status){
		dao.user_delete(ord_id , ord_status);
	}// end ordSearch
}
