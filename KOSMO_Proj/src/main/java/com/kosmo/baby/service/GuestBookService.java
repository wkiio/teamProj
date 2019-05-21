package com.kosmo.baby.service;

import java.util.List;
import java.util.Map;

public interface GuestBookService {

	//목록용
	List<Map> selectList(Map map);
	
	void insert(Map map);
	void delete(Map map);
	
	//SelectOne
	GuestBookDTO selectOne(Map map);
	
	//답변
	void update(Map map);
	int reply(Map map);
}