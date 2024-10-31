package com.proj.my.search.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.my.search.dao.SearchDAO;
import com.proj.my.search.vo.SearchVO;

@Service
public class SearchService {
	@Autowired
	SearchDAO dao;
	
	public ArrayList<SearchVO> mapSearch(){
		return dao.mapSearch();
	}
}
