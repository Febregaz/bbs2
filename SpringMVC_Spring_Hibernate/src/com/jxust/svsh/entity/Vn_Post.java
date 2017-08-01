package com.jxust.svsh.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "vn_post")
public class Vn_Post {
	
	private int vn_id;
	private int b_id;
	private int t_id;
	private int u_id;
	private String post_title;
	private Date create_time;
	private String post_url;

	public Vn_Post() {
		super();
	}

	public Vn_Post(int vn_id, int b_id, int t_id, int u_id, String post_title,Date create_time) {
		super();
		this.vn_id=vn_id;
		this.b_id=b_id;
		this.t_id=t_id;
		this.u_id=u_id;
		this.post_title=post_title;
		this.create_time=create_time;
	}
	
	@Id
    @Column(name = "vn_id", nullable = false, unique = true)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getVn_id() {
		return vn_id;
	}

	public void setVn_id(int vn_id) {
		this.vn_id = vn_id;
	}

	@Column(name="b_id")
	public int getB_id() {
		return b_id;
	}

	public void setB_id(int b_id) {
		this.b_id = b_id;
	}

	@Column(name="t_id")
	public int getT_id() {
		return t_id;
	}

	public void setT_id(int t_id) {
		this.t_id = t_id;
	}

	@Column(name="u_id")
	public int getU_id() {
		return u_id;
	}

	public void setU_id(int u_id) {
		this.u_id = u_id;
	}

	@Column(name="post_title",length=100)
	public String getPost_title() {
		return post_title;
	}

	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}

	@Column(name="create_time")
	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	
	@Column(name="post_url")
	public String getPost_url() {
		return post_url;
	}

	public void setPost_url(String post_url) {
		this.post_url = post_url;
	}

}
