package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.baby.service.KizcafeDTO;
import com.kosmo.baby.service.KizcafeService;

@Repository
public class KizcafeDAO implements KizcafeService{
	
	@Resource(name="template")
	private SqlSessionTemplate template;

	@Override
	public List<KizcafeDTO> selectList(Map map) {
		System.out.println("키즈카페123" + map);
		return template.selectList("kizcafelist",map);
	}
	@Override
	public List<KizcafeDTO> selectreview(Map map) {
		System.out.println("키즈카페222222" + map);
		return template.selectList("kizcafereview",map);
	}
	

}
