package com.myproject.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myproject.DAO.AccountDao;
import com.myproject.entity.Account;
import com.myproject.entity.AccountMapper;



@Service
@Transactional
public class AccountService {
	@Autowired
	AccountDao acc;

	public List<Account> findAll() {
		return acc.findAll();
	}

	public List<Account> pageinAccount(int index) {
		return acc.pageinAccount(index);
	}
	public List<Account> pageinAccount2(int index) {
		return acc.pageinAccount2(index);
	}
	public List<Account> pageinAccount3(int index) {
		return acc.pageinAccount3(index);
	}
	public List<Account> pageinAccount4(int index) {
		return acc.pageinAccount4(index);
	}
	public List<Account> pageinAccount5(int index) {
		return acc.pageinAccoun5t(index);
	}



	public void addAccount(Account cp) {
		acc.addAccount(cp);
	}

	public Account Searchid(String id) {

		return acc.Searchid(id);
	}

	public void updateac(Account cp,int id) {

		acc.updateAccount(cp,id);
	}

	public void deleteAccount(String id) {
		acc.deleteAccount(id);
	}

	public List<Account> searchAccount2(String id) {
		return acc.Searchid2(id);
	}
	public void updateStatusU(String id) {
		acc.updateStatusAccount(id);
	}
	public int count() {
		return acc.count();
	}
	public Account findEmail(String email)
	{
		return acc.findEmail(email);
	}
	public void updatePassAccount(String email, String pass) {
		acc.updatePassAccount(email, pass);
		
	}
	public void updateAvatar(String image,String id) {
		acc.updateAvatar(image,id);
	}
	public void updateLanding(String name,String phone, String id) {
		acc.updateLanding(name, phone, id);
	}
	public void updatestatushistory(String status,String id) {
		 acc.updatestatushistory(status, id);
	}
	public void updatePendingStatus(String id) {
		acc.updatePendingStatus(id);
	}
}
