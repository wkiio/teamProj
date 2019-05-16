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
		return template.selectList("kizcafelist",map);
	}
	

}
