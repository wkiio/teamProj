package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.baby.service.ReservationDTO;
import com.kosmo.baby.service.ReservationService;

@Repository
public class ReservationDAO implements ReservationService{
	@Resource(name="template")
	private SqlSessionTemplate template;

	@Override
	public List<ReservationDTO> selectList(Map map) {
		return template.selectList("rselectList",map);
	}

	@Override
	public ReservationDTO selectOne(Map map) {
		return null;
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Map map) {
		return template.update("return",map);
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return template.update("gradeupdate", map);
	}

	@Override
	public int count(Map map) {
		return template.selectOne("resercount",map);
	}

	@Override
	public List<ReservationDTO> selectScore(Map map) {
		return template.selectList("totalscore",map);
	}

	@Override
	public List<ReservationDTO> previous(Map map) {
		return template.selectList("previous",map);
	}
	
	

}
