package com.myproject.entity;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.springframework.jdbc.core.RowMapper;

public class AccountMapper implements RowMapper<Account>{
	
	public Account mapRow(ResultSet rs ,int rownum) throws SQLException
	{
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		
		Account acc = new Account();
		acc.setId(rs.getInt("User_id"));
		acc.setName(rs.getString("User_name"));
		acc.setMail(rs.getString("User_mail"));
		acc.setPass(rs.getString("User_pass"));
		try {
			acc.setDateJoin(sdf.format(sdf2.parse(rs.getString("Date_join"))));
		} catch (ParseException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		acc.setRole(rs.getString("User_role"));
		acc.setStatus(rs.getString("User_status"));
		acc.setPhoneNumber(rs.getString("User_phone"));
		acc.setImageUrl(rs.getString("User_image"));
		acc.setHistorystatus(rs.getString("History_status"));
		return acc;
				
		
	}
}