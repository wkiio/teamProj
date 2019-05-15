package com.kosmo.baby.service.web;


import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.baby.service.BabyFairDTO;
import com.kosmo.baby.service.impl.BabyFairImageServiceImple;
import com.kosmo.baby.service.impl.BabyFairServiceimpl;



@Controller
public class BabyFair_Controller {
	@Resource(name="babyFairServiceimpl")
	private BabyFairServiceimpl service;
	
	@RequestMapping("/aiApi.kosmo")
	public String ai_API() {
		return "aiApi(babyfair).tiles";
	}
	
	@RequestMapping("/pairview.kosmo")
	public String pairview(@RequestParam Map map,Model model) {
		System.out.println("이벤트 페이지 이동준비");
		System.out.println(map);
		BabyFairDTO recode = service.selectOne(map);
		model.addAttribute("dto", recode);
		System.out.println("이벤트 페이지 이동");
		return "aiApi(babyfair).tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="/seachevent.kosmo", produces = "application/text; charset=utf8")
	public String seachEvent(@RequestParam Map map) throws Exception{
		String flag;
		System.out.println("이벤트 찾기 시작");
		System.out.println(map);
		int result = service.seachEvent(map);
		System.out.println("이벤트 찾기 끝");
		if(result==0) {
			System.out.println("이벤트 없다");
			flag = "false";
		}
		else {
			System.out.println("이벤트 있다");
			flag = "true";
		}
		return flag;
	}
	
	
	@RequestMapping("/inputbabyfair.kosmo")
	public String inputbabyfair(@RequestParam Map map,HttpServletRequest req) throws Exception{
		System.out.println("베이비페어 입력시작");
		System.out.println(map);
		String period = map.get("startdate").toString().substring(5)+" - "+map.get("enddate").toString().substring(5);
		System.out.print("period:");
		System.out.println(period);
		String time = map.get("startTime").toString().substring(0,5)+" ~ "+map.get("endTime").toString().substring(0,5);
		System.out.print("time:");
		System.out.println(time);
		String place = map.get("paircontent").toString();
		System.out.print("place:");
		System.out.println(place);
		System.out.print("titleimg:");
		System.out.println(req.getAttribute("titleName"));
		String product = req.getAttribute("itemName").toString().substring(1);;
		System.out.print("product:");
		System.out.println(product);
		map.put("period", period);
		map.put("time", time);
		map.put("place", place);
		map.put("titleimg", req.getAttribute("titleName"));
		map.put("product", product);
		service.insert(map);
		System.out.println("베이비페어 입력끝");
		return "forward:/pairview.kosmo";
	}


}
