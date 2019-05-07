package com.kosmo.baby.service.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.baby.service.Baby_borderDTO;
import com.kosmo.baby.service.impl.CalenderServiceimpl;

@Controller
public class CalenderController {
	@Resource(name="calenderServiceimpl")
	private CalenderServiceimpl service;
	
	//여기다 이제 리퀘스트 맵핑 하셔서 하심됩니다.
	@ResponseBody
	@RequestMapping(value="/fcinput.kosmo", produces = "application/text; charset=utf8")
	public String fcinput(@RequestParam Map map,Model model,Authentication auth) throws Exception{
		UserDetails user = (UserDetails)auth.getPrincipal();
		map.put("id", user.getUsername());
		System.out.println("깐트롤러");
		System.out.println(map);
		System.out.println(map.get("caltitle"));
		System.out.println(map.size());
		service.insert(map);
		
		return "한글";
	}

}
