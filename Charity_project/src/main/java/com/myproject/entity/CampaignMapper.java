package com.myproject.entity;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.jdbc.core.RowMapper;



public class CampaignMapper implements RowMapper<Campaign>{
	
	public Campaign mapRow(ResultSet rs ,int rownum) throws SQLException
	{
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		DecimalFormat formater=new DecimalFormat("###,###,###");
				
		Campaign cam = new Campaign();
		cam.setId(rs.getString("Campaign_id"));
		cam.setName(rs.getString("Campaign_name"));
		cam.setStatus(rs.getString("Status"));
		try {
			cam.setStartDay(sdf.format(sdf2.parse(rs.getString("Start_Date"))));
		} catch (ParseException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			cam.setEndDay(sdf.format(sdf2.parse(rs.getString("End_Date"))));
		} catch (ParseException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		cam.setTarget(formater.format(rs.getInt("Target")));
		cam.setDes(rs.getString("Description"));
		cam.setDonate(formater.format(rs.getInt("Donated")));
		cam.setDonation(formater.format(rs.getInt("Donations")));
		cam.setImageUrl(rs.getString("Image"));
		cam.setContent(rs.getString("Content"));
		return cam;
				
		
	}
	
		
		
		
	}
	
	
