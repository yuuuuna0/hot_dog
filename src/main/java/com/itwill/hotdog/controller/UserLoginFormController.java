package com.itwill.hotdog.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwill.hotdog.domain.UserInfo;
import com.itwill.summer.mvc.Controller;

public class UserLoginFormController implements Controller {

	@Override
	public String handleRequest(HttpServletRequest request, HttpServletResponse response) {
		String forwardPath="";
		String msg1=(String)request.getAttribute("msg1");
		if(msg1==null)msg1="";
		String msg2=(String)request.getAttribute("msg2");
		if(msg2==null)msg2="";
		UserInfo fuser=(UserInfo)request.getAttribute("fuser");
		if(fuser==null){
			fuser=new UserInfo("","","","",0);
		}
		forwardPath="forward:/WEB-INT/views/user_login_form.jsp";
		return forwardPath;
	}

}
