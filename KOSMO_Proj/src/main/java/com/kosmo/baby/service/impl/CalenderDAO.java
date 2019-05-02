package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.baby.service.CalenderService;

@Repository
public class CalenderDAO implements CalenderService{
	@Resource(name="template")
	private SqlSessionTemplate template;

	
	@Override
	public List<Map> selectList(Map map) {
		//목록 뿌려주기용
		return null;
	}
	
	@Override
	public int delete(Map map) {
		//캘린더 삭제
		return 0;
	}

	@Override
	public int insert(Map map) {
		//캘린더 입력
		return 0;
	}

	@Override
	public int update(Map map) {
		//캘린더 수정용
		
		return 0;
	}
	
	

}
