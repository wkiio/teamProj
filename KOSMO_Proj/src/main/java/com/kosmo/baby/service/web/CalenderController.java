package com.kosmo.baby.service.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.baby.service.CalenderDTO;
import com.kosmo.baby.service.impl.CalenderServiceimpl;

@Controller
public class CalenderController {
	@Resource(name="calenderServiceimpl")
	private CalenderServiceimpl service;
	
	
	
	@ResponseBody
	@RequestMapping(value="/fcevent.kosmo", produces = "application/text; charset=utf8")
	public String fcevent(@RequestParam Map map,Model model,Authentication auth) throws Exception{
		List<CalenderDTO> list = service.selectList(map);
		//List컬렉션을 JSO형태로 변환
		List<Map> collections = new Vector<Map>();
		for(CalenderDTO dto : list) {
			Map record = new HashMap();
			record.put("title", dto.getTitle());
			record.put("start", dto.getStartdate());
			if(dto.getEnddate()!=null) {
				record.put("end", dto.getEnddate());
			}
			
			collections.add(record);
		}
		System.out.println(JSONArray.toJSONString(collections));
		return JSONArray.toJSONString(collections);
	}
	
	@ResponseBody
	@RequestMapping(value="/fcinput.kosmo", produces = "application/text; charset=utf8")
	public String fcinput(@RequestParam Map map,Model model,Authentication auth) throws Exception{
		UserDetails user = (UserDetails)auth.getPrincipal();
		map.put("id", user.getUsername());
		System.out.println("깐트롤러");
		if(!map.get("startTime").toString().equals("")) {
			map.put("startdate", map.get("startdate").toString().concat("T"+map.get("startTime")));
			map.put("enddate", map.get("enddate").toString().concat("T"+map.get("endTime")));
		}
		System.out.println(map.get("startdate"));
		System.out.println(map.get("enddate"));
		
		System.out.println(map.get("caltitle"));
		service.insert(map);
		
		return "한글";
	}

}
