<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	url="https://sports.news.naver.com/wfootball/news/read.nhn?oid=109&aid=0003834601" # URL
	library(rvest)
	page <- read_html(url,encoding = "UTF-8") # 인코딩 확인하기 
	article <- page%>%html_nodes("#newsEndContents")%>%html_text()
	article
</body>
</html>