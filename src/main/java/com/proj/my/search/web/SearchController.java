package com.proj.my.search.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.proj.my.search.service.SearchService;
import com.proj.my.search.vo.SearchVO;

@Controller
public class SearchController {
	@Autowired
	SearchService searchService;
	
//	@RequestMapping("/searchDo")
//	public String searchDo(HttpServletRequest request, SearchVO search) {
//		
//		String no = request.getParameter("no");
//		String name = request.getParameter("name");
//		String address = request.getParameter("address");
//		String openingDate = request.getParameter("openingDate");
//		String status = request.getParameter("status");
//		
//		System.out.println("no = " + no);
//		System.out.println("name = " + name);
//		System.out.println("address = " + address);
//		System.out.println("openingDate = " + openingDate);
//		System.out.println("status = " + status);
//		
//		try {
//			searchService.mapSearch(search);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		return "redirect:/";

//	}
}
