package com.kosmo.baby.service.web;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.baby.service.impl.Carpool_borderServiceimpl;
import com.kosmo.baby.service.impl.ReviewServiceimpl;

@Controller
public class Review_Controller {
	//서비스 주입
	@Resource(name="reviewServiceimpl")
	private ReviewServiceimpl rService;
	

	
	@ResponseBody
	@RequestMapping(value="/review.kosmo",  produces="text/html; charset=UTF-8")
	public String review(@RequestParam Map map, Model model,Authentication auth) throws Exception{
		
		System.out.println("리뷰에 정보 모모가 들어왔는지 " + map);
		
		rService.insert(map);
		
		return "성공";
	}
	
	
	

}
