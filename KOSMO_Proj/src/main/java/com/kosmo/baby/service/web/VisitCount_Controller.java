package com.kosmo.baby.service.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import com.kosmo.baby.service.impl.ReservationServiceimpl;
import com.kosmo.baby.service.impl.VisitCountDAO;
import com.kosmo.baby.service.impl.VisitCountServiceimpl;


import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;


@Controller
public class VisitCount_Controller{  //implements HttpSessionListener
	
	//서비스 주입
	@Resource(name="visitCountServiceimpl")
	private VisitCountServiceimpl service;
	
	
	//private VisitCountDAO service;
	private boolean toggle1 = false;
	private HttpSession mysession;
	int totalCount;
	int todayCount;
	

	@RequestMapping(value = "/index.kosmo", method = RequestMethod.GET)
	public String home(Locale locale, Model model,  @RequestParam Map map,final HttpSession session) {
		
		ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
		HttpServletRequest request = attributes.getRequest();
		
		
		System.out.println("request : " + request.getSession());
		if(mysession != request.getSession()) {
			mysession =  request.getSession();
			service.insert(null);
			totalCount = service.getTotalCount(null);
			todayCount = service.getTodayCount(null);
			
		}
		
		System.out.println(String.format("totalCount:%s, todayCount:%s", totalCount,todayCount));
		session.setAttribute("totalCount", totalCount); 
		session.setAttribute("todayCount", todayCount);        
			
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		System.out.println(service);
		
		
		
		return "index.tiles";
	}

	


	
	
}
