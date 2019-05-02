package com.kosmo.baby.service.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.kosmo.baby.service.impl.PartnerServiceimpl;

@Controller
public class PartnerController {
	//서비스 주입
	@Resource(name="partnerServiceimpl")
	private PartnerServiceimpl service;
	
	//여기다가 이제 리퀘스트 맵핑 하셔서 하심됩니다.

}
