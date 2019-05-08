package com.kosmo.baby.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.baby.service.MembersDTO;
import com.kosmo.baby.service.MembersService;

@Repository
public class MembersDAO implements MembersService{
	@Resource(name="template")
	private SqlSessionTemplate template;
	
	@Override
	public boolean isMember(Map map) {
		//회원 판단용
		return (Integer)template.selectOne("isMember",map)==0? false : true;
	}

	@Override
	public List<MembersDTO> selectList(Map map) {
		// 전체 회원 리스트
		List<MembersDTO> list = new Vector<MembersDTO>();
		list = template.selectList("selectList",map);
		return list;
	}

	@Override
	public MembersDTO selectOne(Map map) {
		// 회원 한명 특정 셀렉트
		return template.selectOne("mypage",map);
	}

	@Override
	public int delete(Map map) {
		// 회원 탈퇴용
		return template.delete("memberdelete",map);
	}

	@Override
	public int insert(Map map) {
		// 회원 가입용
		template.insert("signup",map);
		return 0;
	}

	@Override
	public int update(Map map) {
		// 회원 정보 수정용
		template.update("emailConfirm",map);
		return 0;
	}

	@Override
	public String idCheck(Map map) {
		//회원가입시 아이디 중복체크
		return (Integer)template.selectOne("idCheck",map)==0? "true" : "false";
	}

	@Override
	public boolean emailConfirm(Map map) {
		template.update("emailConfirm",map);
		return false;
	}

	@Override
	public boolean mypageCheck(Map map) {
		return (Integer)template.selectOne("mypageCheck",map)== 1 ? true : false ;
	}

	@Override
	public int carMember(Map map) {
		return template.selectOne("carmemberCount",map);
	}

	@Override
	public MembersDTO findId(Map map) {
		return template.selectOne("findId",map);
	}

	@Override
	public MembersDTO findPwd(Map map) {
		return null;
	}
	
}
