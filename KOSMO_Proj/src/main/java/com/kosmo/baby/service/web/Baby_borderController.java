package com.kosmo.baby.service.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.baby.service.Baby_borderDTO;
import com.kosmo.baby.service.MembersDTO;
import com.kosmo.baby.service.impl.Baby_borderServiceimpl;

@Controller
public class Baby_borderController {
	//서비스 주입
	@Resource(name="baby_borderServiceimpl")
	private Baby_borderServiceimpl service;
	
	//여기다가 이제 리퀘스트 맵핑써서 하심됩니다.
	
	@RequestMapping("/babyinfo.kosmo") 
	public String baby_border(@RequestParam Map map,Model model) throws Exception{
		
		List<Baby_borderDTO> list = service.selectList(null);
		
		model.addAttribute("list",list);
		
		return "babyInfo.tiles";
	}
	
	
	@RequestMapping("/baby_admin.kosmo")
	public String baby_admin(@RequestParam Map map, Model model) {
	
		List<Baby_borderDTO> list = service.selectList(null);
		model.addAttribute("baby_Info",list);	
		System.out.println(model);
		
	return "/admin_page/baby_admin";
	}
	
	@ResponseBody
	@RequestMapping(value="/babyTable.kosmo", produces="text/html; charset=UTF-8")
	public String babyTable(@RequestParam Map map, Model model) {
		
		System.out.println("map.size() : " +map.size());
		
		List<Baby_borderDTO> list = service.selectList(map);
		
		List<Map> collections = new Vector<Map>();

		for(Baby_borderDTO dto : list) {
			Map record = new HashMap();
			record.put("NO", dto.getNo());
			record.put("TITLE", dto.getTitle());
			record.put("URL", dto.getUrl());	
			record.put("THUMBNAIL", dto.getthumbnail());	
			collections.add(record);			
		}		
		
		return JSONArray.toJSONString(collections);
	}
	
	@ResponseBody
	@RequestMapping(value="/babyreturnNo.kosmo", produces="text/html; charset=UTF-8")
	public String babyreturnNo(@RequestParam Map map, Model model) {
		
		System.out.println("map.size():" + map.size());
		
		Baby_borderDTO baby = service.selectOne(map);
		
		List<Map> collections = new Vector<Map>();
		Map record = new HashMap();
		record.put("TITLE", baby.getTitle());
		record.put("URL", baby.getUrl());	
		record.put("THUMBNAIL", baby.getthumbnail());	
		collections.add(record);	
		
		System.out.println(JSONArray.toJSONString(collections));
		return JSONArray.toJSONString(collections);
	}
	
	@ResponseBody
	@RequestMapping(value="/babyupdate.kosmo", produces="text/html; charset=UTF-8")
	public String babyupdate(@RequestParam Map map, Model model) {
		
		System.out.println("dddddddddddggfdgddd");
		System.out.println("NUM ; " + map);
		
		service.update(map);
		
		List<Baby_borderDTO> list = service.selectList(map);
		
		List<Map> collections = new Vector<Map>();

		for(Baby_borderDTO dto : list) {
			Map record = new HashMap();
			record.put("NO", dto.getNo());
			record.put("TITLE", dto.getTitle());
			record.put("URL", dto.getUrl());	
			record.put("THUMBNAIL", dto.getthumbnail());	
			collections.add(record);			
		}		
		
		return JSONArray.toJSONString(collections);
	}
	
	
	

}
