package com.myproject.paypal;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payment;
import com.paypal.base.rest.PayPalRESTException;
import com.myproject.DAO.DonateDao;
import com.myproject.entity.Donate;
import com.myproject.entity.Account;
import com.myproject.service.DonateService;
import com.myproject.service.CampaignService;
import com.myproject.service.AccountService;

@Controller
public class PaymentController {
	@Autowired
	private CampaignService CampaignService;
	@Autowired
	private DonateService DonateService;
	@Autowired
	private AccountService AccountService;
	public static final String URL_PAYPAL_SUCCESS = "pay/success";
	public static final String URL_PAYPAL_CANCEL = "pay/cancel";
	private Logger log = LoggerFactory.getLogger(getClass());
	@Autowired
	private PaypalService paypalService;

	@GetMapping("/x")
	public String index() {
		return "index";
	}

	@PostMapping("/pay")
	public String pay(HttpServletRequest request, @RequestParam("price") double price,@RequestParam("action") String action,HttpSession session) {
		String cancelUrl = Utils.getBaseURL(request) + "/" + URL_PAYPAL_CANCEL;
		String successUrl = Utils.getBaseURL(request) + "/" + URL_PAYPAL_SUCCESS;
		
		
		
		if (action != null && action.equals("ok")) {
			int id = Integer.parseInt(request.getParameter("iduser"));
			String id2 = request.getParameter("idcp");
			if(request.getParameter("idcps")!=null)
			{
				id2=request.getParameter("idcps");
			}
			String amount = request.getParameter("price");
			Date date2 = new Date();
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String datexx = dateFormat.format(date2);
			Donate x=new Donate();
			x=new Donate(id, id2,amount, datexx);
			System.out.println(id2);
			 session.setAttribute("donate",x);
			 System.out.println();
			 

		}
		try {
			Donate y=new Donate();
			y=(Donate) session.getAttribute("donate");
			System.out.println(y);
			DonateService.addDonate(y);
			AccountService.updatePendingStatus( Integer.toString(y.getUserId()));
			CampaignService.updatestatus1();
			System.out.println(Integer.toString(y.getUserId()));
			price=price/23000;
			Payment payment = paypalService.createPayment(price, "USD", PaypalPaymentMethod.paypal,
					PaypalPaymentIntent.sale, "payment description", cancelUrl, successUrl);
			for (Links links : payment.getLinks()) {
				if (links.getRel().equals("approval_url")) {
					return "redirect:" + links.getHref();
				}
			}
			
		} catch (PayPalRESTException e) {
			log.error(e.getMessage());
		}
		return "redirect:/";
	}

	@GetMapping(URL_PAYPAL_CANCEL)
	public String cancelPay() {
		return "cancel";
	}

	@GetMapping(URL_PAYPAL_SUCCESS)
	public String successPay(@RequestParam("paymentId") String paymentId, @RequestParam("PayerID") String payerId,HttpServletRequest request, HttpServletResponse response,HttpSession session) {
		try {
			
			
			Payment payment = paypalService.executePayment(paymentId, payerId);
			if (payment.getState().equals("approved")) {
				
				
				
				return "success";
			}
		} catch (PayPalRESTException e) {
			log.error(e.getMessage());
		}
		
		return "redirect:/";
	}
}
