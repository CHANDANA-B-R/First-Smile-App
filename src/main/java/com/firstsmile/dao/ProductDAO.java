package com.firstsmile.dao;

import java.util.List;

import com.firstsmile.dto.Product;

public interface ProductDAO {
   void addProduct(Product product);
   Product getProductById(Integer product_id);
   List<Product> getAllProducts();
   void updateProduct(Product product);
   void deleteProduct(Integer productId);
   List<Product> getProductByName(String product_name);
}
