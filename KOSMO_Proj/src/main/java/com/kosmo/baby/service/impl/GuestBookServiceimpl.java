package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.baby.service.GuestBookDTO;
import com.kosmo.baby.service.GuestBookService;

@Service("guestBookService")
public class GuestBookServiceimpl implements GuestBookService{
	
	@Resource(name="guestBookDAO")
	private GuestBookDAO dao;

	@Override
	public List<GuestBookDTO> selectList(Map map) {
		return dao.selectList(map);
	}

	@Override
	public void insert(Map map) {
		dao.insert(map);
	}

	@Override
	public void delete(Map map) {
		dao.delete(map);
		
	}

	@Override
	public void update(Map map) {
		dao.update(map);
		
	}
	
	@Override
	public int reply(Map map) {
		return dao.reply(map);
	}

	@Override
	public GuestBookDTO selectOne(Map map) {
		return dao.selectOne(map);
	}
	

}
