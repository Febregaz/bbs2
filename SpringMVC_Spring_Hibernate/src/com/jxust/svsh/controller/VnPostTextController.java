package com.jxust.svsh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jxust.svsh.entity.Vn_Post;
import com.jxust.svsh.entity.Vn_Post_Text;
import com.jxust.svsh.service.VnPostService;
import com.jxust.svsh.service.VnPostTextService;

@Controller
@RequestMapping(value="/text")
public class VnPostTextController {
	
	@Autowired
	private VnPostTextService vnPostTextService;
	@Autowired public VnPostService vnPostService;
	
	@RequestMapping(value="getalltext")
	@ResponseBody
	public List<Vn_Post_Text> getAllText(String post_id){
		System.out.println("检查值："+post_id);
		int a = Integer.parseInt(post_id);
		List<Vn_Post_Text> list=vnPostTextService.getAllText(a);
		System.out.println("text的长度:"+list.size());
		return list;
	}
	
	@RequestMapping(value="addtext")
	public String addText(String area,String user_id){
		System.out.println("textarea:"+area);
		System.out.println("user_id:"+user_id);
		int id=Integer.parseInt(user_id);
		Vn_Post_Text vpt=new Vn_Post_Text();
		/*获取vn_post表中的最大主键值*/
		Vn_Post vp=vnPostService.getmaxpost();
		System.out.println("最大的vn_id:"+vp.getVn_id());
		int maxvn_id=vp.getVn_id()+1;
		System.out.println("备用的vn_id:"+maxvn_id);
		/*获取vn_post表中的最大主键值*/
		vpt.setConnect_id(maxvn_id);
		vpt.setText_content(area);
		vnPostTextService.addText(vpt);
		System.out.println("成功加入数据库");
		return "uploadpost";
	}
	
}
