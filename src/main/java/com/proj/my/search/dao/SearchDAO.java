package com.proj.my.search.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.proj.my.search.vo.SearchVO;

@Mapper
public interface SearchDAO {
	
	public ArrayList<SearchVO> mapSearch ();
}
