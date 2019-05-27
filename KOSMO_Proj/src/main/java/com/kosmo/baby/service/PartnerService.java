package com.kosmo.baby.service;

import java.util.List;
import java.util.Map;

public interface PartnerService {
	// 목록용
	List<PartnerDTO> selectList(Map map);
	//관리자 카풀 파트너원
	PartnerDTO partnerOne(Map map);
	

	// 입력수정삭제용
	int delete(Map map);

	int insert(Map map);

	int update(Map map);
}
