package com.orders.model;

import java.util.List;



public interface OrdersDAO_interface {
          public void insert(OrdersVO ordersVO);
          public List<OrdersVO> user_getAll(Integer user_id,Integer sel_stus,String sel_time);
          public void user_delete(Integer ord_id, Integer ord_status);
}
