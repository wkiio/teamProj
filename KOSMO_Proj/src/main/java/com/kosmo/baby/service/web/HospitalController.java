package com.kosmo.baby.service.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.baby.service.HospitalDTO;
import com.kosmo.baby.service.ReservationDTO;
import com.kosmo.baby.service.impl.HospitalServiceimpl;
import com.kosmo.baby.service.impl.ReservationServiceimpl;

@Controller
public class HospitalController {
	//서비스 주입
	@Resource(name="hospitalServiceimpl")
	private HospitalServiceimpl service;
	
	//여기에 리퀘스트 맵핑 하셔서 작업하시면 됩니다.
	
	@RequestMapping("/daum.kosmo")
	public String baby_admin(@RequestParam Map map,Model model) {
		List<HospitalDTO> recode= service.selectList(map);
		System.out.println(model.addAttribute("addrs",recode.get(0).getAddr()));
//		model.addAttribute("addrs",recode.toString());
		
		
		return "daum.tiles";
	}

}
