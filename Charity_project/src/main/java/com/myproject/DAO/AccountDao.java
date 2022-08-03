package com.myproject.DAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.myproject.entity.Account;
import com.myproject.entity.AccountMapper;
import com.myproject.entity.Campaign;
import com.myproject.entity.CampaignMapper;

@Repository
@Transactional
public class AccountDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	// find all Account
	public List<Account> findAll() {
		String sql = "SELECT * FROM Account";
		return jdbcTemplate.query(sql, new AccountMapper());
	}

	// set 5 Account in one page
	public List<Account> pageinAccount(int index) {
		String sql = "SELECT * FROM Account\r\n" + "ORDER BY User_id\r\n" + "OFFSET " + ((index - 1) * 5) + " ROWS\r\n"
				+ "FETCH NEXT 5 ROWS ONLY\r\n" + "";

		return jdbcTemplate.query(sql, new AccountMapper());

	}

	// set 10 Account in one page
	public List<Account> pageinAccount2(int index) {
		String sql = "SELECT * FROM Account\r\n" + "ORDER BY User_id\r\n" + "OFFSET " + ((index - 1) * 5) + " ROWS\r\n"
				+ "FETCH NEXT 10 ROWS ONLY\r\n" + "";

		return jdbcTemplate.query(sql, new AccountMapper());

	}

	// set 15 Account in one page
	public List<Account> pageinAccount3(int index) {
		String sql = "SELECT * FROM Account\r\n" + "ORDER BY User_id\r\n" + "OFFSET " + ((index - 1) * 5) + " ROWS\r\n"
				+ "FETCH NEXT 15 ROWS ONLY\r\n" + "";

		return jdbcTemplate.query(sql, new AccountMapper());

	}

	// sort by role
	public List<Account> pageinAccount4(int index) {
		String sql = "SELECT * FROM Account\r\n" + "ORDER BY User_role\r\n" + "OFFSET " + ((index - 1) * 5)
				+ " ROWS\r\n" + "FETCH NEXT 5 ROWS ONLY\r\n" + "";

		return jdbcTemplate.query(sql, new AccountMapper());

	}

	// sort by status
	public List<Account> pageinAccoun5t(int index) {
		String sql = "SELECT * FROM Account\r\n" + "ORDER BY User_status\r\n" + "OFFSET " + ((index - 1) * 5)
				+ " ROWS\r\n" + "FETCH NEXT 5 ROWS ONLY\r\n" + "";

		return jdbcTemplate.query(sql, new AccountMapper());

	}

	// add Account
	public void addAccount(Account cp) {
		String sql = "INSERT INTO Account VALUES(?,?,?,?,?,?,?,?,?)";
		jdbcTemplate.update(sql, cp.getName(), cp.getMail(), cp.getPass(), cp.getRole(), cp.getDateJoin(),
				cp.getStatus(), cp.getPhoneNumber(), cp.getImageUrl(), cp.getHistorystatus());

	}

	// search Account by id
	public Account Searchid(String id) {
		String sql = "SELECT * FROM Account WHERE User_id =?";
		return jdbcTemplate.queryForObject(sql, new AccountMapper(), id);
	}

	// search by search bar
	public List<Account> Searchid2(String id) {
		String sql = "SELECT * FROM Account WHERE User_phone=? OR User_name=?";
		return jdbcTemplate.query(sql, new AccountMapper(), id, id);
	}

	// update Account Avatar
	public void updateAvatar(String image, String id) {
		String sql = "UPDATE Account\r\n" + "SET User_image=? \r\n" + "WHERE User_id=?";
		jdbcTemplate.update(sql, image, id);
	}

	// set user_status id pending
	public void updatePendingStatus(String id) {
		String sql = "UPDATE Account\r\n" + "SET User_status='Pending' \r\n" + "WHERE User_id=?";
		jdbcTemplate.update(sql, id);
	}

	// update status history
	public void updatestatushistory(String status, String id) {
		String sql = "UPDATE Account\r\n" + "SET History_status=? \r\n" + "WHERE User_id=?";
		jdbcTemplate.update(sql, status, id);
	}

	// update Account phonenumber and name
	public void updateLanding(String name, String phone, String id) {
		String sql = "UPDATE Account\r\n" + "SET User_name=?,User_phone=? \r\n" + "WHERE User_id=?";
		jdbcTemplate.update(sql, name, phone, id);
	}

	// update Account
	public void updateAccount(Account cp, int id) {
		String sql = "UPDATE Account\r\n"
				+ "SET User_name=?,User_mail=?,User_pass=?,User_role=?,Date_join=?,User_status=?,User_phone=?,User_image=?,History_status=? \r\n"
				+ "WHERE User_id=?";
		jdbcTemplate.update(sql, cp.getName(), cp.getMail(), cp.getPass(), cp.getRole(), cp.getDateJoin(),
				cp.getStatus(), cp.getPhoneNumber(), cp.getImageUrl(), cp.getHistorystatus(), id);
	}

	// change status
	public void updateStatusAccount(String id) {
		String sql = "UPDATE Account\r\n" + "SET User_status='NoActive' \r\n" + "WHERE User_id=?";
		jdbcTemplate.update(sql, id);
	}

	// delete element by id
	public void deleteAccount(String id) {
		String sql = "DELETE FROM Account WHERE User_id=?";
		jdbcTemplate.update(sql, id);
	}

	// reset pass for forgot pass user
	public void updatePassAccount(String email, String pass) {
		String sql = "UPDATE Account\r\n" + "SET User_pass=? \r\n" + "WHERE User_mail=?";
		jdbcTemplate.update(sql, pass, email);
	}

	// count account
	public int count() {
		String sql = "SELECT Count(*) FROM Account";
		return jdbcTemplate.queryForObject(sql, new Object[] {}, Integer.class);
	}
	// find account by email
	public Account findEmail(String email) {
		String sql = "SELECT* FROM Account WHERE User_mail=?";
		return jdbcTemplate.queryForObject(sql, new AccountMapper(), email);
	}

}
