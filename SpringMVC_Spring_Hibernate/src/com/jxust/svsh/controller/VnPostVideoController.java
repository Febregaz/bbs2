package com.jxust.svsh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jxust.svsh.entity.Vn_Post_Video;
import com.jxust.svsh.service.VnPostVideoService;

@Controller
@RequestMapping(value="/video")
public class VnPostVideoController {
	
	@Autowired
	private VnPostVideoService vnPostVideoService;
	
	@RequestMapping(value="getallvideo")
	@ResponseBody
	public List<Vn_Post_Video> getAllVideo(String post_id){
		System.out.println("检查值："+post_id);
		int a = Integer.parseInt(post_id);
		List<Vn_Post_Video> list=vnPostVideoService.getAllVideo(a);
		System.out.println("video的长度:"+list.size());
		return list;
	}
	
}
