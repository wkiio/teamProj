package com.kosmo.baby.service.impl;

import java.io.Reader;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kosmo.baby.service.VisitService;

@Repository
public class VisitCountDAO implements VisitService{
	
	
	public VisitCountDAO() {
		System.out.println("DAO 생성");
	}

	@Resource(name="template")
	private SqlSessionTemplate template;
	

	
	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return template.insert("insertVisit",map);
	}

	@Override
	public int getTotalCount(Map map) {
		return template.selectOne("getTotalCount", map);
	}

	@Override
	public int getTodayCount(Map map) {
		return template.selectOne("getTodayCount", map);
	}
	
	
	

	
	
}
