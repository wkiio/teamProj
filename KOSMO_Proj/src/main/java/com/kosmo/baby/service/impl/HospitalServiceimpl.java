package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.baby.service.HospitalDTO;
import com.kosmo.baby.service.HospitalService;

@Service
public class HospitalServiceimpl implements HospitalService{
	//HospitalDAO 객체 주입
	@Resource(name="hospitalDAO")
	private HospitalDAO dao;

	
	@Override
	public List<HospitalDTO> selectList(Map map) {
		return dao.selectList(map);
	}


	@Override
	public List<HospitalDTO> selectEmer(Map map) {
		// TODO Auto-generated method stub
		return dao.selectEmer(map);
	}


	@Override
	public List<HospitalDTO> selectHos(Map map) {
		return dao.selectHos(map);
	}


	@Override
	public List<HospitalDTO> selectOb(Map map) {
		return dao.selectOb(map);
	}


	@Override
	public List<HospitalDTO> selectdent(Map map) {
		return dao.selectdent(map);
	}


	/*
	 * @Override public HospitalDTO selectOne(Map map) { // TODO Auto-generated
	 * method stub return dao.selectList(map); }
	 */

}
