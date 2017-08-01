package com.jxust.svsh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jxust.svsh.entity.Topic;
import com.jxust.svsh.service.TopicService;

@Controller
@RequestMapping(value="/topic")
public class TopicController {
	
	@Autowired
	public TopicService topicService;
	
	@RequestMapping(value="getalltopic")
	@ResponseBody
	public List<Topic> getalltopin(){
		System.out.println("topic查询正在进行");
		List<Topic> list=topicService.getalltopic();
		System.out.println("topic的个数："+list.size());
		return list;
	}
}
