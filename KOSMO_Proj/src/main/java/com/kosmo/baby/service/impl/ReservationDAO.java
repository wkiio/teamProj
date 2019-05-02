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
		return template.selectList("selectList",map);
	}

	@Override
	public ReservationDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	

}
