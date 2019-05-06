package com.kosmo.baby.service.impl;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Service;


@Service
public class NaverSearchApi {
	
	 public static StringBuilder sb;//
	 
	 public String serachText;
	 public String searchReturn;
	 
	
	 public static StringBuilder getSb() {
		return sb;
	}


	public static void setSb(StringBuilder sb) {
		NaverSearchApi.sb = sb;
	}


	public String getSerachText() {
		return serachText;
	}


	public void setSerachText(String serachText) {
		this.serachText = serachText;
	}


	public String getSearchReturn() {
		return searchReturn;
	}


	public void setSearchReturn(String searchReturn) {
		this.searchReturn = searchReturn;
	}


	public void NaverSerachApiv(String text1) {
		 String clientId = "ltSyNINaG9DDdxDD9NEM";//애플리케이션 클라이언트 아이디값";
	        String clientSecret = "Jum96wYcYT";//애플리케이션 클라이언트 시크릿값";
	        serachText = text1;
	        try {
	            String tt = URLEncoder.encode(serachText, "UTF-8");
	            String apiURL = "https://openapi.naver.com/v1/search/shop?query="+ tt; // json 결과
	            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("X-Naver-Client-Id", clientId);
	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            
	            String inputLine;
	            StringBuffer response = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	                response.append(inputLine);
	            }
	            br.close();
	            System.out.println(response.toString());
	            searchReturn = response.toString();
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	 }
	/*public static void main(String[] args) {
        
    }*/


}


