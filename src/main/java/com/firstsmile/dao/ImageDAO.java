package com.firstsmile.dao;


import com.firstsmile.dto.Image;

public interface ImageDAO {
	 void addImage(Image image);
	   Image getImageById(Integer image_id);
	   void updateImage(Image image);
	   void deleteImage(Integer image_id);
	   
}
