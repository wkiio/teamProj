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



@Controller
public class AI_ApiController {

	
	@Resource(name="aiApi")
	private AiApi ai;
	
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
		
		JSONParser parser = new JSONParser(); 
		Object obj = null;
		try {
			obj = parser.parse( getJsonAi );
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

		JSONObject jsonObj = (JSONObject) obj; 
		System.out.println("jsonObj? : " +jsonObj);
		
		
		System.out.println(jsonObj.get("return_object"));
		JSONObject jsonObj1 =  (JSONObject) jsonObj.get("return_object");
		System.out.println("jsonObj1" + jsonObj1.toJSONString());
		//JsonParser Parser = new JsonParser();
		//JsonObject jsonObj = (JsonObject) Parser.parse(getJsonAi);
		//JsonArray memberArray = (JsonArray) jsonObj.get("return_object");

		//System.out.println(jsonObj.get("return_object"));
		
		
		//return jsonObj.toJSONString();
		return jsonObj1.toJSONString();
	}
	 
	
	
	
	
}
