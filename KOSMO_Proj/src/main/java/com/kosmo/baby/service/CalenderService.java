package com.kosmo.baby.service;

import java.util.List;
import java.util.Map;

public interface CalenderService {
	
	//CRUD 작업용
	
	//목록
	List<Map> selectList(Map map);	
	
	//입력 수정 삭제
	int delete(Map map);
	int insert(Map map);
	int update(Map map);

}
