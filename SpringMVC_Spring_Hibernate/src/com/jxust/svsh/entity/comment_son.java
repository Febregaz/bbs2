package com.jxust.svsh.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="comment_son")
public class comment_son {
	private int son_id;
	private String son_area;
	private int fa_id;
	
	public comment_son(){
		super();
	}
	
	public comment_son(int son_id,String son_area,int fa_id){
		this.son_id=son_id;
		this.son_area=son_area;
		this.fa_id=fa_id;
	}
	
    @Id
    @Column(name = "son_id", nullable = false, unique = true)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getSon_id() {
		return son_id;
	}
	public void setSon_id(int son_id) {
		this.son_id = son_id;
	}
	@Column(name="son_area",length=250)
	public String getSon_area() {
		return son_area;
	}
	public void setSon_area(String son_area) {
		this.son_area = son_area;
	}
	@Column(name="fa_id")
	public int getFa_id() {
		return fa_id;
	}
	public void setFa_id(int fa_id) {
		this.fa_id = fa_id;
	}
}
