package com.myproject.entity;

import org.springframework.web.multipart.MultipartFile;

public class Account {
	private String name,mail,pass;
	private String dateJoin,role;
	private int id;
	private String status,phoneNumber;
	private MultipartFile imageFile;
	private String imageUrl;
	private String historystatus;
	                 
	public Account() {}
	
	public MultipartFile getImageFile() {
		return imageFile;
	}

	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public Account(String name, String mail, String pass, String role, String dateJoin,String status,String phoneNumber) {
		super();
		this.name = name;
		this.mail = mail;
		this.pass = pass;
		this.role = role;
		this.dateJoin = dateJoin;
		this.status=status;
		this.phoneNumber=phoneNumber;
	}
	
	public Account(String mail, String pass) {
		super();
		this.mail = mail;
		this.pass = pass;
	}

	public Account(int id, String name, String mail, String pass, String role, String dateJoin,String status,String phoneNumber,String imageUrl) {
		super();
		this.id = id;
		this.name = name;
		this.mail = mail;
		this.pass = pass;
		this.role = role;
		this.dateJoin = dateJoin;
		this.status=status;
		this.phoneNumber=phoneNumber;
		this.imageUrl=imageUrl;
	}
	
	public Account(String name, String mail, String pass, String role ,String dateJoin, String status,
			String phoneNumber, String imageUrl,String historystatus) {
		super();
		this.name = name;
		this.mail = mail;
		this.pass = pass;
		this.dateJoin = dateJoin;
		this.role = role;
		this.status = status;
		this.phoneNumber = phoneNumber;
		this.imageUrl = imageUrl;
		this.historystatus=historystatus;
	}
	

	public Account(String name, String mail, String pass, String dateJoin, String role, int id, String status,
			String phoneNumber, MultipartFile imageFile, String imageUrl) {
		super();
		this.name = name;
		this.mail = mail;
		this.pass = pass;
		this.dateJoin = dateJoin;
		this.role = role;
		this.id = id;
		this.status = status;
		this.phoneNumber = phoneNumber;
		this.imageFile = imageFile;
		this.imageUrl = imageUrl;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
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
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getDateJoin() {
		return dateJoin;
	}
	public void setDateJoin(String dateJoin) {
		this.dateJoin = dateJoin;
	}

	public String getHistorystatus() {
		return historystatus;
	}

	public void setHistorystatus(String historystatus) {
		this.historystatus = historystatus;
	}
	
	
	
}
