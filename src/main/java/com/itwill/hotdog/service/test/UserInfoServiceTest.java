package com.itwill.hotdog.service.test;

import com.itwill.hotdog.domain.UserInfo;
import com.itwill.hotdog.service.UserInfoService;

public class UserInfoServiceTest {

	public static void main(String[] args) throws Exception {
		UserInfoService userService = new UserInfoService();
		System.out.println("1.회원가입");
		System.out.println(userService.create(new UserInfo("ks1","1111","김형석","111-111",1000)));
		//System.out.println("2.로그인");
		//System.out.println(userService.login("ks1", "1111"));
		//System.out.println("3.회원상세보기");
		//System.out.println(userService.findUser("ks1"));
		//System.out.println("4.회원수정");
	//	System.out.println(userService.update(new UserInfo("ks1", "2222", "이형석", "222-222", 4000)));
	//	System.out.println("회원탈퇴");
	//	System.out.println(userService.remove("ks1"));
	 }
	

}
