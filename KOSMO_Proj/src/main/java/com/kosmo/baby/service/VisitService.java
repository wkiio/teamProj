package com.kosmo.baby.service;

import java.util.Map;

public interface VisitService {

	int getTotalCount(Map map);	
	int getTodayCount(Map map);
	//입력수정삭제용
	int insert(Map map);
	
}
