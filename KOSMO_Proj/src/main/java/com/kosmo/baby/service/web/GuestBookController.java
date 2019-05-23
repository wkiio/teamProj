package com.kosmo.baby.service.web;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.baby.service.GuestBookDTO;
import com.kosmo.baby.service.impl.GuestBookServiceimpl;

@Controller
public class GuestBookController {

	@Resource(name="guestBookService")
	private GuestBookServiceimpl guestBookService;
	
	@ResponseBody
	@RequestMapping(value="/GuestBook/List.kosmo",produces="text/html; charset=UTF-8")
	public String list(@RequestParam Map map) throws Exception{
		System.out.println("리스트 리스트 리스트 시작");
		
		System.out.println(map);
		/*
		GuestBookDTO list = guestBookService.selectOne(map);
		map.put("id", list.getId());
		*/
		
		//서비스 호출]
		List<GuestBookDTO> comments= guestBookService.selectList(map);
		List<Map> collections = new Vector<Map>();
		
		//날짜 값을 문자열로 변경해야한다 그렇지 않으면 JSON형식에 맞지 않는다
		//JSONArray.toJSONString(comments) 시
		//[{"NO":2,"ONELINECOMMENT":"댓글2","CPOSTDATE":2018-09-12 10:15:38.0,"CNO":3,"ID":"LEE","NAME":"이길동"},{"NO":2,"ONELINECOMMENT":"댓글1","CPOSTDATE":2018-09-12 10:14:44.0,"CNO":2,"ID":"PARK","NAME":"박길동"}]
		//날짜를 2018-09-12 10:15:38.0에서 " 2018-09-12"형태로 변경		
		
		for(GuestBookDTO comment:comments) { 
			Map record = new HashMap();
			record.put("gPostdate", comment.getgPostdate().substring(0,10));
			record.put("photo",comment.getPhoto().split("memberPhoto")[1].substring(1));
			System.out.println("사진 : "+comment.getPhoto().split("memberPhoto")[1].substring(1));
			record.put("gNo", comment.getgNo());
			record.put("gComment", comment.getgComment());
			record.put("id", comment.getId());
			record.put("refer", comment.getRefer());
			record.put("step", comment.getStep());
			record.put("depth", comment.getDepth());
			record.put("image", comment.getImage());
			collections.add(record);
			
			
		}
		
		
		System.out.println("코멘트 목록:"+JSONArray.toJSONString(collections));
		
		System.out.println("리스트 리스트 끝");

		return JSONArray.toJSONString(collections);
	}//////////////List
	
	@ResponseBody
	@RequestMapping(value="/GuestBook/Write.kosmo",produces="text/html; charset=UTF-8")
	public String write(@RequestParam Map map,Authentication auth, MultipartHttpServletRequest mhsr) throws Exception{
		UserDetails userDetails=(UserDetails)auth.getPrincipal();
		map.put("id",userDetails.getUsername());
		System.out.println("라윗트 라윗트 시작");
		System.out.println(map.get("gcomment"));
		System.out.println(map.get("id"));
		System.out.println(map.get("image"));
		
		String phisicalPath=mhsr.getServletContext().getRealPath("/upload");
		System.out.println("ddddd"+phisicalPath);
		MultipartFile upload= mhsr.getFile("image");
		String newFileName=FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
		File file = new File(phisicalPath+File.separator+newFileName);
		upload.transferTo(file);
		map.put("image", upload.getOriginalFilename());
		System.out.println(map.get("image"));
<<<<<<< HEAD
		*/
		
		UserDetails userDetails=(UserDetails)auth.getPrincipal();
		map.put("id",userDetails.getUsername());
		System.out.println(map.get("image"));
		
=======
>>>>>>> branch 'master2' of https://github.com/wkiio/teamProj.git
		guestBookService.insert(map);
		System.out.println("돌아옴");
		System.out.println(map);
		System.out.println("라윗트 라윗트 끝");
		
		return "";
	}///////////////write
	
	//코멘트 수정처리]
	@ResponseBody
	@RequestMapping(value="/GuestBook/Edit.kosmo",produces="text/html; charset=UTF-8")
	public String update(@RequestParam Map map) throws Exception{
//		System.out.println("수정 시작");
		
		System.out.println("map:"+map);
		
//		System.out.println(map.get("gcomment"));
		
		//서비스 호출]
		guestBookService.update(map);
		
//		System.out.println("수정 끝");
		return "";
	}///////////
	
	//삭제 처리]
	@ResponseBody
	@RequestMapping(value="/GuestBook/Delete.kosmo",produces="text/html; charset=UTF-8")
	public String delete(@RequestParam Map map) throws Exception{
		System.out.println("삭제 시작");
		guestBookService.delete(map);
		
		System.out.println("삭제 끝");
		return "";
	}///////////
	
	@ResponseBody
	@RequestMapping(value="/GuestBook/reply.kosmo",produces="text/html; charset=UTF-8",method=RequestMethod.POST)
	public String reply(@RequestParam Map map,HttpServletRequest mhsr) throws Exception{
		System.out.println("답변 이클립스 시작");
		
		System.out.println("map:"+map);
		
		GuestBookDTO list = guestBookService.selectOne(map);
		map.put("refer",list.getRefer());
		map.put("step",list.getStep());
		map.put("depth",list.getDepth());		
		map.put("id",list.getId());		
		
		System.out.println("리스트 호출 한 뒤 map:"+map);
		
		
		int affected =guestBookService.reply(map);
		
		System.out.println("답변 이클립스 끝");
		return "";
	}//////////////////////
	
	
	
	
	
}
