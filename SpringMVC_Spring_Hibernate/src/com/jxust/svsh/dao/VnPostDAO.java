package com.jxust.svsh.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.jxust.svsh.entity.User;
import com.jxust.svsh.entity.Vn_Post;

@Repository
public class VnPostDAO {
	
    @Resource
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }
    
    @SuppressWarnings("unchecked")
    /*get by topic_id*/
	public List<Vn_Post> getallpost(int topic_id){
		return this.getSession().createQuery("from Vn_Post where t_id=?").setParameter(0, topic_id).list();
    }
	
	/*add*/
	public void add(Vn_Post vp){
		this.getSession().save(vp);
	}
	
	/*得到vn_post表中的最大的主键*/
	public Vn_Post getmaxpost(){
		return (Vn_Post) this.getSession().createQuery("from Vn_Post where vn_id=(select max(vn_id) from Vn_Post)").uniqueResult();
	}
	
	/*get by user_id*/
	@SuppressWarnings("unchecked")
	public List<Vn_Post> getbyuser(int user_id){
		return this.getSession().createQuery("from Vn_Post where u_id=?").setParameter(0, user_id).list();
	}

}
