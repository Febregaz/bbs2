package com.jxust.svsh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxust.svsh.dao.VnPostTextDAO;
import com.jxust.svsh.entity.Vn_Post_Text;
import com.jxust.svsh.entity.Vn_Post_Video;

@Transactional
@Service
public class VnPostTextService {
	
	@Autowired
	private VnPostTextDAO vnPostTextDAO;
	
	public List<Vn_Post_Text> getAllText(int connect_id){
		System.out.println("检查id的值2："+connect_id);
		return vnPostTextDAO.getAllText(connect_id);
	}
	
	/*添加vn video*/
    public void addText(Vn_Post_Text vnposttext) {
    	vnPostTextDAO.addText(vnposttext);
    }
}
