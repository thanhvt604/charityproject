package com.myproject.service;

import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myproject.DAO.CampaignDAO;
import com.myproject.entity.Campaign;
import com.myproject.entity.CampaignMapper;

@Service
@Transactional
public class CampaignService {
	@Autowired
	CampaignDAO cam;

	public List<Campaign> findAll() {
		return cam.findAll();
	}

	public List<Campaign> pageinCampaign(int index) {
		return cam.pageincampaign(index);
	}

	public List<Campaign> pageinCampaign2(int index) {
		return cam.pageincampaign2(index);
	}

	public List<Campaign> pageinCampaign3(int index) {
		return cam.pageincampaign3(index);
	}
	public List<Campaign> pageinCampaign4(int index) {
		return cam.pageincampaign4(index);
	}
	public List<Campaign> pageinCampaign5(int index) {
		return cam.pageincampaign5(index);
	}

	public void addCampain(Campaign cp) {
		cam.addCampain(cp);
	}

	public Campaign Searchid(String id) {

		return cam.Searchid(id);
	}

	public void update(Campaign cp) {

		cam.updateCampain(cp);
	}

	public void deleteCampaign(String id) {
		cam.deleteCampaign(id);
	}

	public List<Campaign> searchCampaign2(String id) {
		return cam.Searchid2(id);
	}

	public int count() {
		return cam.count();
	}

	public List<Campaign> sortbyss(int index) {
		return cam.sortbyss(index);

	}

	public List<Campaign> sortbyd(int index) {
		return cam.sortbyrole(index);

	}
	public void updatestatus1() {
		
		 cam.updatestatus1();
}
public void updatestatus2(String date) {
		
		cam.updatestatus2(date);
}
public void updatestatus3() {
		cam.updatestatus3();
		
}

}