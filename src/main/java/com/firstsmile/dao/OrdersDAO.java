package com.firstsmile.dao;

import java.util.List;

import com.firstsmile.dto.Orders;

public interface OrdersDAO {
  void addOrders(Orders order);
  Orders getOrderById(Integer order_id);
  List<Orders> getAllOrders();
  void deleteOrder(Integer order_id);
}
