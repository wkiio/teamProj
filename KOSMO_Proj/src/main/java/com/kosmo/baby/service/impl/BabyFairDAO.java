package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.baby.service.BabyFairDTO;
import com.kosmo.baby.service.BabyFairService;

@Repository
public class BabyFairDAO implements BabyFairService {
	
	@Resource(name="template")
	private SqlSessionTemplate template;
	

	@Override
	public List<BabyFairDTO> selectList(Map map) {
		return template.selectList("babyFairList",map);
	}

	@Override
	public BabyFairDTO selectOne(Map map) {
		System.out.println("베이비페어 DAO");
		return template.selectOne("babyFairselectOne",map);
	}

	@Override
	public int insert(Map map) {
		System.out.println("베이비페어 DAO");
		return template.insert("babyFairInsert",map);
	}

	@Override
	public int delete(Map map) {
		return 0;
	}

	@Override
	public int update(Map map) {
		return template.update("babyFairUpdate",map);
	}

	@Override
	public int seachEvent(Map map) {
		return template.selectOne("babyFairseachOne",map);
	}
	

}
