package com.jxust.svsh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxust.svsh.dao.VnPostVideoDAO;
import com.jxust.svsh.entity.Person;
import com.jxust.svsh.entity.Vn_Post_Video;

@Transactional
@Service
public class VnPostVideoService {
	
	@Autowired
	private VnPostVideoDAO vnPostVideoDAO;
	
	public List<Vn_Post_Video> getAllVideo(int connect_id){
		return vnPostVideoDAO.getAllVideo(connect_id);
	}
	
	/*添加vn video*/
    public void addVideo(Vn_Post_Video vnpostvideo) {
    	vnPostVideoDAO.addVideo(vnpostvideo);
    }

}
