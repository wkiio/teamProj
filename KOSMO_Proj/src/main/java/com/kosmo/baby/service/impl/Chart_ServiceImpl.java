package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kosmo.baby.service.Chart_DTO;
import com.kosmo.baby.service.Chart_Service;

@Service("chartServiceImpl")
public class Chart_ServiceImpl implements Chart_Service {

	@Resource(name="chart_DAO")
	private Chart_DAO dao;	
	
	
	
	@Override
	public List<Chart_DTO> selectList(Map map) {
		
		return dao.selectList(map);
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int MemberCount(Map map) {
		
		return dao.MemberCount(map);
	}

	@Override
	public int CarpoolCount(Map map) {
		// TODO Auto-generated method stub
		return dao.CarpoolCount(map);
	}

	
	
	
}
