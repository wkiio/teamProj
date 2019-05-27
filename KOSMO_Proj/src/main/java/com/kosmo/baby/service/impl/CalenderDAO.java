package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.baby.service.CalenderDTO;
import com.kosmo.baby.service.CalenderService;

@Repository
public class CalenderDAO implements CalenderService{
	@Resource(name="template")
	private SqlSessionTemplate template;

	
	@Override
	public List<CalenderDTO> selectList(Map map) {
		if(map.get("today")!=null) {
			return template.selectList("notifi",map);
		}
		else {
			return template.selectList("calList",map);
		}
	}
	
	@Override
	public int delete(Map map) {
		//캘린더 삭제
		return template.delete("caldelete",map);
	}

	@Override
	public int insert(Map map) {
		return template.insert("calinput",map);
	}

	@Override
	public int update(Map map) {
		//캘린더 수정용	
		return template.update("calupdate",map);
	}
	
	

}
