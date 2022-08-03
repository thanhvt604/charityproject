package com.myproject.entity;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.jdbc.core.RowMapper;

public class DonateMapper implements RowMapper<Donate>{
	
	public Donate mapRow(ResultSet rs ,int rownum) throws SQLException
	{
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");	
		
		DecimalFormat formater=new DecimalFormat("###,###,###");
		
		Donate d = new Donate();
		d.setUserId(rs.getInt("User_ID"));
		d.setCampaignId(rs.getString("Campaign_id"));
		d.setAmount(formater.format(rs.getInt("Amount")));
		try {
			d.setDate(sdf.format(sdf2.parse(rs.getString("Datetime_Donate"))));
		} catch (ParseException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return d;
	}
		
	}
	
		
		
		
	
