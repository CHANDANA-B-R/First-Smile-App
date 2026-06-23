package com.firstsmile.dto;

public class Payment {
  private Integer payment_id;
  private String payment_method;
  private Double amount;
  private String payment_date;
  private String payment_status;
  
  public Integer getPayment_id() {
	return payment_id;
  }
  public void setPayment_id(Integer payment_id) {
	this.payment_id = payment_id;
  }
  public String getPayment_method() {
	return payment_method;
  }
  public void setPayment_method(String payment_method) {
	this.payment_method = payment_method;
  }
  public Double getAmount() {
	return amount;
  }
  public void setAmount(Double amount) {
	this.amount = amount;
  }
  public String getPayment_date() {
	return payment_date;
  }
  public void setPayment_date(String payment_date) {
	this.payment_date = payment_date;
  }
  public String getPayment_status() {
	return payment_status;
  }
  public void setPayment_status(String payment_status) {
	this.payment_status = payment_status;
  }
  
}
