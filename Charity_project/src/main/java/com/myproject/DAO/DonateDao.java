package com.myproject.DAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.myproject.entity.Donate;
import com.myproject.entity.DonateMapper;

@Repository
@Transactional
public class DonateDao {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	// find all Donate
	public List<Donate> findAll() {
		String sql = "SELECT * FROM Donate";
		return jdbcTemplate.query(sql, new DonateMapper());
	}
	// find all Donate by id
	public List<Donate> findAll2(String x) {
		String sql = "SELECT * FROM Donate Where Campaign_id=?";
		return jdbcTemplate.query(sql, new DonateMapper(), x);
	}

	// set 5 Donate in one page
	public List<Donate> pageinDonate(int index) {
		String sql = "SELECT * FROM Donate\r\n" + "ORDER BY User_id\r\n" + "OFFSET " + ((index - 1) * 5) + " ROWS\r\n"
				+ "FETCH NEXT 5 ROWS ONLY\r\n" + "";

		return jdbcTemplate.query(sql, new DonateMapper());

	}

	// sort by amount
	public List<Donate> sortbyamount(int index) {
		String sql = "SELECT * FROM Donate\r\n" + "ORDER BY amount\r\n" + "OFFSET " + ((index - 1) * 5) + " ROWS\r\n"
				+ "FETCH NEXT 5 ROWS ONLY\r\n" + "";

		return jdbcTemplate.query(sql, new DonateMapper());

	}

	// sort by amount
	public List<Donate> sortbydate(int index) {
		String sql = "SELECT * FROM Donate ORDER BY Datetime_Donate OFFSET " + ((index - 1) * 5)
				+ " ROWS FETCH NEXT 5 ROWS ONLY";

		return jdbcTemplate.query(sql, new DonateMapper());

	}

	// set 10 Donate in one page
	public List<Donate> page2inDonate(int index) {
		String sql = "SELECT * FROM Donate\r\n" + "ORDER BY User_id\r\n" + "OFFSET " + ((index - 1) * 10) + " ROWS\r\n"
				+ "FETCH NEXT 10 ROWS ONLY\r\n" + "";

		return jdbcTemplate.query(sql, new DonateMapper());

	}

	// set 15 Donate in one page
	public List<Donate> page3inDonate(int index) {
		String sql = "SELECT * FROM Donate\r\n" + "ORDER BY User_id\r\n" + "OFFSET " + ((index - 1) * 15) + " ROWS\r\n"
				+ "FETCH NEXT 15 ROWS ONLY\r\n" + "";

		return jdbcTemplate.query(sql, new DonateMapper());

	}

	//search list donate by id user or campaign
	public List<Donate> searchbyid(String index) {
		String sql = "select Cast(User_ID as nvarchar) as User_ID ,Campaign_id,Amount,Datetime_Donate from Donate WHERE  Campaign_id=? OR Cast(User_ID as nvarchar)=?";
		return jdbcTemplate.query(sql, new DonateMapper(), index, index);

	}
	//search list donate by id user or campaign and datetime 
	public List<Donate> searchbyid2(String index) {
		String sql = "select Cast(User_ID as nvarchar) as User_ID ,Campaign_id,Amount,Datetime_Donate from Donate WHERE  Campaign_id=? OR Cast(User_ID as nvarchar)=? Order by Datetime_Donate DESC";
		return jdbcTemplate.query(sql, new DonateMapper(), index, index);

	}

	// add Donate
	public void addDonate(Donate d) {
		String sql = "INSERT INTO Donate VALUES(?,?,?,?)";
		jdbcTemplate.update(sql, d.getUserId(), d.getCampaignId(), d.getAmount(), d.getDate());

	}

	// search Donate by id
	public Donate Searchid(String id, String datetime) {
		String sql = "SELECT * FROM Donate WHERE User_ID =? AND Datetime_Donate=?";
		return jdbcTemplate.queryForObject(sql, new DonateMapper(), id, datetime);
	}

	// search by search bar
	public List<Donate> Searchid2(String id) {
		String sql = "SELECT * FROM Donate WHERE User_ID=? OR Campaign_=?";
		return jdbcTemplate.query(sql, new DonateMapper(), id, id);
	}

	// update Donate
	public void updateDonate(Donate d, String id, String date) {
		String sql = "UPDATE Donate\r\n" + "SET User_ID=?,Campaign_id=?,Amount=? \r\n"
				+ "WHERE User_ID=? AND Datetime_Donate=?";
		jdbcTemplate.update(sql, d.getUserId(), d.getCampaignId(), d.getAmount(), id, date);
	}

	// delete element by id
	public void deleteDonate(String id, String datetime) {
		String sql = "DELETE FROM Donate WHERE User_ID=? AND Datetime_Donate=?";
		jdbcTemplate.update(sql, id, datetime);
	}

	// count Donate
	public int count() {
		String sql = "SELECT Count(*) FROM Donate";
		return jdbcTemplate.queryForObject(sql, new Object[] {}, Integer.class);
	}

}
