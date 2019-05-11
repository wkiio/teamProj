package com.kosmo.baby.service.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.JsonArray;
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
		List<HospitalDTO> hospitals= service.selectList(map);
		
		List<Map> collections = new Vector<Map>();
		for(HospitalDTO dto : hospitals) {
			Map recode = new HashMap();
			
			
			
			recode.put("h_no", dto.getH_no());
			recode.put("name", dto.getName());
			recode.put("tel",dto.getTel());
			recode.put("addr",dto.getAddr());
			recode.put("mon",dto.getMon());
			recode.put("tue", dto.getTue());
			recode.put("wed",dto.getWed());
			recode.put("thu",dto.getThu());
			recode.put("fri",dto.getFri());
			recode.put("sat",dto.getSat());
			recode.put("sun",dto.getSun());
			recode.put("holiday",dto.getHoliday());
			recode.put("emergency",dto.getEmergency());
			recode.put("code",dto.getCode());
			
			
			
			
			collections.add(recode);
			
		}
		model.addAttribute("addrs",collections);
		model.addAttribute("addrsJSON",JSONArray.toJSONString(collections));
		
		return "daumapi.tiles";
	}

}
