package com.kosmo.baby.service;

import java.util.List;
import java.util.Map;

public interface HospitalService {
	
	List<HospitalDTO> selectList(Map map);

	List<HospitalDTO> selectEmer(Map map);
	//검색용
	//HospitalDTO selectOne(Map map);	
	
}
