package com.myproject.entity;

import java.sql.Date;

import org.apache.naming.java.javaURLContextFactory;
import org.springframework.web.multipart.MultipartFile;

public class Campaign {
	private String id,name,status,des;
	private String target,donate,donation;
	private String startDay,endDay;
	private MultipartFile imageFile;
	private String imageUrl;
	private String content;
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}
	
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

	public Campaign() {
		// TODO Auto-generated constructor stub
	}
		
	
	public Campaign(String id, String name, String status, String des, String target, String donate, String donation,
			String startDay, String endDay, MultipartFile imageFile, String imageUrl,String content) {
		super();
		this.id = id;
		this.name = name;
		this.status = status;
		this.des = des;
		this.target = target;
		this.donate = donate;
		this.donation = donation;
		this.startDay = startDay;
		this.endDay = endDay;
		this.imageFile = imageFile;
		this.imageUrl = imageUrl;
		this.content=content;
	}

	public Campaign(String id, String name, String status, String des, String target, String donate, String donation,
			String startDay, String endDay,String imageUrl,String content) {
		super();
		this.id = id;
		this.name = name;
		this.status = status;
		this.des = des;
		this.target = target;
		this.donate = donate;
		this.donation = donation;
		this.startDay = startDay;
		this.endDay = endDay;
		this.imageUrl=imageUrl;
		this.content=content;
	}
	public Campaign(String id, String name, String status, String des, String target,
			String startDay, String endDay) {
		super();
		this.id = id;
		this.name = name;
		this.status = status;
		this.des = des;
		this.target = target;
		this.startDay = startDay;
		this.endDay = endDay;
	}
	public Campaign(String id, String name, String status, String des, String target,
			String startDay, String endDay,String imageUrl,String content) {
		super();
		this.id = id;
		this.name = name;
		this.status = status;
		this.des = des;
		this.target = target;
		this.startDay = startDay;
		this.endDay = endDay;
		this.imageUrl=imageUrl;
		this.content=content;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getDonate() {
		return donate;
	}
	public void setDonate(String donate) {
		this.donate = donate;
	}
	public String getDonation() {
		return donation;
	}
	public void setDonation(String donation) {
		this.donation = donation;
	}
	public String getStartDay() {
		return startDay;
	}
	public void setStartDay(String startDay) {
		this.startDay = startDay;
	}
	public String getEndDay() {
		return endDay;
	}
	public void setEndDay(String endDay) {
		this.endDay = endDay;
	}
	
}
