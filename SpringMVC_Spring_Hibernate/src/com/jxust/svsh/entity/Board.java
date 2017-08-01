package com.jxust.svsh.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="board")
public class Board {
	
	private int board_id;
	private String board_name;
	private String board_desc;
	private int topic_num;
	private String dearjhon;
	private int privacy;

	public Board(){
		super();
	}
	
	public Board(int board_id,String board_name,String board_desc,int topic_num,String dearjhon,int privacy){
		super();
		this.board_id=board_id;
		this.board_name=board_name;
		this.board_desc=board_desc;
		this.topic_num=topic_num;
		this.dearjhon=dearjhon;
		this.privacy=privacy;
	}
	
    @Id
    @Column(name = "board_id", nullable = false, unique = true)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	@Column(name="board_name",length=150)
	public String getBoard_name() {
		return board_name;
	}
	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	@Column(name="board_desc",length=255)
	public String getBoard_desc() {
		return board_desc;
	}
	public void setBoard_desc(String board_desc) {
		this.board_desc = board_desc;
	}
	@Column(name="topic_num")
	public int getTopic_num() {
		return topic_num;
	}
	public void setTopic_num(int topic_num) {
		this.topic_num = topic_num;
	}
	@Column(name="dearjhon")
	public String getDearjhon() {
		return dearjhon;
	}
	public void setDearjhon(String dearjhon) {
		this.dearjhon = dearjhon;
	}
	@Column(name="privacy")
	public int getPrivacy() {
		return privacy;
	}

	public void setPrivacy(int privacy) {
		this.privacy = privacy;
	}
}
