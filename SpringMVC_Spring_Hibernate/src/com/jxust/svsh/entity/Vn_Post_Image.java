package com.jxust.svsh.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="vn_post_image")
public class Vn_Post_Image {
	
	
	private int image_vn_id;
	private int i_connect_id;

	private String image_url;
	
	public Vn_Post_Image(){
		super();
	}
	
	public Vn_Post_Image(int image_vn_id,String image_url){
		super();
		this.image_vn_id=image_vn_id;
		this.image_url=image_url;
	}
	
	@Id
    @Column(name = "image_vn_id", nullable = false, unique = true)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getImage_vn_id() {
		return image_vn_id;
	}
	public void setImage_vn_id(int image_vn_id) {
		this.image_vn_id = image_vn_id;
	}
	@Column(name="i_connect_id")
	public int getConnect_id() {
		return i_connect_id;
	}

	public void setConnect_id(int i_connect_id) {
		this.i_connect_id = i_connect_id;
	}
	@Column(name="image_url",length=100)
	public String getImage_url() {
		return image_url;
	}
	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
}
