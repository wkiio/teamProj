package com.kosmo.baby.service.web;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kosmo.baby.service.Baby_borderDTO;

@Controller
public class CarLoad_Controller {

	@RequestMapping("/carload.kosmo") 
	public String baby_border(@RequestParam Map map,Model model) throws Exception{
		
		
		return "carload.tiles";
	}
	
	
}
