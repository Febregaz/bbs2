package com.jxust.svsh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxust.svsh.dao.CommentDAO;
import com.jxust.svsh.entity.comment;

@Transactional
@Service
public class CommentService {

	@Autowired
	public CommentDAO commentDAO;
	
    public void addComment(comment c) {
        commentDAO.addComment(c);
    }
    
    public List<comment> getAllComment(){
    	return commentDAO.getAllComment();
    }
	
}
