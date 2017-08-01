package com.jxust.svsh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxust.svsh.dao.VnPostDAO;
import com.jxust.svsh.entity.Vn_Post;

@Transactional
@Service
public class VnPostService {
	
	@Autowired
	private VnPostDAO vnPostDAO;
	
	public List<Vn_Post> getallpost(int topic_id){
		return vnPostDAO.getallpost(topic_id);
	}
	
	public void add(Vn_Post vp){
		vnPostDAO.add(vp);
	}
	
	/*得到vn_post表中的最大的主键*/
	public Vn_Post getmaxpost(){
		return vnPostDAO.getmaxpost();
	}
	
	/*get by user_id*/
	public List<Vn_Post> getbyuser(int user_id){
		return vnPostDAO.getbyuser(user_id);
	}
	
}
