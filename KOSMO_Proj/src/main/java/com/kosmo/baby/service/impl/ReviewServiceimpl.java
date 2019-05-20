package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.baby.service.ReviewDTO;
import com.kosmo.baby.service.ReviewService;

@Service
public class ReviewServiceimpl implements ReviewService{
	
	@Resource(name="reviewDAO")
	private ReviewDAO dao;
	
	@Override
	public List<ReviewDTO> selectList(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReviewDTO selectOne(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insert(Map map) {
	// TODO Auto-generated method stub
		return dao.insert(map);
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
