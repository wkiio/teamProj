package com.kosmo.baby.service;

import java.util.List;
import java.util.Map;

public interface Chart_Service {

	
	List<Chart_DTO> selectList(Map map);	

	int update(Map map);
	
	int MemberCount(Map map);
	
	int CarpoolCount(Map map);


	
}
