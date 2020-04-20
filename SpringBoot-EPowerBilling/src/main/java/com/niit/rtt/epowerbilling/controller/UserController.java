package com.niit.rtt.epowerbilling.controller;

import java.sql.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.rtt.epowerbilling.model.Address;
import com.niit.rtt.epowerbilling.model.BillDetails;
import com.niit.rtt.epowerbilling.model.ConnectionDetails;
import com.niit.rtt.epowerbilling.model.Payment;
import com.niit.rtt.epowerbilling.model.User;
import com.niit.rtt.epowerbilling.service.BillService;
import com.niit.rtt.epowerbilling.service.ConnectionService;
import com.niit.rtt.epowerbilling.service.LoginUserService;
import com.niit.rtt.epowerbilling.service.UserService;


@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private LoginUserService lService;
	@Autowired
	private BillService billService;
	@Autowired
	private ConnectionService conService;

	@RequestMapping(value = "/saveUser", method = RequestMethod.POST)
	public String saveUser(HttpServletRequest req,@ModelAttribute("user") User user) {
		String adl1=req.getParameter("addressLine1");
		String adl2=req.getParameter("addressLine2");
		String city=req.getParameter("city");
		String state=req.getParameter("state");
		String country=req.getParameter("country");
		int pin=Integer.parseInt(req.getParameter("pincode"));
		Address a=new Address();
		a.setAddressLine1(adl1);
		a.setAddressLine2(adl2);
		a.setCity(city);
		a.setCountry(country);
		a.setState(state);
		a.setPincode(pin);
		a.setUser(user);

		userService.save(a);

		return "index";
	}
	@PostMapping("/loginUser")
	public ModelAndView loginDealer(HttpServletRequest req,@ModelAttribute("user") User user) {
		String email=req.getParameter("email");
		String pass=req.getParameter("password");

		StringTokenizer st = new StringTokenizer(email, "@");
		String s2 = st.nextToken();

		ModelAndView mav=null;
		User u = lService.checkUser(email);

		if(u==null) {
			mav= new ModelAndView("login");
			mav.addObject("error", "User Doesn't Exists");
		}
		else if(email.equals("urvashitomar02@gmail.com") && pass.equals("123"))
		{
			req.getSession().setAttribute("user", s2);
			mav = new ModelAndView("admin");
			mav.addObject("user", u);
			List<User> listUser=lService.listAll();
			mav.addObject("listUser", listUser);
		}
		else  if(email.equals(u.getEmail()) && pass.equals(u.getPassword()))
		{
			int uid=u.getuId();
			req.getSession().setAttribute("user", s2);	
			ConnectionDetails con=conService.fetchConnectionDetails(uid);
			
			BillDetails userBill= billService.fetchBillById(uid,"unpaid");
		
			if(userBill==null) 
			{
				mav = new ModelAndView("paid-home");
				mav.addObject("user", u);
				
				
			}
			else {
				mav = new ModelAndView("home");
				mav.addObject("user", u);
				mav.addObject("userBill",userBill);
				mav.addObject("conection",con);
			}
			
			
		} 

		else
		{mav= new ModelAndView("login");
		mav.addObject("error", "Invalid Username or Password");
		}

		return mav;
	}
	@RequestMapping(value = "/savePayment", method = RequestMethod.POST)
	public ModelAndView savePayment(HttpServletRequest req,@ModelAttribute("bill") BillDetails billDetails) {
		String nameOnCard=req.getParameter("cardname");
		String cardNumber=req.getParameter("cardnumber");
		String expMonth=req.getParameter("expmonth");
		String expYear=req.getParameter("expyear");
		String amount=req.getParameter("amount");
		String cvv=req.getParameter("cvv");
		int id=Integer.parseInt(req.getParameter("billId"));
		
		BillDetails bill=billService.fetchBill(id);
		User user=bill.getUser();
		bill.setStatus("paid");
		
		Date date=new Date(System.currentTimeMillis());
		
		bill.setSubmitDate(date);
		
		Payment p=new Payment();
		p.setNameOnCard(nameOnCard);
		p.setCardNumber(cardNumber);
		p.setExpMonth(expMonth);
		p.setExpYear(expYear);
		p.setAmount(amount);
		p.setCvv(cvv);
		p.setBillDetails(bill);

		billService.save(p);
		ModelAndView mav=new ModelAndView("paid-home");
		mav.addObject("user", user);
		return mav;
	}
	
}