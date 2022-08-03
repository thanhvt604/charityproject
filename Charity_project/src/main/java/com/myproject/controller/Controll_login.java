package com.myproject.controller;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.myproject.entity.Account;
import com.myproject.service.AccountService;
import com.myproject.entity.Campaign;
import com.myproject.service.CampaignService;

@Controller
public class Controll_login {
	@Autowired
	DataSource dataSource;
	@Autowired
	private AccountService AccountService;
	@Autowired
	private CampaignService CampaignService;

	// navigate to register
	@RequestMapping(value = { "/register" })
	public ModelAndView showForm(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		return new ModelAndView("register");
	}
	// navigate to login

	@RequestMapping(value = { "/login" })
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws MessagingException, UnsupportedEncodingException {
		String action;
		action = request.getParameter("action");
		//update status campaign
		String date = java.time.LocalDate.now().toString();
		CampaignService.updatestatus2(date);
		CampaignService.updatestatus3();
		session.setMaxInactiveInterval(20 * 60);
		request.setAttribute("msg", "");
		if (action != null && action.equals("ok")) {
			String username = request.getParameter("username");
			String pass = request.getParameter("pass");
			String hexpass = DigestUtils.md5Hex(pass).toUpperCase();
			Account login = new Account();
			try {
				login = AccountService.findEmail(username);
			} catch (EmptyResultDataAccessException e) {
				// TODO: handle exception
				request.setAttribute("msg", "Email không tồn tại !");
				return new ModelAndView("login");
			}

			if (login.getMail().equals(username) && login.getPass().equals(hexpass)) {
				if (login.getRole().equals("Admin")) {
					Account admin = new Account();
					admin = AccountService.findEmail(login.getMail());
					session.setAttribute("sessionUser", admin);
					return new ModelAndView("redirect:manage");
				}
				if (login.getRole().equals("User")) {
					Account user = new Account();
					user = AccountService.findEmail(login.getMail());
					session.setAttribute("sessionUser", user);
					return new ModelAndView("redirect:index");
				}
			}
			if (login.getMail().equals(username) && !login.getPass().equals(hexpass)) {
				request.setAttribute("msg", "Mật khẩu không đúng");
				return new ModelAndView("login");
			}

		}
		// repassword
		if (action != null && action.equals("repassw")) {

			String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
			// create random pass
			String randomPass = RandomStringUtils.random(8, characters);
			final String fromEmail = "charityprojectvt604@gmail.com";
			// your password email
			final String password = "fcelqasvysmpqdut";
			// email address of user
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
			msg.setText(body, "UTF-8");
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
			Transport.send(msg);
			// password convert to md5
			String pass2 = DigestUtils.md5Hex(randomPass).toUpperCase();
			AccountService.updatePassAccount(toEmail, pass2);
		}

		// register account
		if (action != null && action.equals("createAccount")) {
			
			String image="boy.jpg";
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String role = "User";
			 date = java.time.LocalDate.now().toString();
			System.out.println(date);
			String phoneNumber = request.getParameter("phone");
			String status = "Active";
			String historyStatus="ON";
			// random string
			String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
			// create random pass
			String randomPass = RandomStringUtils.random(8, characters);
			final String fromEmail = "charityprojectvt604@gmail.com";
			// your password email
			final String password = "fcelqasvysmpqdut";
			// email address of user
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
			msg.setText(body, "UTF-8");
			msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail, false));
			Transport.send(msg);
			// password convert to md5
			String pass2 = DigestUtils.md5Hex(randomPass).toUpperCase();

			Account newAccount = new Account(name, email, pass2, role, date, status, phoneNumber,image,historyStatus);
			// create account
			try {
			AccountService.addAccount(newAccount);}
			catch (DuplicateKeyException e) {
				// TODO: handle exception
				request.setAttribute("x", "Tài khoản này đã tồn tại trong hệ thống");
				return new ModelAndView("register");
			}
		}

		return new ModelAndView("login");
	}

	@RequestMapping(value = { "/changepass" })
	public ModelAndView repass(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		return new ModelAndView("changepass");
	}

	@RequestMapping(value = { "/forgotpass" })
	public ModelAndView forgotpass(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		return new ModelAndView("Forgotpass");
	}

	@RequestMapping(value = { "/logout" })
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		session.invalidate();
		return new ModelAndView("login");
	}
}
