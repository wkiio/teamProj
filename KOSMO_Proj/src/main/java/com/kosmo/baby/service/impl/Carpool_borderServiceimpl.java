package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.baby.service.Carpool_borderDTO;
import com.kosmo.baby.service.Carpool_borderService;

@Service
public class Carpool_borderServiceimpl implements Carpool_borderService{
	@Resource(name="carpool_borderDAO")
	private Carpool_borderDAO dao;

	
	@Override
	public List<Carpool_borderDTO> selectList(Map map) {
		return dao.selectList(map);
	}

	@Override
	public int delete(Map map) {
		return dao.delete(map);
	}

	@Override
	public int insert(Map map) {	
		return dao.insert(map);
	}

	@Override
	public int update(Map map) {
		return dao.update(map);
	}

	@Override
	public Carpool_borderDTO selectOne(Map map) {
		return dao.selectOne(map);
	}

	@Override
	public int adminInsert(Map map) {
		
		return dao.adminInsert(map);
	}

	@Override
	public int CBoardCount(Map map) {
		// TODO Auto-generated method stub
		return dao.CBoardCount(map);
	}
	@Override
	public List<Carpool_borderDTO> seList(Map map) {
		return dao.seList(map);
	}
	@Override
	public int yesupdate(Map map) {
		System.out.println("완료 서비스");
		return dao.yesupdate(map);
	}
	

}
