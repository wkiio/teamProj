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
import org.springframework.stereotype.Service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
 
import com.google.gson.Gson;


@Service
public class AiApi {
	
	  String m_typeName;
	  String m_fileName;
	  
	  String m_responBody;
	
	  
	




	public String getM_responBody() {
		return m_responBody;
	}




	public void setM_responBody(String m_responBody) {
		this.m_responBody = m_responBody;
	}




	public String getM_typeName() {
		return m_typeName;
	}




	public void setM_typeName(String m_typeName) {
		this.m_typeName = m_typeName;
	}




	public String getM_fileName() {
		return m_fileName;
	}




	public void setM_fileName(String m_fileName) {
		this.m_fileName = m_fileName;
	}



	public void AiApiStart() {
			System.out.println("ccccc");
	        String openApiURL = "http://aiopen.etri.re.kr:8000/ObjectDetect";
	        String accessKey = "c47c98fe-c121-4697-991d-08516e0f6828";    // 발급받은 API Key
	        //String type = "jpg";     // 이미지 파일 확장자
	        String type= m_typeName;
	        String file = m_fileName;
	        
	        
	       //String file = "C:/Users/CSJ/git/teamProj/KOSMO_Proj/src/main/resources/한지민.jpg";
  
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
	            m_responBody = responBody;
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
