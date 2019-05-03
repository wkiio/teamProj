package com.kosmo.baby.service.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
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


public class VisitCount_Controller2 implements HttpSessionListener{
	
	//서비스 주입
	//@Resource(name="visitCountServiceimpl")
	//private VisitCountServiceimpl service;
	
	private VisitCountDAO service;
	//private VisitCountServiceimpl service;
	
	@Override
	public void sessionCreated(HttpSessionEvent se) {
			System.out.println("여기로 들어온다.");
			//int a =  service.getTotalCount(null);
			HttpSession session = se.getSession(); 
			System.out.println(session);
			WebApplicationContext context = ContextLoader.getCurrentWebApplicationContext(); 
			String bb = "visitCountDAO";
			//VisitCountDAO dd = (VisitCountDAO) context.getBean(bb);
			
			VisitCountDAO dd = (VisitCountDAO)context.getBean(bb);
			//VisitCountServiceimpl dd = (VisitCountServiceimpl)context.getBean("visitCountServiceimpl");
			
			service = dd;
			/*try {
				//int abcc = service.getTotalCount3(null);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("오류");
			}*/
			
			
			System.out.println(dd);	
			System.out.println(service);
			
			System.out.println("=============");
			//System.out.println(abcc);	
			System.out.println("=============");
			//System.out.println("a: " + a);
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		System.out.println("꺼찜?");
		
	}


	
	
}
