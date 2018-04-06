package com.example.studentManager.domain;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="t_teacher")
@SuppressWarnings("serial")
public class Teacher implements Serializable {
	
	private Integer id;
	private String username;
	private String password;
	private String truename;
	private String phone;
	private String email;
	private String role;
	
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTruename() {
		return truename;
	}
	public void setTruename(String truename) {
		this.truename = truename;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}

}
