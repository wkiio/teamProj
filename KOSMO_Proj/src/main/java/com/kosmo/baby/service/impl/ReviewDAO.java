package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.baby.service.ReviewDTO;
import com.kosmo.baby.service.ReviewService;

@Repository
public class ReviewDAO implements ReviewService{
	
	@Resource(name="template")
	private SqlSessionTemplate template;
	
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
		return template.insert("reviewInsert", map);
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

	@Override
	public int count(Map map) {
		return template.selectOne("count",map);
	}

	@Override
	public List<ReviewDTO> selectScore(Map map) {
		return template.selectList("selectscore",map);
	}

}
