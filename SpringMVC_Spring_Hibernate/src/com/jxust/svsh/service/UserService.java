package com.jxust.svsh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxust.svsh.dao.UserDAO;
import com.jxust.svsh.entity.Board;
import com.jxust.svsh.entity.User;

@Transactional
@Service
public class UserService {
	
	@Autowired
	public UserDAO userDAO;
	
	/*by id*/
    public User getUserByName(int user_id){
    	System.out.println(user_id);
        return userDAO.getUserByName(user_id);
    }
    
    public User getUserByPassword(String password){
    	System.out.println(password);
        return userDAO.getUserByPassword(password);
    }
    
	/*查询所有User*/
	public User getOneUser(int user_id){
		return userDAO.getOneUser(user_id);
	}
	
    /*getalluser*/
    @SuppressWarnings("unchecked")
	public List<User> getalluser(){
    	return userDAO.getalluser();
    }
   
}
