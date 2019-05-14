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

	@Override
	public List<HospitalDTO> selectEmer(Map map) {
		// TODO Auto-generated method stub
		return template.selectList("emerlist",map);
	}

	@Override
	public List<HospitalDTO> selectHos(Map map) {
		return template.selectList("hoslist", map);
	}

	@Override
	public List<HospitalDTO> selectOb(Map map) {
		return template.selectList("obtlist",map);
	}

	@Override
	public List<HospitalDTO> selectdent(Map map) {
		return template.selectList("dentlist", map);
		
	}

	/*
	 * @Override public HospitalDTO selectOne(Map map) { // TODO Auto-generated
	 * method stub return template.selectOne("emerlist",map); }
	 */
	

}
