package com.jxust.svsh.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.jxust.svsh.entity.Vn_Post_Image;

@Repository
public class VnPostImageDAO {
	
    @Resource
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }
    
    @SuppressWarnings("unchecked")
	public List<Vn_Post_Image> getAllImage(int connect_id){
    	System.out.println("检查id的值3："+connect_id);
    	return this.getSession().createQuery("from Vn_Post_Image where i_connect_id=?").setParameter(0, connect_id).list();
    }
	
	/*添加vn image*/
    public void addImage(Vn_Post_Image vnpostimage) {
        this.getSession().save(vnpostimage);
    }
	
}
