package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.baby.service.Carpool_borderDTO;
import com.kosmo.baby.service.Carpool_borderService;

@Repository
public class Carpool_borderDAO implements Carpool_borderService{
	
	@Resource(name="template")
	private SqlSessionTemplate template;

	@Override
	public List<Carpool_borderDTO> selectList(Map map) {
		System.out.println("DAO");
		return template.selectList("carList",map);
	}

	@Override
	public int delete(Map map) {
		System.out.println("딜리트DAO");
		return template.delete("cardelete",map);
	}

	@Override
	public int insert(Map map) {
		return template.insert("carInsert",map);
	}

	@Override
	public int update(Map map) {
		System.out.println("업데이트 dao");
		return template.update("Carupdate",map);
	}

	@Override
	public Carpool_borderDTO selectOne(Map map) {
		return template.selectOne("carview", map);
	}

	@Override
	public int adminInsert(Map map) {
		return template.insert("adminInsert",map);
	}

	@Override
	public int CBoardCount(Map map) {
		// TODO Auto-generated method stub
		return template.selectOne("CBoardCount", map);
	}

	

}
