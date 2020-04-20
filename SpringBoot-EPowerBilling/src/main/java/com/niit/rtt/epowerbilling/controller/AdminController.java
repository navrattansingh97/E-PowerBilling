package com.niit.rtt.epowerbilling.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.niit.rtt.epowerbilling.model.*;
import com.niit.rtt.epowerbilling.service.*;

@Controller
public class AdminController {

	@Autowired
	private BillService bService;
	
	@Autowired
	private ConnectionService cService;
	
	@Autowired
	private LoginUserService lService;
	
	@RequestMapping(value = "/saveBill", method = RequestMethod.POST)
	public String saveBill(HttpServletRequest req,@ModelAttribute("bill") BillDetails theBill) {
		int id=Integer.parseInt(req.getParameter("connectionId"));
		int Userid=Integer.parseInt(req.getParameter("userId"));
		User u=lService.find(Userid);
		
		ConnectionDetails con=cService.checkConn(id);
		con.setConnectionId(id);
		theBill.setUser(u);
		theBill.setConnection(con);
	    bService.save(theBill);
	     
	    return "billDetails";
	}
	@RequestMapping(value = "/saveConn", method = RequestMethod.POST)
	public ModelAndView saveConn(HttpServletRequest req,@ModelAttribute("bill") ConnectionDetails theConn) {
		//int id=Integer.parseInt(req.getParameter("connectionId"));
		int Userid=Integer.parseInt(req.getParameter("userId"));
	
		User u=lService.find(Userid);
		
		//u.setuId(Userid);
		theConn.setUser(u);
		//ConnectionDetails con=cService.checkConn(id);
		
		ModelAndView mav=null;
		 cService.save(theConn);
		 mav= new ModelAndView("connectionDetails");
		/*if(con==null)
		{
			
				//mav.addObject("error", "User Doesn't Exists");
			
		}
		else
		{
			mav= new ModelAndView("connectionDetails");
			mav.addObject("error", "User Doesn't Exists");
		}
	   
	     */
	    return mav;
	}
	@RequestMapping(value="/save" ,method=RequestMethod.POST)
	public String saveUser(@ModelAttribute("user") User user)
	{
		lService.save(user);
		return "redirect:admin";
	}
	
	@RequestMapping(value="/edit")
	public ModelAndView showEditUserPage(@RequestParam("id") int id)
	{
		ModelAndView mav=new ModelAndView("update_user");
		User user=lService.find(id);
		mav.addObject("user", user);
		return mav;
	}
	@RequestMapping("/delete")
	public String delete(@RequestParam("id") int id)
	{
		lService.delete(id);
		return "redirect:loginUser";
	}
}
