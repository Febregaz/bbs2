package com.jxust.svsh.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="comment")
public class comment {
	
	private int c_id;
	private String area;
	private int c_vn_post_id;
	
	public comment(){
		super();
	}
	
	public comment(int c_id,String area,int c_vn_post_id){
		this.c_id=c_id;
		this.area=area;
		this.c_vn_post_id=c_vn_post_id;
	}
	
    @Id
    @Column(name = "c_id", nullable = false, unique = true)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getC_id() {
		return c_id;
	}
	public void setC_id(int c_id) {
		this.c_id = c_id;
	}
	@Column(name="area",length=250)
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	@Column(name="c_vn_post_id")
	public int getC_vn_post_id() {
		return c_vn_post_id;
	}
	public void setC_vn_post_id(int c_vn_post_id) {
		this.c_vn_post_id = c_vn_post_id;
	}
}
