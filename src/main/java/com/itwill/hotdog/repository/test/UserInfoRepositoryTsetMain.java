package com.itwill.hotdog.repository.test;

import com.itwill.hotdog.domain.UserInfo;
import com.itwill.hotdog.repository.UserInfoRepository;

public class UserInfoRepositoryTsetMain {
	public static void main(String[] args)throws Exception {
		UserInfoRepository userDao = new UserInfoRepository();
		//회원 추가
		System.out.println("1.insert:"+userDao.insert(new UserInfo("sy4","4444","테스트","444-444",1200)));
		//회원 정보 수정
		//System.out.println("2.update"+userDao.update(new UserInfo("sy4", "2478", "테스", "222-222", 1200)));
		//sy4 회원 찾기
		//System.out.println("3.fidUser:"+userDao.findUser("sy4"));
		//sy4 회원 삭제
		//System.out.println("4.remove:"+userDao.delete("sy4"));
		//모든 회원 리스트
		//System.out.println("5.findUserList"+userDao.findUserList());
		//회원 가입 여부
		//System.out.println("6.existedUser"+userDao.countByUserId("sy0"));
		//System.out.println("6.existedUser"+userDao.countByUserId("sy1"));
		//System.out.println("6.existedUser"+userDao.countByUserId("sy2"));
	}
}
