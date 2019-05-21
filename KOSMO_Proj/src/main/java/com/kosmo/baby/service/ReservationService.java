package com.kosmo.baby.service;

import java.util.List;
import java.util.Map;

public interface ReservationService {
	//목록용
	List<ReservationDTO> selectList(Map map);
	
	//검색용
	ReservationDTO selectOne(Map map);
	
	//평점용
	int count(Map map);
	List<ReservationDTO> selectScore(Map map);
	
	//CRUD
	int insert(Map map);
	int delete(Map map);
	int update(Map map);
	

	
}
