package com.kosmo.baby.service.web;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.baby.service.Carpool_borderDTO;
import com.kosmo.baby.service.MembersDTO;
import com.kosmo.baby.service.ReservationDTO;
import com.kosmo.baby.service.impl.Carpool_borderServiceimpl;
import com.kosmo.baby.service.impl.ReservationServiceimpl;
import com.kosmo.baby.service.web.PagingUtil;

@Controller
public class Carpool_borderController {
	
	//서비스 주입
	@Resource(name="carpool_borderServiceimpl")
	private Carpool_borderServiceimpl carservice;
	//서비스 주입
	@Resource(name="reservationServiceimpl")
	private ReservationServiceimpl rsservice;
	

	
	//여기다 리퀘스트 맵핑 하셔서 작성하시면 됩니다
	//인설트하기
	@RequestMapping("/Carinsert.kosmo")
	public String carinsert(@RequestParam Map map,Model model,Authentication auth)throws Exception{
		UserDetails user = (UserDetails)auth.getPrincipal();
		map.put("id", user.getUsername());
		carservice.insert(map);
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
		carservice.update(map);
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
		carservice.delete(map);
		
		return "forward:Carindex.kosmo";
	}
	
	//리소스파일(memo.properties)에서 읽어오기
	@Value("${PAGESIZE}")
	private int pageSize;
	@Value("${BLOCKPAGE}")
	private int blockPage;
	//리스트 보여주기
	@RequestMapping(value="/Carindex.kosmo", produces="text/html; charset=UTF-8")
	public String carindex(@RequestParam Map map,Model model,HttpServletRequest req,@RequestParam(required=false,defaultValue="1") int nowPage)throws Exception{
		System.out.println(map.get("serchword_one"));
/*		//서비스 호출]
		//페이징을 위한 로직 시작]
		//전체 레코드수
		int totalRecordCount= service.getTotalRecord(map);		
		//전체 페이지수]
		int totalPage=(int)Math.ceil((double)totalRecordCount/pageSize)	;		
		//시작 및 끝 ROWNUM구하기]
		int start =(nowPage-1)*pageSize+1;
		int end   =nowPage*pageSize;
		map.put("start",start);
		map.put("end", end);
		//페이징을 위한 로직 끝]		
*/		List<Carpool_borderDTO> list= carservice.selectList(map);
		/*//페이징 문자열을 위한 로직 호출]
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,"/baby/Carindex.kosmo?");
		//데이타 저장]
		model.addAttribute("list", list);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("totalRecordCount", totalRecordCount);		
		model.addAttribute("pagingString", pagingString);
		*/
		return "Car.tiles";
	}//////
	//리스트AJAX전체뿌리기
	@ResponseBody
	@RequestMapping(value="/Carindex1.kosmo", produces="text/html; charset=UTF-8")
	public String carindex1(@RequestParam Map map,Model model)throws Exception{
		
		System.out.println(map);
		System.out.println("firstsearch : " + map.get("firstsearch"));
		
		List<Carpool_borderDTO> list = carservice.selectList(map);
		
		List<Map> collections = new Vector<Map>();
		
		for(Carpool_borderDTO dto : list) {
			Map record = new HashMap();
			System.out.println("사진 노스플릿 : "+ dto.getPhoto());
			System.out.println("사진 스플릿 : " + dto.getPhoto().split("memberPhoto")[1].substring(1));
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
			record.put("carseat",dto.getCarseat());
			record.put("photo",dto.getPhoto().split("memberPhoto")[1].substring(1));
			System.out.println("사진경로:" + dto.getPhoto().split("memberPhoto")[1].substring(1));
			System.out.println("카시트 유무"+dto.getCarseat());
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
		System.out.println(map.get("cp_no"));
		System.out.println(map.get("type"));
		UserDetails user = (UserDetails)auth.getPrincipal();
		System.out.println("로그인중입니다 : " + user.getUsername());
		Carpool_borderDTO list=carservice.selectOne(map);
		System.out.println(list.getId());
		model.addAttribute("userId",user.getUsername());
		model.addAttribute("writerId", list.getId());
		map.put("id",list.getId());
		int count = rsservice.count(map);
		System.out.println(count);
		int counter = Integer.valueOf(count);
		System.out.println(counter);
		List<ReservationDTO> totalscore = rsservice.selectScore(map);
		int score,value,realscore = 0;
		
		System.out.println("얼마나했냐 : "+counter);
		for(ReservationDTO a : totalscore) {
			System.out.println("지금까지 한 점수 : "+Integer.parseInt(a.getScore()));
			score = Integer.parseInt(a.getScore());
			realscore += score;
		}
		if(!(counter == 0 || realscore == 0)) {
		value = realscore/counter;
		model.addAttribute("score",value);
		}
		else { model.addAttribute("score","운행 기록이 없습니다"); } 
		
			
		
		
		
		System.out.println("글쓴이 입니다 : " + list.getId());
		System.out.println("상세보기 시간");
		System.out.println(list.getContent());
		model.addAttribute("photo",list.getPhoto().split("memberPhoto")[1].substring(1));
		
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
		System.out.println("예약시작");
		UserDetails user = (UserDetails)auth.getPrincipal();
		map.put("id", user.getUsername());
		System.out.println(map);
		
		carservice.updateHasp(map);
		
		carservice.adminInsert(map);
		System.out.println("reservation 테이블에 들어가버렸습니다");		
		return "forward:Carreservation.kosmo";
	}
	//예약현황
	@RequestMapping("/Carreservation.kosmo")
	public String Carreservation(@RequestParam Map map, Model model,Authentication auth)throws Exception{	
		UserDetails user = (UserDetails)auth.getPrincipal();
		List<Carpool_borderDTO> list = carservice.seList(map);
		
		System.out.println("카예약현황 : " + user.getUsername());
		model.addAttribute("id2",user.getUsername());
		for(int i=0;i<list.size();i++) {		
			System.out.println(list.get(i).getCp_no() + "," + list.get(i).getFinish());
		}

		model.addAttribute("selist", list);

		
				
		return "Carreservation.tiles";
	}
	@RequestMapping("/yes.kosmo")
	public String yes1(@RequestParam Map map, Model model,Authentication auth)throws Exception{			
		System.out.println("yes1map:" + map);
		carservice.updateHasp(map);
		carservice.yesupdate(map);
		model.addAttribute("yes","222");
		return "forward:Carreservation.kosmo";
	}
	


	
	
}