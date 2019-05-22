package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.baby.service.GuestBookDTO;
import com.kosmo.baby.service.GuestBookService;

@Repository
public class GuestBookDAO implements GuestBookService{

	@Resource(name="template")
	private SqlSessionTemplate template;

	@Override
	public List<GuestBookDTO> selectList(Map map) {
		return template.selectList("commentSelectList", map);
	}

	@Override
	public void insert(Map map) {
		template.insert("commentInsert",map);
		
	}

	@Override
	public void delete(Map map) {
		template.delete("commentDelete",map);
	}

	@Override
	public void update(Map map) {
		template.update("commentUpdate",map);
		
	}

	@Override
	public int reply(Map map) {
		int updateCount=template.update("ReplyUpdate",map);
		int insertCount=template.insert("ReplyInsert",map);
		return insertCount;
	}

	@Override
	public GuestBookDTO selectOne(Map map) {
		return template.selectOne("selectOne",map);
	}

}
