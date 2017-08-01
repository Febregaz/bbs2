package com.jxust.svsh.controller;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder.In;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jxust.svsh.entity.Board;
import com.jxust.svsh.entity.User;
import com.jxust.svsh.service.BoardService;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	@Autowired
	public BoardService boardService;
	
	@RequestMapping(value="goto")
	public String go(){
		return "board";
	}
	
	@RequestMapping(value="getallboard")
	@ResponseBody
	public List<Board> getAllBoard(){
		System.out.println("board查询正在进行");
		List<Board> list=boardService.getAllBoard();
		System.out.println("Board的个数:"+list.size());
		//map.put("board_list", list);
		//System.out.println("board查询已经结束");
		return list;
	}
	
	@RequestMapping(value="updateboard")
	public void updateboard(String board_id,String board_desc,String board_name,String dearjhon,String topic_num){
		System.out.println("检测点1");
		System.out.println(board_id);
		System.out.println(board_desc);
		System.out.println(board_name);
		System.out.println(dearjhon);
		System.out.println(topic_num);
		Board board =new Board();
		int id=Integer.parseInt(board_id);
		int num=Integer.parseInt(topic_num);
		board.setBoard_id(id);
		board.setBoard_desc(board_desc);
		board.setBoard_name(board_name);
		board.setDearjhon(dearjhon);
		board.setTopic_num(num);
		boardService.updateboard(board);
		System.out.println("结束");
	}
	
	@RequestMapping(value="deleteboard")
	public void deleteBoard(String board_id){
		System.out.println("board_id:"+board_id);
		int id=Integer.parseInt(board_id);
		boardService.deleteBoardById(id);
		System.out.println("Board删除完成");
	}
	
	@RequestMapping(value="checkmaxid")
	@ResponseBody
	public List<Board> checkMaxId(){
		System.out.println("Hello");
		Board b=boardService.getmaxboard();
		b.setBoard_id(b.getBoard_id()+1);
		System.out.println(b.getBoard_id());
		List<Board> list=new ArrayList<Board>();
		list.add(b);
		System.out.println("list的长度:"+list.size());
		return list;
	}
	
	@RequestMapping(value="addboard")
	public void addBoard(String board_id,String board_desc,String board_name,String dearjhon,String topic_num,String privacy){
		System.out.println("检测点1");
		System.out.println(board_id);
		System.out.println(board_desc);
		System.out.println(board_name);
		System.out.println(dearjhon);
		System.out.println(topic_num);
		Board board =new Board();
		int id=Integer.parseInt(board_id);
		int num=Integer.parseInt(topic_num);
		int pri=Integer.parseInt(privacy);
		board.setBoard_id(id);
		board.setBoard_desc(board_desc);
		board.setBoard_name(board_name);
		board.setDearjhon(dearjhon);
		board.setTopic_num(num);
		board.setPrivacy(pri);
		boardService.addBoard(board);
		System.out.println("添加成功");
	}
	
}
