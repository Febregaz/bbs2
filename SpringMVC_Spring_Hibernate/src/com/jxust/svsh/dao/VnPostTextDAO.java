package com.jxust.svsh.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.jxust.svsh.entity.Vn_Post_Text;
import com.jxust.svsh.entity.Vn_Post_Video;

@Repository
public class VnPostTextDAO {
	
    @Resource
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }
    
    /*all text*/
	@SuppressWarnings("unchecked")
	public List<Vn_Post_Text> getAllText(int connect_id){
		System.out.println("检查id的值3："+connect_id);
    	return this.getSession().createQuery("from Vn_Post_Text where t_connect_id=?").setParameter(0, connect_id).list();
    }
	
	/*添加vn text*/
    public void addText(Vn_Post_Text vnposttext) {
        this.getSession().save(vnposttext);
    }
}
