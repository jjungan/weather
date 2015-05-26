package com.sds.icto.weather.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sds.icto.weather.domain.MemberVo;
import com.sds.icto.weather.repository.MemberDao;

@Service
public class MemberService {
	
	@Autowired
	MemberDao memberDao;

	public void joinMember(MemberVo vo){
		memberDao.insert(vo);
	}

	public MemberVo authMember(MemberVo vo) {
		MemberVo member = memberDao.getMember(vo);
		return member;
	}
	
	public void modifyMember(MemberVo vo){
		memberDao.update(vo);
	}
	
	public MemberVo selectMemberByEmail(MemberVo vo){
		MemberVo member = memberDao.getMemberByEmail(vo);
		return member;
	}
}
