package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.baby.service.CalenderDTO;
import com.kosmo.baby.service.CalenderService;

@Service
public class CalenderServiceimpl implements CalenderService{
	//CalenderDAO객체 주입한다
	@Resource(name="calenderDAO")
	private CalenderDAO dao;

	@Override
	public List<CalenderDTO> selectList(Map map) {
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
	
	
	

}
