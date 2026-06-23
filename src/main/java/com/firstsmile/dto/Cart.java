package com.firstsmile.dto;

public class Cart {
	 private Integer quantity;
   private Integer order_id;
   private Integer product_id;
  
   public Integer getOrder_id() {
	return order_id;
   }
   public void setOrder_id(Integer order_id) {
	this.order_id = order_id;
   }
   public Integer getProduct_id() {
	return product_id;
   }
   public void setProduct_id(Integer product_id) {
	this.product_id = product_id;
   }
   public Integer getQuantity() {
	return quantity;
   }
   public void setQuantity(Integer quantity) {
	this.quantity = quantity;
   }
   
}
