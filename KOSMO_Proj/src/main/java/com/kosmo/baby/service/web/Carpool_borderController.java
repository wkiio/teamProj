package com.kosmo.baby.service.web;

import java.text.SimpleDateFormat;
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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.baby.service.Carpool_borderDTO;
import com.kosmo.baby.service.impl.Carpool_borderServiceimpl;

@Controller
public class Carpool_borderController {
	
	//서비스 주입
	@Resource(name="carpool_borderServiceimpl")
	private Carpool_borderServiceimpl service;
	
	//여기다 리퀘스트 맵핑 하셔서 작성하시면 됩니다
	//인설트하기
	@RequestMapping("/Carinsert.kosmo")
	public String carinsert(@RequestParam Map map,Model model,Authentication auth)throws Exception{
		UserDetails user = (UserDetails)auth.getPrincipal();
		map.put("id", user.getUsername());
		service.insert(map);
		System.out.println("인풋끝");
		return "forward:Carindex.kosmo";
	}
	//수정
	@RequestMapping("/Carupdate.kosmo")
	public String carupdate(@RequestParam Map map,Model model,Authentication auth)throws Exception{
		UserDetails user = (UserDetails)auth.getPrincipal();
		map.put("id", user.getUsername());
		System.out.println(map);
		System.out.println("업데이트 컨트롤");
		service.update(map);
		model.addAttribute("edit","edit");
		//System.out.println(service.update(map));
		return "forward:Carview.kosmo";
	}
	//삭제
	@RequestMapping("/Cardelete.kosmo")
	public String cardelete(@RequestParam Map map,Authentication auth)throws Exception{
		UserDetails user = (UserDetails)auth.getPrincipal();
		map.put("id", user.getUsername());
		System.out.println(map.get("cp_no"));
		service.delete(map);
		
		return "forward:Carindex.kosmo";
	}
	
	//리스트 보여주기
	@RequestMapping(value="/Carindex.kosmo", produces="text/html; charset=UTF-8")
	public String carindex(@RequestParam Map map,Model model)throws Exception{
		System.out.println(map.get("serchword_one"));
		List<Carpool_borderDTO> list = service.selectList(map);

		return "Car.tiles";
	}//////
	//리스트AJAX전체뿌리기
	@ResponseBody
	@RequestMapping(value="/Carindex1.kosmo", produces="text/html; charset=UTF-8")
	public String carindex1(@RequestParam Map map,Model model)throws Exception{
		
		System.out.println(map);
		System.out.println("firstsearch : " + map.get("firstsearch"));
		
		List<Carpool_borderDTO> list = service.selectList(map);
		
		List<Map> collections = new Vector<Map>();
		
		for(Carpool_borderDTO dto : list) {
			Map record = new HashMap();
			record.put("cp_no",dto.getCp_no());
			record.put("content",dto.getContent());
			record.put("end_xpos",dto.getEnd_xpos());
			record.put("end_ypos",dto.getEnd_ypos());
			record.put("endpoint",dto.getEndpoint());
			record.put("id",dto.getId());
			record.put("name",dto.getName());
			record.put("price",dto.getPrice());
			record.put("start_xpos",dto.getStart_xpos());
			record.put("start_ypos",dto.getStart_ypos());
			record.put("startpoint",dto.getStartpoint());
			record.put("time",dto.getTime());
			record.put("type",dto.getType());
			collections.add(record);			
		}////for
		System.out.println(JSONArray.toJSONString(collections));
		//
		return JSONArray.toJSONString(collections);
	}//////
		
	//상세보기
	@RequestMapping("/Carview.kosmo")
	public String carview(@RequestParam Map map,Model model,Authentication auth)throws Exception{
		System.out.println("상세보기");
		System.out.println(map.get("no"));
		UserDetails user = (UserDetails)auth.getPrincipal();
		System.out.println("로그인중입니다 : " + user.getUsername());
		Carpool_borderDTO list=service.selectOne(map);
		System.out.println("글쓴이 입니다 : " + list.getId());
		System.out.println("상세보기 시간");
		System.out.println(list.getTime());
		System.out.println(list.getStart_xpos());
		System.out.println(list.getStart_ypos());
		System.out.println(list.getEnd_xpos());
		System.out.println(list.getEnd_ypos());
		model.addAttribute("dto", list);
		return "CarView.tiles";
	}
	
	//수정폼으로 이동해서 내용뿌리기
	@RequestMapping("/Caredit.kosmo")
	public String caredit(@RequestParam Map map,Model model)throws Exception{
		model.addAttribute("list",map);

		return "/car_register/carregister.tiles";
	}
	
	@RequestMapping("/CarpoolSubmit.kosmo")
	public String CarpoolSubmit(@RequestParam Map map,Model model,Authentication auth) throws Exception{
		UserDetails user = (UserDetails)auth.getPrincipal();
		System.out.println(user.getUsername());
		map.put("id", user.getUsername());
		
		service.adminInsert(map);
		System.out.println("reservation 테이블에 들어가버렸습니다");		
		return "index.tiles";
	}
	
	
}