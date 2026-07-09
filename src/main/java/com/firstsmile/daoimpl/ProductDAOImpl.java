package com.firstsmile.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.firstsmile.connection.Connector;
import com.firstsmile.dao.ProductDAO;
import com.firstsmile.dto.Product;


public class ProductDAOImpl implements ProductDAO {
	 private Connection con;
	    public ProductDAOImpl() {
	    	   this.con=Connector.requestConnection();
	    }
	
	@Override
	public void addProduct(Product product) {
		String query = "insert into product values(0,?,?,?)";
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			
			ps.setString(1,product.getProduct_name());
			ps.setDouble(2, product.getProduct_price());
			ps.setInt(3, product.getImage_id());
			
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Product getProductById(Integer product_id) {
	String query = "select * from product where product_id = ?";
	Product p = null;
	
	try {
		PreparedStatement ps = con.prepareStatement(query);
		
		ps.setInt(1, product_id);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			p = new Product();
			p.setProduct_name(rs.getString("product_name"));
			p.setProduct_price(rs.getDouble("product_price"));
			p.setImage_id(rs.getInt("image_id"));
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 
	
		return p;
	}

	@Override
	public List<Product> getAllProducts() {
		List<Product> plist = new ArrayList<>();
		Product p = null;
		
		String query = "select * from product";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				p = new Product();
			    
				p.setProduct_id(rs.getInt("product_id"));
				p.setProduct_name(rs.getString("product_name"));
				p.setProduct_price(rs.getDouble("product_price"));
				p.setImage_id(rs.getInt("image_id"));
				
				plist.add(p);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		
		return plist;
	}

	@Override
	public void updateProduct(Product product) {
		String query = "update product set product_name=?, product_price=? , image_id=? where product_id=?";
		
		try {
			PreparedStatement ps = con.prepareCall(query);
			
			ps.setString(1, product.getProduct_name());
			ps.setDouble(2, product.getProduct_price());
			ps.setInt(3, product.getImage_id());
			ps.setInt(4, product.getProduct_id());
			
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteProduct(Integer productId) {
		String query = "delete from product where product_id =?";
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, productId);
			
			ps.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

	@Override
	public List<Product> getProductByName(String product_name) {
		List<Product> plist = new ArrayList<>();
		Product p = null;
		
		String query = "select * from product where product_name=?";
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, product_name);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				p = new Product();
				p.setProduct_id(rs.getInt("product_id"));
				p.setProduct_price(rs.getDouble("product_price"));
				p.setImage_id(rs.getInt("image_id"));
				
				plist.add(p); 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return plist;
	}

}
