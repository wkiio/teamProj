package com.kosmo.baby;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/index.kosmo", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "index.tiles";
	}
/*	
	@RequestMapping("/babyinfo.kosmo")
	public String bayInfo() {
		
		return "babyInfo.tiles";
		
	}*/
	
	@RequestMapping("/login_page.kosmo")
	public String login_page() {
		
		return "login_page.tiles";
		
	}
	
	@RequestMapping("/sign_up_page.kosmo")
	public String sign_up_page() {
		
		return "signup_page.tiles";
		
	}
	
	@RequestMapping("/kakaologin.kosmo")
	public String kakaologin() {
		
		return "kakaologin.tiles";
		
	}
	@RequestMapping("/mypage_one.kosmo")
	public String mypage_one() {
		
		return "mypage_one.tiles";
		
	}
	
	@RequestMapping("/carregister.kosmo")
	public String carregister() {
		return "/car_register/carregister.tiles";
	}

	
	@RequestMapping("/carpool_mypage.kosmo")
	public String carpool_mypage() {
		
		return"carpool_mypage.tiles";
	}
	
	@RequestMapping("/calendar.kosmo")
	public String calendar() {
		
		return "calendar2.tiles";
	}
	
	@RequestMapping("/carpool2.kosmo")
	public String carpool2() {
		return "carpool2.tiles";
	}
	@RequestMapping("/Car.kosmo")
	public String car() {
		return "Car.tiles";
	}
	@RequestMapping("/Car1.kosmo")
	public String car1() {
		return "Car1.tiles";
	}
	@RequestMapping("/admin_index.kosmo")
	public String admim() {
		return "/admin_page/admin_index";
	}
	
	@RequestMapping("/serviceclick.kosmo")
	public String serviceclick() {
		return "serviceclick.tiles";
	}

	@RequestMapping("/search.kosmo")
	public String search() {
		return "search.tiles";
	}
	@RequestMapping("/daumapi.kosmo")
	public String daumapi() {
		return "daumapi.tiles";
	}
	@RequestMapping("/daum.kosmo")
	public String daum() {
		return "daum.tiles";
	}
	
	

	
}
