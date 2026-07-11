package com.firstsmile.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.firstsmile.connection.Connector;
import com.firstsmile.dao.PaymentDAO;
import com.firstsmile.dto.Payment;

public class PaymentDAOImpl implements PaymentDAO {
	
	private Connection con;
    public PaymentDAOImpl() {
    	   this.con=Connector.requestConnection();
    }
    
	@Override
	public void addPayment(Payment payment) {
		String query="INSERT INTO PAYMENT VALUES (0,?,?,sysdate(),?)";
		int i=0;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			
			ps.setString(1,payment.getPayment_method());
			ps.setDouble(2,payment.getAmount());
			ps.setString(3,payment.getPayment_status());
			
			i=ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public Payment getPaymentById(Integer payment_id) {
		Payment p=null;
		String query="SELECT * FROM PAYMENT WHERE PAYMENT_ID=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1,payment_id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				p=new Payment();
				p.setPayment_id(rs.getInt("payment_id"));
				p.setPayment_method(rs.getString("payment_method"));
				p.setPayment_status(rs.getString("payment_status"));
				p.setPayment_date(rs.getString("payment_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}

	@Override
	public List<Payment> getAllPayments() {
		List<Payment> payments=new ArrayList<>();
		Payment p=null;
		String query="SELECT * FROM PAYMENT";
		try(PreparedStatement ps=con.prepareStatement(query)) {
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				p=new Payment();
				p.setPayment_id(rs.getInt("payment_id"));
				p.setPayment_method(rs.getString("payment_method"));
				p.setPayment_status(rs.getString("payment_status"));
				p.setPayment_date(rs.getString("payment_date"));
				payments.add(p);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return payments;
	}

	@Override
	public void updatePayment(Payment payment) {
		String query="UPDATE PAYMENT SET PAYMENT_METHOD=?,PAYMENT_STATUS=? WHERE PAYMENT_ID=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,payment.getPayment_method());
			ps.setString(2,payment.getPayment_status());
			ps.setInt(3,payment.getPayment_id());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void deletePayment(Integer payment_id) {
		String query="DELETE FROM PAYMENT WHERE PAYMENT_ID=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1,payment_id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
