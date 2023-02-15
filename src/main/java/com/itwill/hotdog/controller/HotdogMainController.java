package com.itwill.hotdog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.summer.mvc.Controller;

public class HotdogMainController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest arg0, HttpServletResponse arg1) {
		String forwardPath="";
		forwardPath="forward:/WEB-INF/views/hotdog_main.jsp";
		return forwardPath;
	}

}
