package com.jxust.svsh.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.jxust.svsh.entity.Topic;
import com.jxust.svsh.entity.User;

@Repository
public class TopicDAO {
    @Resource
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }
    
    @SuppressWarnings("unchecked")
	public List<Topic> getalltopic(){
    	return this.getSession().createCriteria(Topic.class).list();
    }
    
    /*getonetopic by topic_id*/
    public Topic getonetopic(int topic_id){
    	return (Topic) this.getSession().createQuery("from Topic where topic_id=?").setParameter(0, topic_id).uniqueResult();
    }
    
    /*update by topic's object*/
    public void updatetopic(Topic t){
    	this.getSession().update(t);
    }
}
