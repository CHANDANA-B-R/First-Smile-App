package com.firstsmile.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.firstsmile.connection.Connector;
import com.firstsmile.dao.OrdersDAO;
import com.firstsmile.dto.Orders;

public class OrdersDAOImpl implements OrdersDAO {

	 private Connection con;
	    public OrdersDAOImpl() {
	    	   this.con=Connector.requestConnection();
	    }
	
	@Override
	public void addOrders(Orders order) {
	String query = "insert into orders values(0,sysDate(),sysDate(),?,?)";
	try {
		PreparedStatement ps = con.prepareStatement(query);
		
		ps.setInt(1, order.getUid());
		ps.setInt(2, order.getPayment_id());
		
		ps.executeUpdate();
		
	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
		
	}

	@Override
	public Orders getOrderById(Integer order_id) {
		String query = "select * from orders where order_id = ?";
		Orders o = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, order_id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				o = new Orders();
				o.setOrder_id(rs.getInt("order_id"));
				o.setOrder_date(rs.getString("order_date"));
				o.setDelivery_date(rs.getString("delivery_date"));
				o.setUid(rs.getInt("uid"));
				o.setPayment_id(rs.getInt("payment_id"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return o;
	}

	@Override
	public List<Orders> getAllOrders() {
		List<Orders> olist = new ArrayList<>();
		Orders o = null;
		
		String query = "select * from Orders";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				o = new Orders();
				o.setOrder_id(rs.getInt("order_id"));
				o.setOrder_date(rs.getString("order_date"));
				o.setDelivery_date(rs.getString("delivery_date"));
				o.setUid(rs.getInt("uid"));
				o.setPayment_id(rs.getInt("payment_id"));
				
				olist.add(o);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return olist;
	}

	@Override
	public void deleteOrder(Integer order_id) {
		String query = "delete from orders where order_id = ?";
		
		try {
			PreparedStatement ps= con.prepareStatement(query);
			ps.setInt(1, order_id);
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
