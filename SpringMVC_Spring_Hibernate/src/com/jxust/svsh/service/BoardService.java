package com.jxust.svsh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jxust.svsh.dao.BoardDAO;
import com.jxust.svsh.entity.Board;

@Transactional
@Service
public class BoardService {
	
	@Autowired
	public BoardDAO boardDAO;
	
	/*查询所有Board*/
	public List<Board> getAllBoard(){
		return boardDAO.getAllBoard();
	}
	
	public void updateboard(Board board){
		boardDAO.updateboard(board);
	}
	
    /*deleteboard*/
    public void deleteBoardById(int id) {
        boardDAO.deleteBoardById(id);
    }
    
    /*get max board_id*/
	public Board getmaxboard(){
		return boardDAO.getmaxboard();
	}
	
	/*add board*/
	public void addBoard(Board board){
		boardDAO.addBoard(board);
	}
	
}
