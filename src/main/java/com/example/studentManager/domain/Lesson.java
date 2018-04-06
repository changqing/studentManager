package com.example.studentManager.domain;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="t_lesson")
@SuppressWarnings("serial")
public class Lesson implements Serializable {
	
	private Integer id;
	private String name;
	private Long tid;
	private String tname;
	private Integer xueshi;
	private String address;
	private String time;
	
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Long getTid() {
		return tid;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public void setTid(Long tid) {
		this.tid = tid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public Integer getXueshi() {
		return xueshi;
	}
	public void setXueshi(Integer xueshi) {
		this.xueshi = xueshi;
	}

}
