package com.orders.model;

import java.util.List;



public interface OrdersDAO_interface {
          public void insert(OrdersVO ordersVO);
          public List<OrdersVO> mem_getAll(Integer mem_id,Integer sel_stus,String sel_time);
          public List<OrdersVO> com_getAll(Integer com_id,Integer sel_stus,String sel_time);
          
          public void user_delete(Integer ord_id, Integer ord_status);
}
