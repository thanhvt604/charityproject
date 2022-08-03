package com.myproject.controller;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.Map.Entry;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.TransientDataAccessResourceException;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.myproject.entity.Donate;
import com.myproject.entity.Account;
import com.myproject.entity.Campaign;
import com.myproject.service.AccountService;
import com.myproject.service.CampaignService;
import com.myproject.service.DonateService;

@Controller
public class Controll {
	// example for Request Param
	@Autowired
	DataSource dataSource;
	@Autowired
	private CampaignService CampaignService;
	@Autowired
	private AccountService AccountService;
	@Autowired
	private ServletContext sc;
	@Autowired
	private DonateService DonateService;

	// navigate to index
	@RequestMapping(value = { "/index", "/" })
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws UnsupportedEncodingException, MessagingException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		session.removeAttribute("donate");
		List<Campaign> list = new ArrayList<Campaign>();
		
		int num = 1;// num of page
		String a = request.getParameter("num");
		if (a != null) {
			num = Integer.parseInt(a);
		}
		list = CampaignService.pageinCampaign3(num);// 8 campaign in one page
		request.setAttribute("list", list);

		int count = AccountService.count();// count all campaign in sql
		// if page divide eight is odd we need one page to contain
		if (count % 8 == 0) {
			count = (count / 8);
		} else {
			count = (count / 8) + 1;
		}

		// form donate
		String action = request.getParameter("action");

