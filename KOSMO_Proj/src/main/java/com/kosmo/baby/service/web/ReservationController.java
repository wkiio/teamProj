package com.kosmo.baby.service.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.baby.service.Carpool_borderDTO;
import com.kosmo.baby.service.ReservationDTO;
import com.kosmo.baby.service.impl.Carpool_borderServiceimpl;
import com.kosmo.baby.service.impl.ReservationServiceimpl;

@Controller
public class ReservationController {
	//서비스 주입
	@Resource(name="reservationServiceimpl")
	private ReservationServiceimpl rService;
	
	//서비스 주입
	@Resource(name="carpool_borderServiceimpl")
	private Carpool_borderServiceimpl cService;

	
	//여기에 리퀘스트 맵핑 하셔서 작업하시면 됩니다.
	
	@RequestMapping("/car_admin.kosmo")
	public String baby_admin(@RequestParam Map map,Model model) {
		List<ReservationDTO> recode= rService.selectList(map);
		
		model.addAttribute("car_list",recode);
		
		return "/admin_page/car_admin";
	}
	@RequestMapping("/grade.kosmo")
	public String grade(@RequestParam Map map,Model model,Authentication auth) throws Exception{
		UserDetails user = (UserDetails)auth.getPrincipal();
		map.put("id",user.getUsername());
		System.out.println(map);
		System.out.println("리절베이션컨트롤러");
		cService.updateHasp(map);
		rService.update(map);
		
		return "forward:Carreservation.kosmo";
	}
	
	@RequestMapping("/Back_reser.kosmo")
	public String returnreservation(@RequestParam Map map,Model model,Authentication auth) throws Exception{
		System.out.println("트리거 되냐쉬발 : "+map.get("cp_no"));
		rService.delete(map);
		return "Car.tiles";
	}
	
	
	
}
