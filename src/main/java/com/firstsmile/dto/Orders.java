package com.firstsmile.dto;

public class Orders {
  private Integer order_id;
  private String order_date;
  private String delivery_date;
  private Integer uid;
  private Integer payment_id;
  public Integer getOrder_id() {
	return order_id;
  }
  public void setOrder_id(Integer order_id) {
	this.order_id = order_id;
  }
  public String getOrder_date() {
	return order_date;
  }
  public void setOrder_date(String order_date) {
	this.order_date = order_date;
  }
  public String getDelivery_date() {
	return delivery_date;
  }
  public void setDelivery_date(String delivery_date) {
	this.delivery_date = delivery_date;
  }
  public Integer getUid() {
	return uid;
  }
  public void setUid(Integer uid) {
	this.uid = uid;
  }
  public Integer getPayment_id() {
	return payment_id;
  }
  public void setPayment_id(Integer payment_id) {
	this.payment_id = payment_id;
  }
  
}
