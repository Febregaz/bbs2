package com.jxust.svsh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxust.svsh.dao.VnPostImageDAO;
import com.jxust.svsh.entity.Vn_Post_Image;
import com.jxust.svsh.entity.Vn_Post_Video;

@Transactional
@Service
public class VnPostImageService {
	
	@Autowired
	private VnPostImageDAO vnPostImageDAO;
	
	public List<Vn_Post_Image> getAllImage(int connect_id){
		return vnPostImageDAO.getAllImage(connect_id);
	}
	
	/*添加vn image*/
    public void addImage(Vn_Post_Image vnpostimage) {
    	vnPostImageDAO.addImage(vnpostimage);
    }
	
}
