package com.jxust.svsh.dao;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import com.jxust.svsh.entity.Board;

@Repository
public class BoardDAO {
	
    @Resource
    private SessionFactory sessionFactory;

    private Session getSession() {
        return sessionFactory.getCurrentSession();
    }
    
    /*所有board*/
    @SuppressWarnings("unchecked")
	public List<Board> getAllBoard(){
    	return this.getSession().createCriteria(Board.class).list();
    }
    
    /*updateboard*/
    public void updateboard(Board board){
    	this.getSession().update(board);
    }
    
    /*deleteboard*/
    public void deleteBoardById(int id) {
        this.getSession().createQuery("delete Board where id=?").setParameter(0, id).executeUpdate();
    }
    
    /*get max board_id*/
	public Board getmaxboard(){
		return (Board)this.getSession().createQuery("from Board where board_id=(select max(board_id) from Board)").uniqueResult();
	}
	
	/*add board*/
	public void addBoard(Board board){
		this.getSession().save(board);
	}
    
}
