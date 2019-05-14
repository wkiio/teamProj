package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.baby.service.BabyFairImageDTO;
import com.kosmo.baby.service.BabyFairImageService;


@Service
public class BabyFairImageServiceImple implements BabyFairImageService{

	
	@Resource(name="babyFairImageDAO")
	private BabyFairImageDAO dao;
	
	@Override
	public List<BabyFairImageDTO> selectList(Map map) {
		return dao.selectList(map);
	}

	@Override
	public BabyFairImageDTO selectOne(Map map) {
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

}
