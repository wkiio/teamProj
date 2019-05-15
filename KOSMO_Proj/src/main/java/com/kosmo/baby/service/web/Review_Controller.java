package com.kosmo.baby.service.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import com.kosmo.baby.service.impl.ReviewServiceimpl;

@Controller
public class Review_Controller {
	//서비스 주입
	@Resource(name="reviewServiceimpl")
	private ReviewServiceimpl service;
	
	
	
	

}
