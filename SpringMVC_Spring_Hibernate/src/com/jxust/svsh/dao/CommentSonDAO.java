package com.jxust.svsh.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.jxust.svsh.entity.comment_son;

@Repository
public class CommentSonDAO {

    @Resource
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }
    
    public void addCommentSon(comment_son cs) {
        this.getSession().save(cs);
    }
    
    @SuppressWarnings("unchecked")
    public List<comment_son> getAllCommentSon() {
        return this.getSession().createCriteria(comment_son.class).list();
    }
	
}
