package com.jxust.svsh.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.jxust.svsh.entity.comment;

@Repository
public class CommentDAO {

    @Resource
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }
    
    public void addComment(comment c) {
        this.getSession().save(c);
    }
    
    @SuppressWarnings("unchecked")
    public List<comment> getAllComment() {
        return this.getSession().createCriteria(comment.class).list();
    }
	
}
