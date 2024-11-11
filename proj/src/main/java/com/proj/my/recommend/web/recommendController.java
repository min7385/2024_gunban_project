package com.proj.my.recommend.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class recommendController {
	
	@RequestMapping("/recommendView")
	public String recommendView() {
		return "recommend/recommendView";
	}

}
