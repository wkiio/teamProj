package com.kosmo.baby.service.web;


import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.baby.service.impl.BabyFairImageServiceImple;



@Controller
public class BabyFair_Controller {
	@Resource(name="babyFairImageServiceImple")
	private BabyFairImageServiceImple service;
	
	@RequestMapping("/inputbabyfair.kosmo")
	public String fcdelete(@RequestParam Map map) throws Exception{
		System.out.println("베이비페어 입력시작");
		//startdate, enddate
		String period = map.get("startdate").toString().substring(5)+" - "+map.get("enddate").toString().substring(5);
		String time = map.get("startTime").toString().substring(0,5)+" ~ "+map.get("endTime").toString().substring(0,5);
		String place = map.get("paircontent").toString();
		map.put("period", period);
		map.put("time", time);
		map.put("place", place);
		map.put("product", place);
		service.insert(map);
		return "삭제끝";
	}


}
