package com.firstsmile.dto;

public class Product {
   private Integer product_id;
   private String product_name;
   private Double product_price;
   private Integer image_id;
   public Integer getImage_id() {
	return image_id;
}
   public void setImage_id(Integer image_id) {
	this.image_id = image_id;
   }
   public Integer getProduct_id() {
	return product_id;
   }
   public void setProduct_id(Integer product_id) {
	this.product_id = product_id;
   }
   public String getProduct_name() {
	return product_name;
   }
   public void setProduct_name(String product_name) {
	this.product_name = product_name;
   }
   public Double getProduct_price() {
	return product_price;
   }
   public void setProduct_price(Double product_price) {
	this.product_price = product_price;
   }
   
}