		if (action != null && action.equals("mes")) {
			String email = request.getParameter("email");
			String mes = request.getParameter("message");
			String name = request.getParameter("name");
			final String fromEmail = "charityprojectvt604@gmail.com";
			// your eamil
			final String password = "fcelqasvysmpqdut";
			// dia chi email nguoi nhan
			final String toEmail = "charityprojectvt604@gmail.com";
			final String subject = "Góp ý từ" + email + " , Tên nhà hảo tâm :" + name;
			final String body = "<div style=\"color: darkgray;font-weight:bold\">" + mes + "</div>";
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP Host
			props.put("mail.smtp.port", "587"); // TLS Port
			props.put("mail.smtp.auth", "true"); // enable authentication
			props.put("mail.smtp.starttls.enable", "true"); // enable STARTTLS
			Authenticator auth = new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(fromEmail, password);
				}
			};
			Session sessionx = Session.getInstance(props, auth);
			MimeMessage msg = new MimeMessage(sessionx);
			// set message headers
			msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
			msg.addHeader("format", "flowed");
			msg.addHeader("Content-Transfer-Encoding", "8bit");
			msg.setFrom(new InternetAddress(fromEmail, "CharityProject"));
			msg.setReplyTo(InternetAddress.parse(fromEmail, false));
			msg.setSubject(subject, "UTF-8");
			msg.setContent(body, "text/html; charset=utf-8");

			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
			Transport.send(msg);

		}
		// refresh update status campaign
		String date = java.time.LocalDate.now().toString();
		CampaignService.updatestatus2(date);
		CampaignService.updatestatus3();
		request.setAttribute("count", count);
		return new ModelAndView("index");
	}
	// navigate to manage user

	@RequestMapping(value = { "/manage" })
	public ModelAndView management_user(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam(name = "image", required = false) MultipartFile multipartFile)
			throws MessagingException, UnsupportedEncodingException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		// a is number of page
		int a = 1;
		String id = request.getParameter("id");
		if (id != null) {
			a = Integer.parseInt(id);
		}
		List<Account> listAcc = new ArrayList<Account>();
		// List all account
		listAcc = AccountService.pageinAccount(a);

		// paging
		int count = AccountService.count();
		if (count % 5 == 0) {
			count = (count / 5);
		} else {
			count = (count / 5) + 1;
		}
		// if select see page with 5,10,15 row this will active
		if (request.getParameter("select") != null && request.getParameter("select") != "") {
			count = CampaignService.count();
			int select = Integer.parseInt(request.getParameter("select"));
			if (select == 1) {
				listAcc = AccountService.pageinAccount(a);
				if (count % 5 == 0) {
					count = count / 5;
				} else {
					count = count / 5 + 1;
				}
			}
			if (select == 2) {
				listAcc = AccountService.pageinAccount2(a);
				if (count % 10 == 0) {
					count = count / 10;
				} else {
					count = count / 10 + 1;
				}
			}
			if (select == 3) {
				listAcc = AccountService.pageinAccount3(a);
				if (count % 15 == 0) {
					count = count / 15;
				} else {
					count = count / 15 + 1;
				}
			}
			request.setAttribute("select", select);
		}
		// sort by amount or date
		if (request.getParameter("select2") != null && request.getParameter("select2") != "") {
			count = CampaignService.count();
			int select = Integer.parseInt(request.getParameter("select2"));
			if (select == 1) {
				listAcc = AccountService.pageinAccount4(a);
				if (count % 5 == 0) {
					count = count / 5;
				} else {
					count = count / 5 + 1;
				}
			}
			if (select == 2) {
				listAcc = AccountService.pageinAccount5(a);
				if (count % 5 == 0) {
					count = count / 5;
				} else {
					count = count / 5 + 1;
				}
			}
			request.setAttribute("select2", select);
		}
		request.setAttribute("count", count);
		sc.setAttribute("listA", listAcc);
		// get information in form add
		String action;
		action = request.getParameter("action");
		if (action != null && (action.equals("addu") || action.equals("upu"))) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String role = request.getParameter("role");
			String date = java.time.LocalDate.now().toString();
			String status = request.getParameter("status");
			String phoneNumber = request.getParameter("phone");
			String pass = request.getParameter("pass");
			String image = "boy.jpg";
			if (request.getParameter(pass) != null) {
				pass = request.getParameter(pass);
			}
			String historyStatus = "ON";
			int idz = 0;
			if (request.getParameter("id") != null) {
				idz = Integer.parseInt(request.getParameter("id"));
			}
			// add image
			if (multipartFile.getOriginalFilename() != null && multipartFile.getOriginalFilename() != "") {

				String fileName = multipartFile.getOriginalFilename();
				System.out.println(fileName);

				try {
					image = fileName;
					File file = new File(
							"C:/Users/ADMIN/Desktop/wp/Charity_project/src/main/webapp/resources/images/avatar/"
									+ fileName);

					System.out.println(sc.getRealPath("/") + "image\\" + fileName);
					FileCopyUtils.copy(multipartFile.getBytes(), file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// create random pasword and send to mail
			if (request.getParameter("check") != null) {

				String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
				// create random pass
				String randomPass = RandomStringUtils.random(8, characters);
				final String fromEmail = "charityprojectvt604@gmail.com";
				// your pass word
				final String password = "fcelqasvysmpqdut";
				// email address of receiver 
				final String toEmail = request.getParameter("email");
				final String subject = "Send new Pass";
				final String body = "Your newpassword is : " + randomPass;
				Properties props = new Properties();
				props.put("mail.smtp.host", "smtp.gmail.com"); // SMTP Host
				props.put("mail.smtp.port", "587"); // TLS Port
				props.put("mail.smtp.auth", "true"); // enable authentication
				props.put("mail.smtp.starttls.enable", "true"); // enable STARTTLS
				Authenticator auth = new Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(fromEmail, password);
					}
				};
				Session sessionx = Session.getInstance(props, auth);
				MimeMessage msg = new MimeMessage(sessionx);
				// set message headers
				msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
				msg.addHeader("format", "flowed");
				msg.addHeader("Content-Transfer-Encoding", "8bit");
				msg.setFrom(new InternetAddress(fromEmail, "CharityProject"));
				msg.setReplyTo(InternetAddress.parse(fromEmail, false));
				msg.setSubject(subject, "UTF-8");
				msg.setContent(body, "text/html; charset=utf-8");

				msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
				Transport.send(msg);

				pass = DigestUtils.md5Hex(randomPass).toUpperCase();
			}

			// add account
			if (action.equals("addu")) {
				Account newAccount = new Account(name, email, pass, role, date, status, phoneNumber, image,
						historyStatus);
				AccountService.addAccount(newAccount);
				return new ModelAndView("redirect:manage");

			}
			// update account
			if (action.equals("upu")) {
				if (multipartFile.getOriginalFilename() == null || multipartFile.getOriginalFilename() == "") {
					Account x = new Account();
					x = AccountService.Searchid(Integer.toString(idz));
					image = x.getImageUrl();

				}
				
				Account newAccount = new Account(name, email, pass, role, date, status, phoneNumber, image,
						historyStatus);
				AccountService.updateac(newAccount, idz);
				return new ModelAndView("redirect:manage");
			}

		}
		// delete Account
		if (action != null && action.equals("delete")) {
			boolean z = false;
			for (String o : request.getParameterValues("check")) {
				String x = AccountService.Searchid(o).getRole();
				if (x.equals("Admin")) {
					request.setAttribute("mes1", "Không thể xóa admin");
					z = true;
				}
			}
			for (String u : request.getParameterValues("check")) {
				String i = AccountService.Searchid(u).getStatus();
				if (i.equals("Pending")) {
					request.setAttribute("mes1", "Không thể xóa tài khoản đang hoạt động");
					z = true;
				}
			}
			if (z == false) {
				for (String de : request.getParameterValues("check")) {
					AccountService.deleteAccount(de);
					request.setAttribute("mes1", "Xóa thành công");
				}
			}

		} else {
			request.setAttribute("mes1", "");
		}
		// Search account by name and phonumber
		if (action != null && action.equals("search")) {
			String search = request.getParameter("search");
			List<Account> s = new ArrayList<Account>();
			s = AccountService.searchAccount2(search);
			request.setAttribute("listA", s);

		}
		// update status if pending
		if (action != null && action.equals("updatestatus")) {
			request.getParameter(id);
			AccountService.updateStatusU(id);
			return new ModelAndView("redirect:manage");
		}

		return new ModelAndView("management_user");
	}

	@RequestMapping(value = { "/management_campaign" })
	public ModelAndView management_campaign(HttpServletRequest request, HttpServletResponse response,
			HttpSession session, @RequestParam(name = "image", required = false) MultipartFile multipartFile)
			throws ParseException, UnsupportedEncodingException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		// a is number of page
		int a = 1;
		String id = request.getParameter("id");
		if (id != null) {
			a = Integer.parseInt(id);
		}
		// create list of 5 and 3 campaign in one page
		List<Campaign> list = new ArrayList<Campaign>();
		List<Campaign> list2 = new ArrayList<Campaign>();
		// paging
		int count = CampaignService.count();
		if (count % 5 == 0) {
			count = (count / 5);
		} else {
			count = (count / 5) + 1;
		}

		list = CampaignService.pageinCampaign(a);
		list2 = CampaignService.pageinCampaign2(a);
		// if select see page with 5,10,15 row this will active
		if (request.getParameter("select") != null && request.getParameter("select") != "") {
			count = CampaignService.count();
			int select = Integer.parseInt(request.getParameter("select"));
			if (select == 1) {
				list = CampaignService.pageinCampaign(a);
				if (count % 5 == 0) {
					count = count / 5;
				} else {
					count = count / 5 + 1;
				}
			}
			if (select == 2) {
				list = CampaignService.pageinCampaign4(a);
				if (count % 10 == 0) {
					count = count / 10;
				} else {
					count = count / 10 + 1;
				}
			}
			if (select == 3) {
				list = CampaignService.pageinCampaign5(a);
				if (count % 15 == 0) {
					count = count / 15;
				} else {
					count = count / 15 + 1;
				}
			}
			request.setAttribute("select", select);
		}
		// sort by amount or date
		if (request.getParameter("select2") != null && request.getParameter("select2") != "") {
			count = CampaignService.count();
			int select = Integer.parseInt(request.getParameter("select2"));
			if (select == 1) {
				list = CampaignService.sortbyd(a);
				if (count % 5 == 0) {
					count = count / 5;
				} else {
					count = count / 5 + 1;
				}
			}
			if (select == 2) {
				list = CampaignService.sortbyss(a);
				if (count % 5 == 0) {
					count = count / 5;
				} else {
					count = count / 5 + 1;
				}
			}
			request.setAttribute("select2", select);
		}
		request.setAttribute("count", count);
		request.setAttribute("campaign", list);
		request.setAttribute("campaign2", list2);
		// get information in form add
		String action;
		action = request.getParameter("hi");
		if (action != null && (action.equals("ok") || action.equals("ok2"))) {
			String name = request.getParameter("name");
			String idx = request.getParameter("idx");
			String status = request.getParameter("status");
			String startday = request.getParameter("startday");
			String endday = request.getParameter("endday");
			String target = request.getParameter("target");
			String des = request.getParameter("des");
			String content = request.getParameter("content");
			String image = "momo-upload-api.jpg";
			if (multipartFile.getOriginalFilename() != null && multipartFile.getOriginalFilename() != "") {
				String fileName = multipartFile.getOriginalFilename();
				System.out.println(fileName);
				System.out.println(multipartFile);

				try {
					image = fileName;
					File file = new File(
							"C:/Users/ADMIN/Desktop/wp/Charity_project/src/main/webapp/resources/images/campaign_image/"
									+ fileName);
					for (Campaign p : list2) {
						System.out.println(p.getImageUrl());
					}
					System.out.println(sc.getRealPath("/") + "image\\" + fileName);
					FileCopyUtils.copy(multipartFile.getBytes(), file);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			// add campaign
			if (action.equals("ok")) {
				status = "Chưa bắt đầu";
				Campaign newCampaign = new Campaign(idx, name, status, des, target, startday, endday, image, content);
				CampaignService.addCampain(newCampaign);
				return new ModelAndView("redirect:management_campaign");
			}
			// update campaign
			if (action.equals("ok2")) {
				String donate = request.getParameter("donate");
				if (multipartFile.getOriginalFilename() == null || multipartFile.getOriginalFilename() == "") {
					Campaign x = new Campaign();
					x = CampaignService.Searchid(idx);
					image = x.getImageUrl();
				}
				donate = (donate.replace(".", ""));
				target = (target.replace(".", ""));

				String donation = request.getParameter("donation");
				Campaign newCampaign2 = new Campaign(idx, name, status, des, target, donate, donation, startday, endday,
						image, content);
				CampaignService.update(newCampaign2);
				String date = java.time.LocalDate.now().toString();
				CampaignService.updatestatus1();
				CampaignService.updatestatus2(date);
				CampaignService.updatestatus3();

				return new ModelAndView("redirect:management_campaign");
			}

		}
		// search campaign by id
		String action2;
		action2 = request.getParameter("action");
		if (action2 != null && action2.equals("ok")) {
			String sId = request.getParameter("search");
			List<Campaign> s = new ArrayList<Campaign>();
			s = CampaignService.searchCampaign2(sId);
			request.setAttribute("campaign", s);
		}
		// delete campaign
		if (request.getParameter("check") != null) {
			String[] delete = request.getParameterValues("check");
			boolean z = false;
			for (String o : delete) {
				String x = CampaignService.Searchid(o).getStatus();
				if (x.equals("Đã hoàn thành") || x.equals("Đã kết thúc") || x.equals("Đang thực hiện")
						|| x.equals("Tạm ngưng")) {
					request.setAttribute("mes1", "Không thể xóa chiến dịch đã bắt đầu");
					z = true;
				}
			}

			if (z == false) {
				for (String o : delete) {
					CampaignService.deleteCampaign(o);
					request.setAttribute("mes1", "Xóa thành công");
				}
			}

		} else {
			request.setAttribute("mes1", "");
		}

		return new ModelAndView("management_campaign");
	}

	// check connection
	@RequestMapping(value = "/checkConnection")
	public ModelAndView greet() {

		try {
			if (dataSource.getConnection() != null) {

				return new ModelAndView("index", "msg", "Database Connection Successfully Established.");

			} else {

				return new ModelAndView("index", "msg", "Failed to connect database.");
			}
		} catch (SQLException e) {
			e.printStackTrace();

			return new ModelAndView("index", "msg", "Failed to connect database.");
		}
	}

	// redict to lANdingpage
	@RequestMapping(value = "/info")

	public ModelAndView infomation(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam(name = "image", required = false) MultipartFile multipartFile)
			throws UnsupportedEncodingException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String id2 = request.getParameter("id");
		Account me = new Account();
		// tìm người dùng theo id
		me = AccountService.Searchid(id2);
		request.setAttribute("me", me);

		String action = "";
		action = request.getParameter("action");
		if (action != null && action.equals("repass")) {

			String oldpass = request.getParameter("oldpass");

			String newpass = request.getParameter("newpass");
			String renewpass = request.getParameter("renewpass");
			String mail = request.getParameter("mail");
			Account acc = new Account();
			acc = AccountService.findEmail(mail);
			// change password
			if (!newpass.equals(renewpass)) {
				request.setAttribute("msg", "pass and new pass not match!");
				return new ModelAndView("/changepass");
			}
			String hexpass = DigestUtils.md5Hex(oldpass).toUpperCase();
			if (!hexpass.equals(acc.getPass())) {
				request.setAttribute("msg", "wrong pass!");
				return new ModelAndView("/changepass");
			}
			String hexnewpass = DigestUtils.md5Hex(newpass).toUpperCase();
			AccountService.updatePassAccount(mail, hexnewpass);

		}
		// change Avatar
		if (action != null && action.equals("changeAvatar")) {
			String id = request.getParameter("id");
			String fileName = multipartFile.getOriginalFilename();
			System.out.println(fileName);

			try {
				String image = fileName;
				File file = new File(
						"C:/Users/ADMIN/Desktop/wp/Charity_project/src/main/webapp/resources/images/avatar/"
								+ fileName);

				System.out.println(sc.getRealPath("/") + "image\\" + fileName);
				FileCopyUtils.copy(multipartFile.getBytes(), file);
				AccountService.updateAvatar(image, id);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		// create atribute of you
		me = AccountService.Searchid(id2);
		request.setAttribute("me", me);
		return new ModelAndView("/informationuser");
	}

	// redict to manage donate
	@RequestMapping(value = "/donatemanage")
	public ModelAndView donate(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws UnsupportedEncodingException, ParseException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		// a is number of page
		int a = 1;
		String id = request.getParameter("id");
		if (id != null) {
			a = Integer.parseInt(id);
		}

		// List donate
		List<Donate> listD = new ArrayList<Donate>();

		int count = DonateService.count();
		listD = DonateService.pageinDonate(a);
		if (count % 5 == 0) {
			count = count / 5;
		} else {
			count = count / 5 + 1;
		}
		// if select see page with 5,10,15 row this will active
		if (request.getParameter("select") != null && request.getParameter("select") != "") {
			count = DonateService.count();
			int select = Integer.parseInt(request.getParameter("select"));
			if (select == 1) {
				listD = DonateService.pageinDonate(a);
				if (count % 5 == 0) {
					count = count / 5;
				} else {
					count = count / 5 + 1;
				}
			}
			if (select == 2) {
				listD = DonateService.pageinDonate2(a);
				if (count % 10 == 0) {
					count = count / 10;
				} else {
					count = count / 10 + 1;
				}
			}
			if (select == 3) {
				listD = DonateService.pageinDonate3(a);
				if (count % 15 == 0) {
					count = count / 15;
				} else {
					count = count / 15 + 1;
				}
			}
			request.setAttribute("select", select);
		}
		// sort by amount or date
		if (request.getParameter("select2") != null && request.getParameter("select2") != "") {
			count = DonateService.count();
			int select = Integer.parseInt(request.getParameter("select2"));
			if (select == 1) {
				listD = DonateService.sortbyamount(a);
				if (count % 5 == 0) {
					count = count / 5;
				} else {
					count = count / 5 + 1;
				}
			}
			if (select == 2) {
				listD = DonateService.sortbydate(a);
				if (count % 5 == 0) {
					count = count / 5;
				} else {
					count = count / 5 + 1;
				}
			}

			request.setAttribute("select2", select);
		}
		//search donate by iduser or campaign
		String search = request.getParameter("search");
		if (search != null) {
			listD = DonateService.searchbyid(search);
		}
		sc.setAttribute("count", count);
		sc.setAttribute("listD", listD);
		String action = "";
		action = request.getParameter("action");
		// add donate
		if (action != null && action.equals("addt")) {

			int idUser = Integer.parseInt(request.getParameter("iduser"));
			String idCampaign = request.getParameter("idcampaign");
			int amount = Integer.parseInt(request.getParameter("amount"));
			DecimalFormat formater = new DecimalFormat("###,###,###");
			String amountx = formater.format(amount);
			Date date2 = new Date();
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String datexx = dateFormat.format(date2);
			System.out.println(datexx);
			DonateService.addDonate(new Donate(idUser, amountx, idCampaign, datexx));
		}
		//update
		if (action != null && action.equals("upt")) {
			int idUser = Integer.parseInt(request.getParameter("iduser"));
			String idCampaign = request.getParameter("idcampaign");
			int amount = Integer.parseInt(request.getParameter("amount"));
			DecimalFormat formater = new DecimalFormat("###,###,###");
			String amountx = formater.format(amount);
			String date2 = request.getParameter("date");
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
			String datexx = dateFormat.format(sdf2.parse(date2));
			System.out.println(datexx);
			Donate xx = new Donate(idUser, amountx, idCampaign, datexx);
			try {
				DonateService.updateac(xx, request.getParameter("iduser"), datexx);
			} catch (TransientDataAccessResourceException e) {
				request.setAttribute("error", "CampaignID not exist");
				return new ModelAndView("updatedonate");
			}

		}
		if (action != null && action.equals("delete3")) {
			String check = "";
			check = request.getParameter(check);
			if (request.getParameter("check") != null) {
				Map<String, String> map = new HashMap<String, String>();
				for (String o : request.getParameterValues("check")) {
					map.put(o, request.getParameter("check2"));
				}
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				SimpleDateFormat sdf2 = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");

				for (Entry<String, String> entry : map.entrySet()) {

					System.out.println(entry.getKey() + " " + entry.getValue());

					DonateService.deleteDonate(entry.getKey(), dateFormat.format(sdf2.parse(entry.getValue())));

				}
			}
		}
		return new ModelAndView("/management_donate");
	}

	// redict to view content campaign
	@RequestMapping(value = "/cpdetail")
	public ModelAndView detailcp(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String id = request.getParameter("id");
		if (id != null) {
			Campaign cp = new Campaign();
			cp = CampaignService.Searchid(id);
			request.setAttribute("Campaign", cp);
			List<Donate> dd = new ArrayList<Donate>();
			dd = DonateService.findAll2(id);
			request.setAttribute("Donate", dd);
			List<Account> lista = new ArrayList<>();
			lista = AccountService.findAll();
			session.setAttribute("id2", id);
			request.setAttribute("Acc", lista);

		}

		return new ModelAndView("campaigndetail");
	}

	// redict to landingpage change info
	@RequestMapping(value = "/changeinfo")
	public ModelAndView changeinfo(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws UnsupportedEncodingException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String id2 = request.getParameter("id");
		Account me = new Account();
		me = AccountService.Searchid(id2);
		request.setAttribute("me", me);

		String action = "";
		action = request.getParameter("action");
		if (action != null && action.equals("ok")) {
			String id = request.getParameter("id");
			System.out.println(id);
			String name = request.getParameter("user");
			String sdt = request.getParameter("sdt");

			AccountService.updateLanding(name, sdt, id);
		}
		me = AccountService.Searchid(id2);
		request.setAttribute("me", me);

		return new ModelAndView("changeinfo");

	}

	// page view Donated campaign history
	@RequestMapping(value = "/history")
	public ModelAndView History(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		String id = request.getParameter("id");
		List<Donate> list = new ArrayList<Donate>();
		list = DonateService.searchbyid2(id);
		request.setAttribute("list", list);
		List<Campaign> list2 = new ArrayList<Campaign>();
		list2 = CampaignService.findAll();
		request.setAttribute("list2", list2);
		Account x = new Account();
		// change status history
		String action = request.getParameter("action");
		if (action != null && action.equals("changestatush")) {
			String status = request.getParameter("status");
			System.out.println(status);
			System.out.println(id);
			
			if (status.equals("ON")) {
				AccountService.updatestatushistory("OFF", id);
			}
			if (status.equals("OFF")) {
				AccountService.updatestatushistory("ON", id);
			}

		}
		x = AccountService.Searchid(id);
		request.setAttribute("ac", x);

		return new ModelAndView("History");

	}

}