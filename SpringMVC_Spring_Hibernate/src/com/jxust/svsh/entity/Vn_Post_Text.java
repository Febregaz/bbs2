package com.jxust.svsh.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="vn_post_text")
public class Vn_Post_Text {
	
	private int text_vn_id;
	private int t_connect_id;
	private String text_content;
	
	public Vn_Post_Text(){
		super();
	}
	
	public Vn_Post_Text(int text_vn_id,String text_content){
		super();
		this.text_vn_id=text_vn_id;
		this.text_content=text_content;
	}
	
	@Id
    @Column(name = "text_vn_id", nullable = false, unique = true)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getText_vn_id() {
		return text_vn_id;
	}
	public void setText_vn_id(int text_vn_id) {
		this.text_vn_id = text_vn_id;
	}
	@Column(name="t_connect_id")
	public int getConnect_id() {
		return t_connect_id;
	}

	public void setConnect_id(int t_connect_id) {
		this.t_connect_id = t_connect_id;
	}
	@Column(name="text_content" ,length=200)
	public String getText_content() {
		return text_content;
	}
	public void setText_content(String text_content) {
		this.text_content = text_content;
	}
}
