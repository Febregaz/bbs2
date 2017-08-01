package com.jxust.svsh.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.jxust.svsh.entity.Board;
import com.jxust.svsh.entity.Person;
import com.jxust.svsh.entity.User;

@Repository
public class UserDAO {
    @Resource
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }
    
    /*by Name*/
    public User getUserByName(int user_id) {
    	System.out.println(user_id);
    	return (User) this.getSession().createQuery("from User where user_id=?").setParameter(0, user_id).uniqueResult();
    }
    
    public User getUserByPassword(String password) {
    	System.out.println(password);
    	return (User) this.getSession().createQuery("from User where password=?").setParameter(0, password).uniqueResult();
    }
    
    /*oneuser*/
    @SuppressWarnings("unchecked")
	public User getOneUser(int user_id){
    	return (User) this.getSession().createQuery("from User where user_id=?").setParameter(0, user_id).uniqueResult();
    }
    
    /*getalluser*/
    @SuppressWarnings("unchecked")
	public List<User> getalluser(){
    	return this.getSession().createCriteria(User.class).list();
    }
 
}
