package com.jxust.svsh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxust.svsh.dao.TopicDAO;
import com.jxust.svsh.entity.Topic;

@Transactional
@Service
public class TopicService {
	
	@Autowired
	public TopicDAO topicDAO;
	
	public List<Topic> getalltopic(){
		return topicDAO.getalltopic();
	}
	
	/*getonetopic by topic_id*/
	public Topic getonetopic(int topic_id){
		return topicDAO.getonetopic(topic_id);
	}
	
	/*update by topic's object*/
    public void updatetopic(Topic t){
    	topicDAO.updatetopic(t);
    }
	
}
