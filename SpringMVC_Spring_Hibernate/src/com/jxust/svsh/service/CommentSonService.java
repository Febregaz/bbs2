package com.jxust.svsh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxust.svsh.dao.CommentSonDAO;
import com.jxust.svsh.entity.comment_son;

@Transactional
@Service
public class CommentSonService {

	@Autowired
	public CommentSonDAO commentsonDAO;
	
    public void addCommentSon(comment_son cs) {
    	commentsonDAO.addCommentSon(cs);
    }
    
    public List<comment_son> getAllCommentSon(){
    	return commentsonDAO.getAllCommentSon();
    }
	
}
