package com.kosmo.baby.service.web;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
		UserDetails user = (UserDetails)auth.getPrincipal();
		map.put("id", user.getUsername());
		
		List<CalenderDTO> list = service.selectList(map);
		System.out.println();
		//List컬렉션을 JSO형태로 변환
		List<Map> collections = new Vector<Map>();
		for(CalenderDTO dto : list) {
			System.out.println(dto.getTitle());
			Map record = new HashMap();
			record.put("id", dto.getCal_no());
			record.put("title", dto.getTitle());
			record.put("start", dto.getStartdate());
			if(dto.getEnddate()!=null) {
				record.put("end", dto.getEnddate());
			}
			if(dto.getId().equals("admin")) {
				record.put("color", "gray");
			}
			record.put("description", dto.getContent());
			collections.add(record);
		}
		System.out.println(JSONArray.toJSONString(collections));
		return JSONArray.toJSONString(collections);
	}
	
	@ResponseBody
	@RequestMapping(value="/fcinput.kosmo", produces = "application/text; charset=utf8")
	public String fcinput(@RequestParam Map map,Authentication auth) throws Exception{
		UserDetails user = (UserDetails)auth.getPrincipal();
		map.put("id", user.getUsername());
		System.out.println("입력시작");
		System.out.println(map.get("title"));
		System.out.println(map);
		System.out.println(map.size());
		
		if(!map.get("startTime").toString().equals("")) {
			map.put("startdate", map.get("startdate").toString().concat("T"+map.get("startTime")));
			map.put("enddate", map.get("enddate").toString().concat("T"+map.get("endTime")));
		}
		service.insert(map);
		
		System.out.println("입력완료");
		System.out.println(map.get("no"));
		return map.get("no").toString();
	}
	
	
	@ResponseBody
	@RequestMapping(value="/fcupdate.kosmo", produces = "application/text; charset=utf8")
	public String fcupdate(@RequestParam Map map) throws Exception{
		System.out.println("수정시작");
		if(!map.get("modifstartTime").toString().equals("")) {
			map.put("modifstartStr", map.get("modifstartStr").toString().concat("T"+map.get("modifstartTime")));
			map.put("modifendStr", map.get("modifendStr").toString().concat("T"+map.get("modifendTime")));
		}
		service.update(map);
		System.out.println("수정끝");
		return "수정끝";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/fcdelete.kosmo", produces = "application/text; charset=utf8")
	public String fcdelete(@RequestParam Map map) throws Exception{
		System.out.println("삭제시작");
		service.delete(map);
		System.out.println("삭제끝");
		return "삭제끝";
	}
	

}
