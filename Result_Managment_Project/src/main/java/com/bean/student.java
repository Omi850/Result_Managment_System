package com.bean;

public class student {
	 private int id;
	   private String name;
	   private String mobile;
	   private String gender;
	   private String city;
	   private String password;
	public student() {
		super();
		// TODO Auto-generated constructor stub
	}
	public student(int id, String name, String mobile, String gender, String city, String password) {
		super();
		this.id = id;
		this.name = name;
		this.mobile = mobile;
		this.gender = gender;
		this.city = city;
		this.password = password;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
