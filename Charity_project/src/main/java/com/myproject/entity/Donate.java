package com.myproject.entity;

public class Donate {
	private int userId;
	private String campaignId,date ,amount;
	public int getUserId()  {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getCampaignId() {
		return campaignId;
	}
	public void setCampaignId(String campaignId) {
		this.campaignId = campaignId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Donate() {}
	public Donate(int userId, String campaignId, String amount, String date) {
		super();
		this.userId = userId;
		this.amount = amount;
		this.campaignId = campaignId;
		this.date = date;
	}
	
	
}
