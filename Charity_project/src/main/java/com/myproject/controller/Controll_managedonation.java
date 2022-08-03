package com.myproject.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.myproject.entity.Donate;
import com.myproject.service.DonateService;
@Controller
public class Controll_managedonation {
	@Autowired
	private DonateService DonateService;

	@RequestMapping(value = {"/adddonate"})
	public ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		return new ModelAndView("adddonation");
	}

	
	@RequestMapping(value = {"/updatedonate" })
	public ModelAndView showFormx(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ParseException {
		String id;
		id = request.getParameter("id");
		String datetime=request.getParameter("datetime");
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");	
		datetime=sdf2.format(sdf.parse(datetime));
		Donate find = new Donate();
		if (id!= null) {
			find = DonateService.Searchid(id,datetime);
			request.setAttribute("item", find);
		}

		return new ModelAndView("updatedonate");
	}
	
	
}
