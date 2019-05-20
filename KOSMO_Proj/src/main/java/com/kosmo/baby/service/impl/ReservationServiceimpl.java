package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kosmo.baby.service.ReservationDTO;
import com.kosmo.baby.service.ReservationService;

@Service
public class ReservationServiceimpl implements ReservationService{
	//ReservationDAO 객체 주입
	@Resource(name="reservationDAO")
	private ReservationDAO dao;

	
	@Override
	public List<ReservationDTO> selectList(Map map) {
		return dao.selectList(map);
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
		return dao.delete(map);
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return dao.update(map);
	}

	@Override
	public int count(Map map) {
		return dao.count(map);
	}

	@Override
	public List<ReservationDTO> selectScore(Map map) {
		return dao.selectScore(map);
	}
	
	

}
