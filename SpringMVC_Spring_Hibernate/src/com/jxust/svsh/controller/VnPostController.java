package com.jxust.svsh.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jxust.svsh.entity.Topic;
import com.jxust.svsh.entity.Vn_Post;
import com.jxust.svsh.service.TopicService;
import com.jxust.svsh.service.VnPostService;

@Controller
@RequestMapping(value="/vnpost")
public class VnPostController {

	@Autowired
	private VnPostService vnPostService;
	@Autowired private TopicService topicService;
	
	@RequestMapping(value="getallpost")
	@ResponseBody
	public List<Vn_Post> getallpost(String topic_id){
		int id=Integer.parseInt(topic_id);
		System.out.println("post查询正在进行");
		List<Vn_Post> list=vnPostService.getallpost(id);
		System.out.println("post的长度："+list.size());
		return list;
	}
	
	@RequestMapping(value="add")
	@ResponseBody
	public List<Vn_Post> add(String board_id,String topic_id,String user_id,String text) throws IOException{
		System.out.println("都传进来了吗:"+"board_id"+board_id+"topic_id"+topic_id+"user_id"+user_id+"text"+text);
		System.out.println("检查点a");
		int b_id=Integer.parseInt(board_id);
		int t_id=Integer.parseInt(topic_id);
		int u_id=Integer.parseInt(user_id);
		System.out.println("检查点b");
		Vn_Post vp=new Vn_Post();
		System.out.println("检查点c");
		vp.setB_id(b_id);vp.setT_id(t_id);vp.setU_id(u_id);vp.setPost_title(text);
		System.out.println("检查点d");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		System.out.println("当前系统时间"+df.format(new Date()));// new Date()为获取当前系统时间
		System.out.println("Date:"+new Date());
		vp.setCreate_time(new Date());
		vp.setPost_url("vn/vn_post_show.jsp");
		System.out.println("检查点e");
		vnPostService.add(vp);
		
		/*更新topic表的字段topic_son_num*/
		Topic t=topicService.getonetopic(t_id);
		int vice_id=t.getTopic_son_num();
		System.out.println("查到的topic_sum_num:"+vice_id);
		t.setTopic_son_num(vice_id+1);
		topicService.updatetopic(t);
		/*更新topic表的字段topic_son_num*/
		return null;
	}
	
	@RequestMapping(value="getbyuser")
	@ResponseBody
	public List<Vn_Post> getbyuser(String user_id){
		int id=Integer.parseInt(user_id);
		List<Vn_Post> list=vnPostService.getbyuser(id);
		return list;
	}
}
