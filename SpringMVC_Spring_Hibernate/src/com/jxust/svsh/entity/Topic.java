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
@Table(name="topic")
public class Topic {
	
	private int topic_id;
	private int b_id;
	private String topic_title;
	private int topic_son_num;
	private int use_id;
	private Date create_time;
	private int topic_replies;
	private int digest;
	private String topic_post_url;
	private String image_url;

	public Topic(){
		super();
	}
	
	public Topic(int topic_id,int b_id,String topic_title,int topic_son_num,int use_id,Date create_time,int topic_replies,int digest,String topic_post_url){
		super();
		this.topic_id=topic_id;
		this.b_id=b_id;
		this.topic_title=topic_title;
		this.topic_son_num=topic_son_num;
		this.use_id=use_id;
		this.create_time=create_time;
		this.topic_replies=topic_replies;
		this.digest=digest;
		this.topic_post_url=topic_post_url;
	}

	@Id
    @Column(name = "topic_id", nullable = false, unique = true)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getTopic_id() {
		return topic_id;
	}
	public void setTopic_id(int topic_id) {
		this.topic_id = topic_id;
	}
	@Column(name="b_id")
	public int getB_id() {
		return b_id;
	}
	public void setB_id(int b_id) {
		this.b_id = b_id;
	}
	@Column(name="topic_title",length=100)
	public String getTopic_title() {
		return topic_title;
	}
	public void setTopic_title(String topic_title) {
		this.topic_title = topic_title;
	}
	@Column(name="topic_son_num")
	public int getTopic_son_num() {
		return topic_son_num;
	}

	public void setTopic_son_num(int topic_son_num) {
		this.topic_son_num = topic_son_num;
	}
	@Column(name="use_id")
	public int getUse_id() {
		return use_id;
	}
	public void setUse_id(int use_id) {
		this.use_id = use_id;
	}
	@Column(name="create_time")
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	@Column(name="topic_replies")
	public int getTopic_replies() {
		return topic_replies;
	}
	public void setTopic_replies(int topic_replies) {
		this.topic_replies = topic_replies;
	}
	@Column(name="digest")
	public int getDigest() {
		return digest;
	}
	public void setDigest(int digest) {
		this.digest = digest;
	}
	@Column(name="topic_post_url")
    public String getTopic_post_url() {
		return topic_post_url;
	}
	
	public void setTopic_post_url(String topic_post_url) {
		this.topic_post_url = topic_post_url;
	}
	@Column(name="image_url")
	public String getImage_url() {
		return image_url;
	}

	public void setImage_url(String image_url) {
		this.image_url = image_url;
	}
}
