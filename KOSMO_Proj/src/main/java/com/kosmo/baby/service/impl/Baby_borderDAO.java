package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.baby.service.Baby_borderDTO;
import com.kosmo.baby.service.Baby_borderService;

@Repository
public class Baby_borderDAO implements Baby_borderService{
	
	@Resource(name="template")
	private SqlSessionTemplate template;
	

	@Override
	public List<Baby_borderDTO> selectList(Map map) {
		return template.selectList("babyList",map);
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return 0;
		
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return 0;
		
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return template.update("babyUpdate",map);
		
	}

	@Override
	public Baby_borderDTO selectOne(Map map) {
		return template.selectOne("babySelectOne",map);
	}
	
	

}
