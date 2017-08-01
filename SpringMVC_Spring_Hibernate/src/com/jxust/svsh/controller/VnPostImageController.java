package com.jxust.svsh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jxust.svsh.entity.Vn_Post_Image;
import com.jxust.svsh.service.VnPostImageService;

@Controller
@RequestMapping(value="/image")
public class VnPostImageController {
	
	@Autowired
	private VnPostImageService vnPostImageService;
	
	@RequestMapping(value="getallimage")
	@ResponseBody
	public List<Vn_Post_Image> getAllImage(String post_id){
		System.out.println("检查值："+post_id);
		int a = Integer.parseInt(post_id);
		List<Vn_Post_Image> list=vnPostImageService.getAllImage(a);
		System.out.println("Image的长度:"+list.size());
		return list;
	}

}
