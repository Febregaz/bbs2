package com.jxust.svsh.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jxust.svsh.entity.comment;
import com.jxust.svsh.entity.comment_son;
import com.jxust.svsh.service.CommentService;
import com.jxust.svsh.service.CommentSonService;

@Controller
public class CommentController {
	
	@Autowired
	public CommentService commentService;
	@Autowired
	public CommentSonService commentsonService;
	
	@RequestMapping(value="aedd")
	public String add(String area,String post_id){
		System.out.println("post_id="+post_id);
		int id=Integer.parseInt(post_id);
		System.out.println("area="+area);
		comment c=new comment();
		c.setArea(area);
		c.setC_vn_post_id(id);
		commentService.addComment(c);
		return  "redirect:vn/vn_post_show.jsp?post_id='+post_id+'";
	}
	
	@RequestMapping(value="gall")
	@ResponseBody
	public List<comment> getallcomment(){
		List<comment> list= commentService.getAllComment();
		System.out.println("comment的长度:"+list.size());
		return list;
	}
	
	@RequestMapping(value="addsoncom")
	public String addsoncomment(String post_id,String son_area,String fa_id){
		System.out.println("post_id="+post_id);
		System.out.println("son_area="+son_area);
		System.out.println("fa_id="+fa_id);
		int id=Integer.parseInt(fa_id);
		comment_son cs=new comment_son();
		cs.setSon_area(son_area);
		cs.setFa_id(id);
		commentsonService.addCommentSon(cs);
		return  "redirect:vn/vn_post_show.jsp?post_id='+post_id+'";
	}
	
	@RequestMapping(value="gallson")
	@ResponseBody
	public List<comment_son> getallcommentson(){
		List<comment_son> list=commentsonService.getAllCommentSon();
		System.out.println("comment_son的长度:"+list.size());
		return list;
	}
	
}
