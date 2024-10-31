package com.proj.my.member.web;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.proj.my.member.service.MemberService;
import com.proj.my.member.vo.MemberVO;
import com.proj.my.search.service.SearchService;
import com.proj.my.search.vo.SearchVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	SearchService searchService;
	
	@RequestMapping("/registView")
	public String registView() {
		return "member/registView";
	}
	
	@RequestMapping("/registDo")
	public String registDo(HttpServletRequest request, MemberVO member) {
		
		String id = request.getParameter("memId");
		String pw = request.getParameter("memPw");
		String name = request.getParameter("memName");
		
		System.out.println("id = " + id);
		System.out.println("pw = " + pw);
		System.out.println("name = " + name);
		
		try {
			memberService.registMember(member);
		} catch (Exception e) {
			e.printStackTrace();
			return "errorPage";
		}
		
		return "redirect:/";
	}

	
	
	@RequestMapping("/loginView")
	public String loginView() {
		return "member/loginView";
	}
	
	@RequestMapping("/loginDo")
	public String loginDo(MemberVO member, HttpSession session, boolean remember, String fromUrl, HttpServletResponse response) throws Exception {

		System.out.println(member);
		System.out.println(response);
		
		MemberVO login = memberService.loginMember(member);
		
		session.setAttribute("login", login);
		
		if(remember) {
			// 쿠키 생성
			Cookie cookie = new Cookie("rememberId", member.getMemId());
			// 응답하는 객체에 붙여준다
			response.addCookie(cookie);
		}else {
			// 쿠키삭제(동일한 key 값을 가지는 쿠키를 생성 후 유효기간을 0으로 만든다)
			Cookie cookie = new Cookie("rememberId", "");
			cookie.setMaxAge(0);
			
			// 유효기간 0짜리인 쿠키를 응답하는 객체에 붙여준다.
			response.addCookie(cookie);
		}
		System.out.println(login);
		// 로그인 시 해당 페이지로 돌아가기
		return "redirect:/";
	}
	
	@RequestMapping("/logoutDo")
	public String logoutDo(HttpSession session) {
		// 세션 종류
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping("/hospital")
	public String hospital(Model model) {

		//db 동물병원 
		ArrayList<SearchVO> mapList = searchService.mapSearch();
		model.addAttribute("mapList",mapList);
		
		return "member/Hospital";
	}
	
	
	
}
