package com.kosmo.baby.service.web;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.baby.command.FileUpDownUtils;
import com.kosmo.baby.command.UploadCommand;
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
		//List컬렉션을 JSO형태로 변환
		List<Map> collections = new Vector<Map>();
		for(CalenderDTO dto : list) {
			Map record = new HashMap();
			record.put("id", dto.getCal_no());
			record.put("title", dto.getTitle());
			record.put("start", dto.getStartdate());
			if(dto.getEnddate()!=null) {
				record.put("end", dto.getEnddate());
			}
			if(dto.getID().equals("admin")) {
				record.put("color", "gray");
			}
			else if(dto.getType().equals("중요")) {
				record.put("color", "#872901");
			}
			else if(dto.getType().equals("생일")) {
				record.put("color", "#a36a00");
			}
			else if(dto.getType().equals("기념일")) {
				record.put("color", "#bcb900");
			}
			else if(dto.getType().equals("예방접종")) {
				record.put("color", "#5ebc00");
			}
			else if(dto.getType().equals("약속")) {
				record.put("color", "#2f00bc");
			}
			else if(dto.getType().equals("행사")) {
				record.put("color", "#a00196");
			}
			
			record.put("description", dto.getContent());
			collections.add(record);
		}
		System.out.println(JSONArray.toJSONString(collections));
		return JSONArray.toJSONString(collections);
	}
	
	@ResponseBody
	@RequestMapping(value="/fcinput.kosmo", produces = "application/text; charset=utf8")
	public String fcinput(@RequestParam Map map,Authentication auth, @RequestParam(name="optradio") String optradio) throws Exception{
		UserDetails user = (UserDetails)auth.getPrincipal();
		map.put("id", user.getUsername());
		System.out.println("입력시작");
		System.out.println(map);
		if(!map.get("startTime").equals("")) {
			map.put("startdate", map.get("startStr").toString().concat("T"+map.get("startTime")));
			map.put("enddate", map.get("endStr").toString().concat("T"+map.get("endTime")));
		}
		System.out.println("요청보냄");
		service.insert(map);
		
		System.out.println("입력완료");
		System.out.println(map.get("no"));
		
		return map.get("no").toString();
	}
	@RequestMapping("/Notify.kosmo")
	public String notify(@RequestParam Map map, Authentication auth,Model model) throws Exception{
		UserDetails user = (UserDetails)auth.getPrincipal();
		map.put("id", user.getUsername());
		SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
		Date time = new Date();
		String time1 = format1.format(time);
		//map.put("today", time1);
		map.put("today", "2019-05-11");
		CalenderDTO result = service.selectOne(map);
		
		if(result!=null) {
			String[] body = result.getStartdate().toString().split("T");
			model.addAttribute("noti", result.getTitle().toString());
			model.addAttribute("noti_body", body.length>1?body[0]+" "+body[1]:body[0]);
		}	
		return "forward:/index.kosmo";
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
	
	@RequestMapping(value="/fcupload.kosmo", produces = "application/text; charset=utf8")
	public String upload(MultipartHttpServletRequest mhsr,HttpServletRequest req,@RequestParam Map map) throws Exception {		
		System.out.println("이미지 삽입 시작");
		System.out.println(map);		
		String phisicalPath = mhsr.getServletContext().getRealPath("/resources/babypair");
		File folder = new File(phisicalPath);
		System.out.println("업로드 폴더 유무 판단");
		if (!folder.exists()) {		
			try{
				folder.mkdir(); //폴더 생성합니다.
				System.out.println("폴더가 생성되었습니다.");
			} 
			catch(Exception e){
				System.out.println("폴더 생성 실패.");
			    e.printStackTrace();
			}        
		}else {
			System.out.println("이미 폴더가 생성되어 있습니다.");
		}
		//타이틀 이미지 업로드
		MultipartFile titleImg = mhsr.getFile("timg");
		String timgName = titleImg.getOriginalFilename();
		System.out.println(titleImg.getOriginalFilename());
		String newFileName = FileUpDownUtils.getNewFileName(phisicalPath, titleImg.getOriginalFilename());
		File file = new File(phisicalPath+File.separator+newFileName);
		titleImg.transferTo(file);		
		//아이템 이미지 업로드
		List<MultipartFile> fileList = mhsr.getFiles("file");
		StringBuffer itemName = new StringBuffer();
		for (MultipartFile itemImg : fileList) {
			itemName.append(","+itemImg.getOriginalFilename());
			System.out.println(itemImg.getOriginalFilename());
			newFileName = FileUpDownUtils.getNewFileName(phisicalPath, itemImg.getOriginalFilename());
			file = new File(phisicalPath+File.separator+newFileName);
			itemImg.transferTo(file);
		}
		System.out.println("업로드 완료");
		req.setAttribute("titleName", timgName);
		req.setAttribute("itemName", itemName.toString());
		return "forward:/inputbabyfair.kosmo";
	}

}
