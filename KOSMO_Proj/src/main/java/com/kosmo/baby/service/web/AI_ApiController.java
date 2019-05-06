package com.kosmo.baby.service.web;

import java.io.File;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kosmo.baby.service.AiApi;
import com.kosmo.baby.service.impl.MsApi;
import com.kosmo.baby.service.impl.NaverSearchApi;



@Controller
public class AI_ApiController {

	
	@Resource(name="aiApi")
	private AiApi ai;
	
	@Resource(name="naverSearchApi")
	private NaverSearchApi n_api;
	
	@Resource(name="msApi")
	private MsApi ms_api;
	
	/*
	String path = req.getServletContext().getRealPath("/Upload");
	File file = new File(path+File.separator+req.getParameter("filename"));*/
	
	@ResponseBody
	@RequestMapping(value="/gotoAI.kosmo" , produces="text/html; charset=UTF-8")
	public String ai_Api(@RequestParam Map map,HttpServletRequest req,
			HttpServletResponse resp) {
		
		String file = (String) map.get("filepath");	
		System.out.println("filepath :" + file);
		String fileType = file.substring(file.lastIndexOf(".")+1);
		System.out.println("fileType:" + fileType);
		String fileRealPath=req.getServletContext().getRealPath(file);		
		System.out.println("fileRealPath: " + fileRealPath);
		
		ai.setM_fileName(fileRealPath);
		ai.setM_typeName(fileType);
		ai.AiApiStart();
		String getJsonAi = ai.getM_responBody();
		System.out.println("getJsonAi: " + getJsonAi);
		
		
		////////////////////////////////////////////////
		
		ms_api.startApi(fileRealPath);
		System.out.println("ms: " + ms_api.getMs_Api());
		
		JSONParser parser = new JSONParser(); 		
		Object obj = null;			 
		 			 
		 try {
			obj = parser.parse( ms_api.getMs_Api() );
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

		JSONObject jsonObj = (JSONObject) obj; 
		System.out.println("jsonObj.toJSONString(): " + jsonObj.toJSONString());
		JSONObject jsonObj1 =  (JSONObject) jsonObj.get("description");
		System.out.println("jsonObj1.toJSONString() : " + jsonObj1.toJSONString());
		
		return jsonObj1.toJSONString();
		//return jsonObj1.toJSONString();
	}
	 
	
	@ResponseBody
	@RequestMapping(value="/gotoSearch.kosmo" , produces="text/html; charset=UTF-8")
	public String naver_Api(@RequestParam Map map,HttpServletRequest req,
			HttpServletResponse resp) {
		System.out.println("========================================================");
		System.out.println("naver_map : " + map);
		
		String a = (String) map.get("getAiImage");
		n_api.NaverSerachApiv(a);
		String responsevalue = n_api.getSearchReturn();
		
		System.out.println(responsevalue);
		
		JSONParser parser = new JSONParser(); 		
		Object obj = null;			 
		 			 
		 try {
			obj = parser.parse( responsevalue );
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		JSONObject jsonObj = (JSONObject) obj; 
		System.out.println("jsonObj.toJSONString() : " + jsonObj.toJSONString());
	
		//JSONObject jsonObj1 =  (JSONObject) jsonObj.get("total");
		//System.out.println("jsonObj1.toJSONString() : " + jsonObj1.toJSONString());
		
		
		
		return jsonObj.toJSONString();
	}
	
	
	
}
