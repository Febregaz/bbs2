package com.jxust.svsh.controller;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.jxust.svsh.entity.Board;
import com.jxust.svsh.entity.User;
import com.jxust.svsh.service.UserService;

@SessionAttributes("user_name")
@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	public UserService userService;
	
	String s_id;
	
	@RequestMapping(value="/login")
	public String login(String user_id,String password,ModelMap model){
		System.out.println("登陆查询正在进行。。。");
		s_id=user_id;
		System.out.println(user_id);
		System.out.println(password);
		int id=Integer.parseInt(user_id);
		User name_exist=userService.getUserByName(id);
		String name=name_exist.getUser_name();
		User password_exist=userService.getUserByPassword(password);
		System.out.println("登陆查询完成");
		System.out.println("name:"+name_exist);
		System.out.println("password:"+password_exist);
		if(name_exist!=null && password_exist!=null){
			model.addAttribute("user_name",name_exist);
			return "board";
		}
		return "error";
	}
	
	@RequestMapping(value="/logout")
	public String logout(ModelMap model){
		System.out.println("正在进行用户注销");
		//session.removeAttribute("user_name");/*存在疑问*/
		model.clear();
		System.out.println("是什么？"+model.size());
		System.out.println("用户注销已经完成");
		return "login";
	}
	
	@RequestMapping(value="getoneuser")
	@ResponseBody
	public List<User> getAllUser(String user_id){
		System.out.println("user查询正在进行");
		System.out.println("检查全局的用户id:"+s_id);
		System.out.println("检查传进来的用户id:"+user_id);
		int id=Integer.parseInt(user_id);
		User user=userService.getOneUser(id);
		//map.put("board_list", list);
		System.out.println("oneuser查询已经结束:"+user);
		List<User> list = new ArrayList<User>();;list.add(user);
		System.out.println("list的长度:"+list.size());
		return list;
	}
	
	@RequestMapping(value="getalluser")
	@ResponseBody
	public List<User> getalluser(){
		List<User> list=userService.getalluser();
		System.out.println("user人数:"+list.size());
		return list;
	}	
	
}
