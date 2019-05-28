package com.kosmo.baby.service.web;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.kosmo.baby.service.MembersDTO;
import com.kosmo.baby.service.ReservationDTO;
import com.kosmo.baby.service.ReservationService;
import com.kosmo.baby.service.impl.Baby_borderServiceimpl;
import com.kosmo.baby.service.impl.Carpool_borderServiceimpl;
import com.kosmo.baby.service.impl.Chart_DAO;
import com.kosmo.baby.service.impl.MembersServiceimpl;
import com.kosmo.baby.service.impl.ReservationServiceimpl;
import com.kosmo.baby.service.impl.VisitCountServiceimpl;

@Controller
public class FCM_Controller {
	@RequestMapping("/sendPush.kosmo")
	public String sendPush(HttpServletRequest request, Model model) {
		//d8ojoQfYuT0:APA91bHFyr7Zh629nFqDbRqxq1DDzJT8ym7k_TodA-d3dDzpB6wq0a4ad-u7LiuBBBev1K6R35ts_ArM-CaIAmXgff0MEqKTDc0EJ6HJnoca6K1NdYzkpkk-7VnAvZPxldToGBKYA9X9
		System.out.println("sendPush.......");
		String token = "d8ojoQfYuT0:APA91bHFyr7Zh629nFqDbRqxq1DDzJT8ym7k_TodA-d3dDzpB6wq0a4ad-u7LiuBBBev1K6R35ts_ArM-CaIAmXgff0MEqKTDc0EJ6HJnoca6K1NdYzkpkk-7VnAvZPxldToGBKYA9X9"; // 서버에 저장된 토큰 가져오기
		String title = "예약";
		String content = "예약이 성립되었습니다!";
		try {
			title   = URLEncoder.encode(title  ,"UTF-8"); // 한글깨짐으로 URL인코딩해서 보냄
			content = URLEncoder.encode(content,"UTF-8");
			System.out.println(String.format("title : %s, content : %s", title, content));

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		ResponseEntity<String> result = sendHttp(token, title, content);
		model.addAttribute("serverTime", token);
		model.addAttribute("result", result.getBody());
		return "forward:Carreservation.kosmo";
	}
	
	@RequestMapping("/sendPush2.kosmo")
	public String sendPush2(HttpServletRequest request, Model model) {
		System.out.println("sendPush.......");
		String token = "d8ojoQfYuT0:APA91bHFyr7Zh629nFqDbRqxq1DDzJT8ym7k_TodA-d3dDzpB6wq0a4ad-u7LiuBBBev1K6R35ts_ArM-CaIAmXgff0MEqKTDc0EJ6HJnoca6K1NdYzkpkk-7VnAvZPxldToGBKYA9X9"; // 서버에 저장된 토큰 가져오기
		String title = "계약 완료";
		String content = "계약이 완료 되었습니다! 평가를 작성해주세요!";
		try {
			title   = URLEncoder.encode(title  ,"UTF-8"); // 한글깨짐으로 URL인코딩해서 보냄
			content = URLEncoder.encode(content,"UTF-8");
			System.out.println(String.format("title : %s, content : %s", title, content));

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		ResponseEntity<String> result = sendHttp(token, title, content);
		model.addAttribute("serverTime", token);
		model.addAttribute("result", result.getBody());
		return "forward:Carreservation.kosmo";
	}

	private ResponseEntity<String> sendHttp(String token, String title, String content){
		System.out.println("sendPush GHOOGOGOG.......");
		RestTemplate template = new RestTemplate();
		HttpHeaders headers = new HttpHeaders(); 
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.add("Authorization", "key="+"AAAA354sRbQ:APA91bErwiyWd0B4ILTurQwzTHb4Sy4FY8HkYHhAqa5Y84tzvTR4qGwGw0mTzdQK-W5sMxNypgR3Hh8Njaxloz2XgdtG8xEQdSTHJtbQIdWWvn8c_GdAJkf8aDv4KGHbW9S-5yxWtdtY"); // API_KEY : Firebase 내 프로젝트의 서버키		
		JSONObject json  = new JSONObject();
		json.put("to", token);
	
		JSONObject data = new JSONObject();
		data.put("title"  , title);
		data.put("message", content);
		json.put("data"   ,data);
		HttpEntity entity = new HttpEntity(json.toJSONString(), headers);
		return template.exchange("https://fcm.googleapis.com/fcm/send", HttpMethod.POST, entity, String.class);

	}
	
	
}
