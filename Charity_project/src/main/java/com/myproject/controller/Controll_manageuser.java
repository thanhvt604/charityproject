package com.myproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.myproject.entity.Account;
import com.myproject.entity.Campaign;
import com.myproject.service.AccountService;

@Controller
public class Controll_manageuser {
	// example for Request Param
	@Autowired
	private AccountService AccountService;

	// navigate to add user manage
	@RequestMapping(value = { "/adduser" })
	public ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		return new ModelAndView("adduser");
	}


	// navigate to update user manage
	@RequestMapping(value = { "/updateuser" })
	public ModelAndView showFormx(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String id;
		id = request.getParameter("id");
		
		Account find = new Account();
		if (id != null) {
			find = AccountService.Searchid(id);
			request.setAttribute("item", find);
		}

		return new ModelAndView("updateuser");
	}
	
	@RequestMapping(value = { "/information" })
	public ModelAndView informationUser(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		
		

		return new ModelAndView("informationuser");
	}
}