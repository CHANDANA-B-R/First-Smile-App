package com.firstsmile.dao;

import java.util.List;

import com.firstsmile.dto.Cart;

public interface CartDAO {
	  void addOrders(Cart order);
	  Cart getOrderById(Integer order_id);
	  List<Cart> getAllOrders();
	  void deleteOrder(Integer order_id);
}
