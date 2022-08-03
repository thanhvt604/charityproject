package com.myproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myproject.DAO.DonateDao;
import com.myproject.entity.Donate;
import com.myproject.entity.DonateMapper;

@Service
@Transactional
public class DonateService {
	@Autowired
	DonateDao d;

	public List<Donate> findAll() {
		return d.findAll();
	}

	public List<Donate> pageinDonate(int index) {
		return d.pageinDonate(index);
	}

	public List<Donate> pageinDonate2(int index) {
		return d.page2inDonate(index);
	}

	public List<Donate> pageinDonate3(int index) {
		return d.page3inDonate(index);
	}

	public void addDonate(Donate cp) {
		d.addDonate(cp);
	}

	public Donate Searchid(String id, String datetime) {

		return d.Searchid(id, datetime);
	}

	public void updateac(Donate cp, String id, String date) {

		d.updateDonate(cp, id, date);
	}

	public void deleteDonate(String id, String datetime) {
		d.deleteDonate(id, datetime);
	}

	public int count() {
		return d.count();
	}

	public List<Donate> searchDonate2(String id) {
		return d.Searchid2(id);
	}

	public List<Donate> searchbyid(String id) {
		return d.searchbyid(id);
	}

	public List<Donate> findAll2(String x) {
		return d.findAll2(x);
	}

	public List<Donate> sortbyamount(int index) {
		return d.sortbyamount(index);

	}

	public List<Donate> sortbydate(int index) {
		return d.sortbydate(index);

	}
	public List<Donate> searchbyid2(String index) {
		return d.searchbyid2(index);

	}	

}
