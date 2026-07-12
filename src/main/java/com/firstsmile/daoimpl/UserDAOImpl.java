package com.firstsmile.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.firstsmile.connection.Connector;
import com.firstsmile.dao.UserDAO;
import com.firstsmile.dto.User;

public class UserDAOImpl implements UserDAO {
    private Connection con;
    public UserDAOImpl() {
    	   this.con=Connector.requestConnection();
    }
	@Override
	public void addUser(User user) {
		String query="Insert into User values (0,?,?,?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4,user.getPhone());
			ps.setString(5, user.getLocation());
			ps.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}

	@Override
	public User getUserById(Integer uid) {
		User user=null;
		String query="Select * from user where uid=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, uid);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				user=new User();
				user.setUid(rs.getInt("uid"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setPhone(rs.getString("phone"));
				user.setLocation(rs.getString("location"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}

	@Override
	public List<User> getAllUsers() {
		List<User> users =new ArrayList<>();
		String query="Select * from user ";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				User user=new User();
				user.setUid(rs.getInt("uid"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setPhone(rs.getString("phone"));
				user.setLocation(rs.getString("location"));
				users.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return users;
	}

	@Override
	public void updateUser(User user) {
		String query="Update user set name=?,email=?,password=?,phone=?,location=? where uid=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2,user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getPhone());
			ps.setString(5, user.getLocation());
			ps.setInt(6, user.getUid());
			ps.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public User getUserByMail(String email) {
		String query="Select * from user where email=?";
		User user=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,email );
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				 user = new User();
				 user.setName(rs.getString("name"));
				 user.setEmail(rs.getString("email"));
				 user.setPassword(rs.getString("password"));
				 user.setPhone(rs.getString("phone"));
				 user.setLocation(rs.getString("location"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public void deleteUser(Integer uid) {
	   String query="Delete from user where uid=?";
	   try {
		PreparedStatement ps=con.prepareStatement(query);
		ps.setInt(1, uid);
		ps.executeUpdate();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   
		
	}

	@Override
	public User getUserByMailAndPassword(String email, String password) {
	   String query="Select * from user where email=? and password=?";
	   User user=null;
	   try {
		PreparedStatement ps=con.prepareStatement(query);
		ps.setString(1, email);
		ps.setString(2, password);
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			user=new User();
			user.setName(rs.getString("name"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setPhone(rs.getString("phone"));
			user.setLocation(rs.getString("location"));
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	   
		return user;
	}
 
}
