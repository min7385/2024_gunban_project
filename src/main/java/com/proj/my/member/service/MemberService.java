package com.proj.my.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.my.member.dao.IMemberDAO;
import com.proj.my.member.vo.MemberVO;

@Service
public class MemberService {
	@Autowired
	IMemberDAO dao;
	
	public void registMember(MemberVO vo) throws Exception{
		int result = dao.registMember(vo);
			
		if(result == 0 ) {
			throw new Exception();
		}
	}
	
	public MemberVO loginMember(MemberVO member) throws Exception{
		MemberVO result = dao.loginMember(member);
		System.out.println(result);
		
		if(result == null) {
			throw new Exception();
		}
		return result;
	}
}
