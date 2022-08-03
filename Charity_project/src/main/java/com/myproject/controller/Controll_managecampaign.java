package com.myproject.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.myproject.entity.Campaign;
import com.myproject.service.*;

@Controller
public class Controll_managecampaign{
	
	// navigate to add campaign
	@Autowired
	private CampaignService CampaignService;
	
	
	@RequestMapping(value={"/addcampaign"})
    public ModelAndView showForm(HttpServletRequest request ,HttpServletResponse response,HttpSession session) throws UnsupportedEncodingException
    		 {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
			
			return new ModelAndView("addcampaign");
    }
	
	@RequestMapping(value={"/updatecampaign"})
    public ModelAndView showFormx(HttpServletRequest request ,HttpServletResponse response,HttpSession session) throws UnsupportedEncodingException
    		 {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
	
			String id;
			id=request.getParameter("id");
			Campaign find=new Campaign();
			if(id!=null)
			{
			find=CampaignService.Searchid(id);
			request.setAttribute("item", find);
			}
			return new ModelAndView("updatecampaign");
    }
	 public ModelAndView page(HttpServletRequest request ,HttpServletResponse response,HttpSession session)
	 {
		 	
		 	
		 	return new ModelAndView("addcampaign");
}
	
	
}