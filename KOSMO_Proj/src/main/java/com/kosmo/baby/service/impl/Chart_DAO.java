package com.kosmo.baby.service.impl;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.baby.service.Chart_DTO;
import com.kosmo.baby.service.Chart_Service;

@Repository
public class Chart_DAO implements Chart_Service {

	@Resource(name="template")
	private SqlSessionTemplate sqltemplate;	

	@Override
	public List<Chart_DTO> selectList(Map map) {
		return sqltemplate.selectList("SelectList",map);
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int MemberCount(Map map) {
		
		return (Integer)sqltemplate.selectOne("MemberCount",null);
	}

	@Override
	public int CarpoolCount(Map map) {
		
		return (Integer)sqltemplate.selectOne("CarpoolCount",null);
	}
	
	
	
	
	
	
}
