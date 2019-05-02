package com.kosmo.baby.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kosmo.baby.service.VisitService;


@Service
public class VisitCountServiceimpl implements VisitService{
	
	
	public VisitCountServiceimpl() {
		System.out.println("임플 생성");
	}

	//MembersDAO객체 주입
	@Resource(name="visitCountDAO")
	private VisitCountDAO dao;
	

	
	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}

	@Override
	public int getTotalCount(Map map) {
		return dao.getTotalCount(map);
	}

	@Override
	public int getTodayCount(Map map) {
		return dao.getTodayCount(map);
	}

	

	

	
}
