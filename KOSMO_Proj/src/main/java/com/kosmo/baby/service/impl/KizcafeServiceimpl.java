package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.baby.service.KizcafeDTO;
import com.kosmo.baby.service.KizcafeService;

@Service
public class KizcafeServiceimpl implements KizcafeService{

	//KizcafeDAO 객체 주입
	@Resource(name="kizcafeDAO")
	private KizcafeDAO dao;
	
	@Override
	public List<KizcafeDTO> selectList(Map map) {
		System.out.println("키즈카페" + map);
		return dao.selectList(map);
	}
	@Override
	public List<KizcafeDTO> selectreview(Map map) {
		System.out.println("키즈카페1111" + map);
		return dao.selectreview(map);
	}
	
	

}
