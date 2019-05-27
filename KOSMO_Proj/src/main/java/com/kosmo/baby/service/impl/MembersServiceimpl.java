package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kosmo.baby.service.MembersDTO;
import com.kosmo.baby.service.MembersService;

@Service
public class MembersServiceimpl implements MembersService{
	//MembersDAO객체 주입
	@Resource(name="membersDAO")
	private MembersDAO dao;
	
	
	@Override
	public boolean isMember(Map map) {
		return dao.isMember(map);
	}

	@Override
	public List<MembersDTO> selectList(Map map) {
		return dao.selectList(map);
	}

	@Override
	public MembersDTO selectOne(Map map) {
		return dao.selectOne(map);
	}

	@Override
	public int delete(Map map) {
		return dao.delete(map);
	}

	@Override
	public int insert(Map map) {
		return dao.insert(map);
	}

	@Override
	public int update(Map map) {
		return dao.update(map);
	}

	@Override
	public boolean emailConfirm(Map map) {
		return dao.emailConfirm(map);
	}

	@Override
	public String idCheck(Map map) {
		return dao.idCheck(map);
	}

	@Override
	public boolean mypageCheck(Map map) {
		return dao.mypageCheck(map);
	}

	@Override
	public int carMember(Map map) {
		return dao.carMember(map);
	}

	@Override
	public MembersDTO findId(Map map) {
		return dao.findId(map);
	}

	@Override
	public MembersDTO findPwd(Map map) {
		return dao.findPwd(map);
	}

	@Override
	public int partnerOK(Map map) {
		return dao.partnerOK(map);
	}
}
