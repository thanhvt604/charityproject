
package com.myproject.DAO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.myproject.entity.Campaign;
import com.myproject.entity.CampaignMapper;

@Repository
@Transactional
public class CampaignDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	// find all campaign
	public List<Campaign> findAll() {
		String sql = "SELECT * FROM Campaign";
		return jdbcTemplate.query(sql, new CampaignMapper());
	}

	// sort by status
	public List<Campaign> sortbyss(int index) {
		String sql = "SELECT * FROM CAMPAIGN\r\n" + "ORDER BY Status\r\n" + "OFFSET " + ((index - 1) * 5) + " ROWS\r\n"
				+ "FETCH NEXT 5 ROWS ONLY\r\n" + "";

		return jdbcTemplate.query(sql, new CampaignMapper());

	}

	// sort by startday
	public List<Campaign> sortbyrole(int index) {
		String sql = "SELECT * FROM CAMPAIGN\r\n" + "ORDER BY Start_Date\r\n" + "OFFSET " + ((index - 1) * 5)
				+ " ROWS\r\n" + "FETCH NEXT 5 ROWS ONLY\r\n" + "";

		return jdbcTemplate.query(sql, new CampaignMapper());

	}

	// set 5 campaign in one page
	public List<Campaign> pageincampaign(int index) {
		String sql = "SELECT * FROM CAMPAIGN\r\n" + "ORDER BY CAMPAIGN_ID\r\n" + "OFFSET " + ((index - 1) * 5)
				+ " ROWS\r\n" + "FETCH NEXT 5 ROWS ONLY\r\n" + "";

		return jdbcTemplate.query(sql, new CampaignMapper());

	}

	// set 10 campaign in one page
	public List<Campaign> pageincampaign4(int index) {
		String sql = "SELECT * FROM CAMPAIGN\r\n" + "ORDER BY CAMPAIGN_ID\r\n" + "OFFSET " + ((index - 1) * 5)
				+ " ROWS\r\n" + "FETCH NEXT 10 ROWS ONLY\r\n" + "";

		return jdbcTemplate.query(sql, new CampaignMapper());

	}

	// set 15 campaign in one page
	public List<Campaign> pageincampaign5(int index) {
		String sql = "SELECT * FROM CAMPAIGN\r\n" + "ORDER BY CAMPAIGN_ID\r\n" + "OFFSET " + ((index - 1) * 5)
				+ " ROWS\r\n" + "FETCH NEXT 15 ROWS ONLY\r\n" + "";

		return jdbcTemplate.query(sql, new CampaignMapper());

	}

	// set 5 campaign in one page
	public List<Campaign> pageincampaign3(int index) {
		String sql = "SELECT * FROM CAMPAIGN\r\n" + "ORDER BY CAMPAIGN_ID\r\n" + "OFFSET " + ((index - 1) * 8)
				+ " ROWS\r\n" + "FETCH NEXT 8 ROWS ONLY\r\n" + "";

		return jdbcTemplate.query(sql, new CampaignMapper());

	}

	// set 3 campaign in one page
	public List<Campaign> pageincampaign2(int index) {
		String sql = "SELECT * FROM CAMPAIGN\r\n" + "ORDER BY CAMPAIGN_ID\r\n" + "OFFSET " + ((index - 1) * 3)
				+ " ROWS\r\n" + "FETCH NEXT 3 ROWS ONLY\r\n" + "";

		return jdbcTemplate.query(sql, new CampaignMapper());

	}

	// add campaign
	public void addCampain(Campaign cp) {
		String sql = "INSERT INTO Campaign VALUES(?,?,?,?,?,?,?,0,0,?,?)";
		jdbcTemplate.update(sql, cp.getId(), cp.getName(), cp.getStatus(), cp.getStartDay(), cp.getEndDay(),
				cp.getTarget(), cp.getDes(), cp.getImageUrl(), cp.getContent());
	}

	// search campaign by id
	public Campaign Searchid(String id) {
		String sql = "SELECT * FROM Campaign WHERE campaign_id =?";
		return jdbcTemplate.queryForObject(sql, new CampaignMapper(), id);
	}
	// search list campaign by id
	public List<Campaign> Searchid2(String id) {
		String sql = "SELECT * FROM Campaign WHERE campaign_id =?";
		return jdbcTemplate.query(sql, new CampaignMapper(), id);
	}

	// update campaign
	public void updateCampain(Campaign cp) {
		String sql = "UPDATE Campaign\r\n"
				+ "SET Campaign_name = ?,Status=?,Start_Date=?,End_Date=?,Target=?,Description=?,Donated=?,Donations=?,Image=?,Content=?\r\n"
				+ "WHERE Campaign_id=?;";
		jdbcTemplate.update(sql, cp.getName(), cp.getStatus(), cp.getStartDay(), cp.getEndDay(), cp.getTarget(),
				cp.getDes(), cp.getDonate(), cp.getDonation(), cp.getImageUrl(), cp.getContent(), cp.getId());
	}

	// delete element by id
	public void deleteCampaign(String id) {
		String sql = "DELETE FROM Campaign WHERE Campaign_id=?";
		jdbcTemplate.update(sql, id);
	}

	public int count() {
		String sql = "SELECT Count(*) FROM Campaign";
		return jdbcTemplate.queryForObject(sql, new Object[] {}, Integer.class);
	}

	// set status
	public void updatestatus1() {

		String sql = "UPDATE Campaign SET Status=N'Đang thực hiện' Where Donations>0 AND status not in(N'Tạm ngưng',N'Đã kết thúc',N'Đã hoàn thành' ) or status is null";
		jdbcTemplate.update(sql);
	}

	public void updatestatus2(String date) {

		String sql = "UPDATE Campaign SET Status=N'Đã kết thúc' Where End_date<? AND status not in(N'Tạm ngưng' , N'Đã hoàn thành' )  ";
		jdbcTemplate.update(sql, date);
	}

	public void updatestatus3() {

		String sql = "UPDATE Campaign SET Status=N'Đã hoàn thành' Where Donated>=Target";
		jdbcTemplate.update(sql);
	}
}
