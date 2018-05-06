package com.example.studentManager.domain;

import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name="t_notice")
@SuppressWarnings("serial")
public class Notice implements Serializable {
	
	private Integer id;
	private String title;
	private String content;
	private Integer tid;
	private String tname;
	private Date publishtime;
	
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	

	@Type(type="timestamp")
	public Date getPublishtime() {
		return publishtime;
	}
	public void setPublishtime(Date publishTime) {
		this.publishtime = publishtime;
	}

}
