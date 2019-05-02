package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.kosmo.baby.service.Baby_borderDTO;
import com.kosmo.baby.service.Baby_borderService;

@Service
public class Baby_borderServiceimpl implements Baby_borderService{
	// Baby_borderDAO 객체 주입하기
	@Resource(name="baby_borderDAO")
	private Baby_borderDAO dao;
	
	@Override
	public List<Baby_borderDTO> selectList(Map map) {
		return dao.selectList(map);
	}

	@Override
	public int insert(Map map) {
		return 0;
	}

	@Override
	public int delete(Map map) {
		return 0;
	}

	@Override
	public int update(Map map) {
		return dao.update(map);
	}

	@Override
	public Baby_borderDTO selectOne(Map map) {
		return dao.selectOne(map);

	}
	
	

}
