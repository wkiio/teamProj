package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.baby.service.PartnerDTO;
import com.kosmo.baby.service.PartnerService;

@Service
public class PartnerServiceimpl implements PartnerService{
	//PartnerDAO 객체 주입
	@Resource(name ="partnerDAO")
	private PartnerDAO dao;

	@Override
	public List<PartnerDTO> selectList(Map map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
