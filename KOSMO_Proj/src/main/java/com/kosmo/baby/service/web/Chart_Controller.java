package com.kosmo.baby.service.web;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.baby.service.Chart_DTO;
import com.kosmo.baby.service.impl.Chart_ServiceImpl;

@Controller
public class Chart_Controller {

	@Resource(name="chartServiceImpl")
	private Chart_ServiceImpl chart_serviceImpl;
	
	
	@ResponseBody
	@RequestMapping(value="/barChart.kosmo", produces="text/html; charset=UTF-8")
	public String list(@RequestParam Map map, Model model) {
		
		System.out.println("ajax들어온거???? 제발");
		
		List<Chart_DTO> list = chart_serviceImpl.selectList(map);
		
		System.out.println(list.get(1).getVisitnumber());
		
		
		List<Map> collections = new Vector<Map>();
		for(Chart_DTO dto:list) {
			Map record = new HashMap();			
			record.put("month", dto.getMonth());
			record.put("visitnumber", dto.getVisitnumber());			
			collections.add(record);
		}
		System.out.println(JSONArray.toJSONString(collections));
		
		return JSONArray.toJSONString(collections);
	}
	
	@ResponseBody
	@RequestMapping(value="/percentChart.kosmo", produces="text/html; charset=UTF-8")
	public String perChart(@RequestParam Map map, Model model) {
		
		//회원수 구하기
		int member = chart_serviceImpl.MemberCount(map);
		//카풀회원수 구하기
		int carmember = chart_serviceImpl.CarpoolCount(map);
		
		System.out.println("member : " +member);
		System.out.println("carmember : "+  carmember);
		
	    JSONArray jsonList = new JSONArray();
	    List<Map> collections = new Vector<Map>();
		
	
		Map record = new HashMap();
		record.put("count",member);
		collections.add(record);
		record = new HashMap();
		record.put("count",carmember);
		collections.add(record);
		System.out.println("-------------------");
		System.out.println(JSONArray.toJSONString(collections));
		System.out.println("-------------------");
		
		return JSONArray.toJSONString(collections);
	}
	
	
}
