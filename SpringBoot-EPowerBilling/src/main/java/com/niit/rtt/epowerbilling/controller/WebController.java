package com.niit.rtt.epowerbilling.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.rtt.epowerbilling.model.*;
import com.niit.rtt.epowerbilling.service.*;

@Controller
public class WebController {
	@Autowired
	BillService bservice;
	
	@Autowired
	LoginUserService loginService;
	
	@Autowired
	ConnectionService conService;
	
	
	
	@RequestMapping("/")
	public String viewHomePage()
	{	
		return "index";
	}
	
	
	
	
	@RequestMapping("/loginPage")
	public String showFormForLogin(ModelMap theModel) {
		//LoginUser theUser=new LoginUser();
		//theModel.addAttribute("user",theUser);
		return "login";
		
	}
	
	
	
	@RequestMapping("/regForm")
	public String showFormForAdd(ModelMap theModel) {
		User theUser=new User();
		theModel.addAttribute("user",theUser);
		return"registration";
	}
	
	
	
	@RequestMapping("/connDetails")
	public String viewConnDetailsPage(ModelMap theModel)
	{	ConnectionDetails theConn=new ConnectionDetails();
		theModel.addAttribute("conn", theConn);
		return "connectionDetails";
	}
	
	
	
	@RequestMapping("/billDetails")
	public String viewBillDetailsPage(ModelMap theModel)
	{	BillDetails theBill=new BillDetails();
		theModel.addAttribute("bill", theBill);
		return "billDetails";
	}
	
	
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	   public String index() {
		return "redirect:/";
	   }
	
	
	
	@RequestMapping(value="/updatePassword", method = RequestMethod.GET)
	public String showUpdatePasswordpage(@RequestParam("email") String email,ModelMap theModel)
	{
		User user=new User();
		user=loginService.checkUser(email);
		theModel.addAttribute("user", user);
		return "change-password";
	}
	
	@RequestMapping(value="/logedInHome",method = RequestMethod.GET)
	public ModelAndView showHomePage(@RequestParam("email") String email)
	{
		ModelAndView mav=null;
		User u=loginService.checkUser(email);
		int uid=u.getuId();	
		
		ConnectionDetails con=conService.fetchConnectionDetails(uid);
		
		BillDetails userBill= bservice.fetchBillById(uid,"unpaid");
	
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
		return mav;
		
	}
	@RequestMapping(value="/update-password",method = RequestMethod.POST)
	public ModelAndView showUpdatePassword(HttpServletRequest req,@ModelAttribute("user") User user1)
	{
		String email=req.getParameter("email");
		ModelAndView mav=null;
		User user= new User(); 
		user=loginService.checkUser(email);
		int id=user.getuId();
		System.out.println("id :"+id);
		String oldPass=req.getParameter("oldPassword");
		String newPass=req.getParameter("newPassword");
		System.out.println("old Pass");
		user=loginService.find(id);
		String msg="Password Updated";
		String errorMsg="wrong Password";
		if(id==user.getuId()&&oldPass.equals(user.getPassword())) {
			mav=new ModelAndView("change-password");
			user.setPassword(newPass);
			loginService.save(user);
			mav.addObject("msg",msg);
		}
		
		else {
			mav=new ModelAndView("change-password");
			mav.addObject(errorMsg, errorMsg);
			
		}
		return mav;
		
	
	}
	
	

	@GetMapping("/logout")
	 public String logout(HttpServletRequest req) {
	  req.getSession().invalidate();
	  return "index";
	 }
	
	
	
	
	@RequestMapping(value = "/bill-list", method = RequestMethod.GET)
	public String showBillList(@RequestParam("email") String email, @RequestParam("conId") String conId, Model theModel) {
		
		User user=loginService.checkUser(email);
		
		theModel.addAttribute("user", user);
		
		theModel.addAttribute("conId",conId);
		
		int uid= user.getuId();
		List<BillDetails> list= bservice.fetchBillDetails(uid);
		theModel.addAttribute("billList", list);
		
		
		 return "user-bills";
	}
	
	
	
	
	@GetMapping("/admin")
	 public String admin() {
	  
	  return "admin";
	 }
	
	
	
	@RequestMapping(value="/paymentPage", method = RequestMethod.GET)
	public String showPaymentPage(@RequestParam("email") String email,@RequestParam("billId") String billId,ModelMap theModel)
	{
		User user=new User();
		user=loginService.checkUser(email);
		if(billId==null) {
		
		int id=Integer.parseInt(billId);
		BillDetails bill=bservice.fetchBill(id);
		System.out.println(bill);
		user=loginService.checkUser(email);
		theModel.addAttribute("user", user);
		theModel.addAttribute("bill", bill);
		return "payment";
	}else {
		theModel.addAttribute("user", user);
		
		return "paid-home";
	}
	}
	

	
	
}
	

