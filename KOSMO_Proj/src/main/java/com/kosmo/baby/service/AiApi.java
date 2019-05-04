package com.kosmo.baby.service;



import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.core.io.DefaultResourceLoader;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
 
import com.google.gson.Gson;

public class AiApi {
	
	  public AiApi() {
			System.out.println("ccccc");
	        String openApiURL = "http://aiopen.etri.re.kr:8000/ObjectDetect";
	        String accessKey = "c47c98fe-c121-4697-991d-08516e0f6828";    // 발급받은 API Key
	        String type = "jpg";     // 이미지 파일 확장자
	        
	        
	        
	       String file = "C:/Users/CSJ/git/teamProj/KOSMO_Proj/src/main/resources/한지민.jpg";
  
	        String imageContents = "";
	        Gson gson = new Gson();
	 
	        Map<String, Object> request = new HashMap<String, Object>();
	        Map<String, String> argument = new HashMap<String, String>();
	 
	        try {
	            Path path = Paths.get(file);
	            byte[] imageBytes = Files.readAllBytes(path);
	            imageContents = Base64.getEncoder().encodeToString(imageBytes);
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	 
	        argument.put("type", type);
	        argument.put("file", imageContents);
	 
	        request.put("access_key", accessKey);
	        request.put("argument", argument);
	 
	        URL url;
	        Integer responseCode = null;
	        String responBody = null;
	        try {
	            url = new URL(openApiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("POST");
	            con.setDoOutput(true);
	 
	            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
	            wr.write(gson.toJson(request).getBytes("UTF-8"));
	            wr.flush();
	            wr.close();
	 
	            responseCode = con.getResponseCode();
	            InputStream is = con.getInputStream();
	            byte[] buffer = new byte[is.available()];
	            int byteRead = is.read(buffer);
	            responBody = new String(buffer);
	 
	            System.out.println("[responseCode] " + responseCode);
	            System.out.println("[responBody]");
	            System.out.println(responBody);
	 
	        } catch (MalformedURLException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	       
	}

	
	
}
