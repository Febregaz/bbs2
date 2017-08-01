package com.jxust.svsh.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="vn_post_video")
public class Vn_Post_Video {
	
	private int video_vn_id;
	private int v_connect_id;
	private String video_url;
	
	@Id
    @Column(name = "video_vn_id", nullable = false, unique = true)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getVideo_vn_id() {
		return video_vn_id;
	}
	public void setVideo_vn_id(int video_vn_id) {
		this.video_vn_id = video_vn_id;
	}
	@Column(name="v_connect_id")
	public int getV_connect_id() {
		return v_connect_id;
	}
	public void setV_connect_id(int v_connect_id) {
		this.v_connect_id = v_connect_id;
	}
	@Column(name="video_url",length=100)
	public String getVideo_url() {
		return video_url;
	}
	public void setVideo_url(String video_url) {
		this.video_url = video_url;
	}
}
