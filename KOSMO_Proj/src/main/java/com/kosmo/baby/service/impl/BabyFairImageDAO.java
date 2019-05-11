package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.baby.service.BabyFairImageDTO;
import com.kosmo.baby.service.BabyFairImageService;
import com.kosmo.baby.service.Baby_borderDTO;

@Repository
public class BabyFairImageDAO implements BabyFairImageService{

	
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	
	@Override
	public List<BabyFairImageDTO> selectList(Map map) {
		return template.selectList("babyFairImageList",map);
	}

	@Override
	public int insert(Map map) {
		return template.insert("babyFairImageInsert",map);
		
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return 0;
		
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return template.update("babyFairImageUpdate",map);
		
	}

	@Override
	public BabyFairImageDTO selectOne(Map map) {
		return template.selectOne("babyFairImageSelectOne",map);
	}
	
	
	
	
	
}
