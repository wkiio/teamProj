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

import com.kosmo.baby.service.AiApi;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	
	@RequestMapping("/login_page.kosmo")
	public String login_page() {
		return "login_page.tiles";	
	}
	
	@RequestMapping("/aiApi.kosmo")
	public String ai_API() {
		return "aiApi(babyfair).tiles";
	}
	
	
	@RequestMapping("/find_Id.kosmo")
	public String find_id() {
		return "find_Id.tiles";
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
		
		return "calendar.tiles";
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
	@RequestMapping("/word.kosmo")
	public String word() {
		return "word.tiles";
	}
	@RequestMapping("/wordcloud.kosmo")
	public String wordcloud()throws Exception {
		
		return "wordCloud.tiles";
	}
	@RequestMapping("/carload.kosmo")
	public String carload()throws Exception{
		return "carload.tiles";
	}
	

	
}
