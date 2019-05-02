package com.kosmo.baby.service.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.kosmo.baby.service.impl.CalenderServiceimpl;

@Controller
public class CalenderController {
	@Resource(name="calenderServiceimpl")
	private CalenderServiceimpl service;
	
	//여기다 이제 리퀘스트 맵핑 하셔서 하심됩니다.

}
