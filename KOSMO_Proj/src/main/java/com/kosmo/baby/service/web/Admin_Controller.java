package com.kosmo.baby.service.web;


import java.util.ArrayList;
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

import com.kosmo.baby.service.MembersDTO;
import com.kosmo.baby.service.PartnerDTO;
import com.kosmo.baby.service.ReservationDTO;
import com.kosmo.baby.service.ReservationService;
import com.kosmo.baby.service.impl.Baby_borderServiceimpl;
import com.kosmo.baby.service.impl.Carpool_borderServiceimpl;
import com.kosmo.baby.service.impl.Chart_DAO;
import com.kosmo.baby.service.impl.MembersServiceimpl;
import com.kosmo.baby.service.impl.PartnerServiceimpl;
import com.kosmo.baby.service.impl.ReservationServiceimpl;
import com.kosmo.baby.service.impl.VisitCountServiceimpl;

@Controller
public class Admin_Controller {

	//필요한 서비스(연결해야할 데이터베이스 DAO들)
	//멤버
	//서비스 주입
	@Resource(name="membersServiceimpl")
	private MembersServiceimpl memberService;
	
	@Resource(name="reservationServiceimpl")
	private ReservationServiceimpl reservationService;
	
	//서비스 주입
	@Resource(name="visitCountServiceimpl")
	private VisitCountServiceimpl visitCountServiceimpl;
	
	//서비스 주입
	@Resource(name="baby_borderServiceimpl")
	private Baby_borderServiceimpl baby_borderServiceimpl;
	
	@Resource(name="chart_DAO")
	private Chart_DAO chart_DAO;	
	
	@Resource(name="partnerServiceimpl")
	private PartnerServiceimpl partnerService;	
	
	//서비스 주입
	@Resource(name="carpool_borderServiceimpl")
	private Carpool_borderServiceimpl carpool_borderServiceimpl;
	
	//서비스 주입
	

	@RequestMapping("/admin_index.kosmo")
	public String admim(Model model) {
		
		//int member = memberService.(null);
		int todayCount = visitCountServiceimpl.getTodayCount(null);
		int memberCount = chart_DAO.MemberCount(null);
		int carmemberCount = chart_DAO.CarpoolCount(null);
		
		
		
		//게시물수 = 카풀게시판+육아게시판
		int bBoardCount = baby_borderServiceimpl.boardCount(null);
		int cBoardCount = carpool_borderServiceimpl.CBoardCount(null);
		
		model.addAttribute("todayCount", todayCount);
		model.addAttribute("memberCount", memberCount);
		model.addAttribute("carmemberCount", carmemberCount);
		model.addAttribute("boardCount", bBoardCount+cBoardCount	);
		
		
		return "/admin_page/admin_index";
	}

	
	@RequestMapping("/memberTable.kosmo")
	public String memberTable(@RequestParam Map map) {
		
		return "/admin_page/memberTable";
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteMember.kosmo", produces="text/html; charset=UTF-8")
	public String deleteMember(@RequestParam Map map, Model model) {
		System.out.println("삭제 컨트롤러");
		System.out.println("id값은?"+ map);
		memberService.delete(map);
		System.out.println("삭제함?");
		
		List<MembersDTO> list = memberService.selectList(map);
		
		List<Map> collections = new Vector<Map>();
		
		 JSONObject re = new JSONObject();
		 re.put("data", collections);
		
		 return re.toJSONString();
		//return JSONArray.toJSONString(collections);
	}
	
	
	@ResponseBody
	@RequestMapping(value="/memberttable.kosmo", produces="text/html; charset=UTF-8")
	public String perChart(@RequestParam Map map, Model model) {
	//string
		
		List<MembersDTO> list = memberService.selectList(null);
		System.out.println("asdsd:"+list);
		
		
		List<Map> collections = new Vector<Map>();
		
		//ID,PWD,NAME,ADDR,EMAIL,TEL,PARTNERSTATUS
		for(MembersDTO dto : list) {
			Map record = new HashMap();
			record.put("ID", dto.getId());
			System.out.println(dto.getId());
			record.put("NAME", dto.getName());
			String addr0,addr1,addr2;
			addr0 = dto.getAddr().split(":!:")[0].trim();
			addr2 = dto.getAddr().split(";!@")[1].trim();
			addr1 = dto.getAddr().split(":!:")[1].split(";!@")[0].trim();
			record.put("ADDR", addr0 +" "+ addr1 +" "+ addr2);
			record.put("EMAIL", dto.getEmail());
			record.put("TEL", dto.getTel());
			if(dto.getPartnerstatus().equals("2")) {
				record.put("PARTNERSTATUS","O");
			}
			else if(dto.getPartnerstatus().equals("1")) {
				record.put("PARTNERSTATUS","<button class='btn btn-sm ' id='partnerOK' style='background-color:#fc466b; text-align: center; color:white'>확인</button>");
			}
			else {
				record.put("PARTNERSTATUS","X");
			}
			record.put("carnumber", "이곳에 차량등록증 또는 운전면허증을 넣습니다.");
			collections.add(record);
		}
		
		
		//return JSONArray.toJSONString(collections);
		//////////////////////
		 Map<String, Object> mp = new HashMap<String, Object>();
		 mp.put("data", collections);


		 JSONObject re = new JSONObject();
		 re.put("data", collections);
		 //Object result = mp;
		 
		
		 System.out.println("=============");
		 System.out.println(re.toJSONString());
		 System.out.println("=============");
		 return re.toJSONString();
		// return result; 
		 
		
	}
	@RequestMapping("/calendar_admin.kosmo")
	public String calendar(@RequestParam Map map) {		
		return "/admin_page/calendar_admin";
	}

	@RequestMapping("/partnerOK")
	public String partnerOK(@RequestParam Map map,Model model) {
		System.out.println("mapmapmapmapmapmapmapmapmapmapmapmapmapmapmapmapmap : "+map.get("inputid"));
		int partner = memberService.partnerOK(map);
		
		if(partner==1) {
			System.out.println("잘되네요");
			model.addAttribute("partnerok","승인이 완료되었습니다.");
		}
		else {
			System.out.println("못했습니다.");
		}
		return "forward:memberTable.kosmo";
	}
	
	@ResponseBody
	@RequestMapping(value="/partnerOne.kosmo", produces="text/html; charset=UTF-8")
	public String partnerOne(@RequestParam Map map,Model model) {
		System.out.println("wwwwwwwwwwwwwwwwwwwwwwwwwww : "+map.get("id"));		
		PartnerDTO partner = partnerService.partnerOne(map);
		model.addAttribute("partnerid",partner.getId());
		model.addAttribute("partnernumber",partner.getCarNumber());
		model.addAttribute("partnertype",partner.getCarType());
		JSONObject re = new JSONObject();
		re.put("partnerid", partner.getId());
		re.put("partnertype", partner.getCarType());
		re.put("partnername", partner.getName());
		re.put("partnernumber",partner.getCarNumber().split("carnumber")[1].substring(1));
		System.out.println("사진경로:" + partner.getCarNumber().split("carnumber")[1].substring(1));
		System.out.println("partnertype: " +partner.getCarType());
		return re.toJSONString();
	}
	
	
	
	
	
	
}
