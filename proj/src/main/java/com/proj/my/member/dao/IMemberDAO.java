package com.proj.my.member.dao;

import org.apache.ibatis.annotations.Mapper;

import com.proj.my.member.vo.MemberVO;

@Mapper
public interface IMemberDAO {
	
	public int registMember(MemberVO vo);
	public MemberVO loginMember(MemberVO member);
	
}
