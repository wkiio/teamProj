package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.baby.service.BabyFairDTO;
import com.kosmo.baby.service.BabyFairService;

@Service
public class BabyFairServiceimpl implements BabyFairService {
	
	
	@Resource(name="babyFairDAO")
	private BabyFairDAO dao;

	@Override
	public List<BabyFairDTO> selectList(Map map) {
		return dao.selectList(map);
	}

	@Override
	public BabyFairDTO selectOne(Map map) {
		return dao.selectOne(map);
	}

	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}

	@Override
	public int delete(Map map) {
		return dao.delete(map);
	}

	@Override
	public int update(Map map) {
		return dao.update(map);
	}

	@Override
	public int seachEvent(Map map) {
		return dao.seachEvent(map);
	}

	

}
