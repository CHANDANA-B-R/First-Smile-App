package com.firstsmile.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.firstsmile.connection.Connector;
import com.firstsmile.dao.ImageDAO;
import com.firstsmile.dto.Image;

public class ImageDAOImpl implements ImageDAO {
    Connection con;
    public ImageDAOImpl() {
    	 this.con=Connector.requestConnection();
    }
	@Override
	public void addImage(Image image) {
		String query="insert into image values(0,?)";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,image.getFile_path());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public Image getImageById(Integer image_id) {
		String query="Select * from image where image_id=?";
		Image image=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, image_id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				image=new Image();
				image.setImage_id(rs.getInt("image_id"));
				image.setFile_path(rs.getString("file_path"));
			}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return image;
	}

	@Override
	public void updateImage(Image image) {
		String query="Update Image set image_id=? ,file_path=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, image.getImage_id());
			ps.setString(2, image.getFile_path());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	@Override
	public void deleteImage(Integer image_id) {
		String query="Delete from image where image_id=?";
		try {
			PreparedStatement ps =con.prepareStatement(query);
			ps.setInt(1, image_id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
