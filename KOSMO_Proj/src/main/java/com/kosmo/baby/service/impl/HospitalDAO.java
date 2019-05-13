package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.baby.service.HospitalDTO;
import com.kosmo.baby.service.HospitalService;

@Repository
public class HospitalDAO implements HospitalService{
	
	@Resource(name="template")
	private SqlSessionTemplate template;

	@Override
	public List<HospitalDTO> selectList(Map map) {
		return template.selectList("hospital_List",map);
	}
	
	

}
