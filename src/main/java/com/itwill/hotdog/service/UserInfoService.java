package com.itwill.hotdog.service;

import com.itwill.hotdog.repository.UserInfoRepository;
import com.itwill.hotdog.domain.UserInfo;

public class UserInfoService {
	private UserInfoRepository UserInfo;
	public UserInfoService() throws Exception{
		UserInfo=new UserInfoRepository();
	}
	/*
	 * 회원가입
	 */
	public int create(UserInfo user)throws Exception{
		/*
		 * -1:아이디중복
		 *  1:회원가입성공
		 */
		if(UserInfo.countByUserId(user.getU_id())==1){
			//아이디중복
			return -1;
		}else {
			//아이디안중복
			//2.회원가입
			int insertRowCount = UserInfo.insert(user);
			return insertRowCount;
		}
	}
	
	public int login(String u_id,String u_password) throws Exception{
		int result=-1;
		//1.아이디존재여부
		UserInfo user = UserInfo.findUser(u_id);
		if(user==null) {
			//아이디존재안함
			result=0;
		}else {
			//아이디존재함
			if(user.isMatchPassword(u_password)) {
				//패쓰워드 일치
				result=2;
			}else {
				//패쓰워드 불일치
				result=1;
			}
		}
		
		return result;
	}
	/*
	 * 회원상세보기
	 */
	public UserInfo findUser(String u_id)throws Exception{
		return UserInfo.findUser(u_id);
	}
	/*
	 * 회원수정
	 */
	public int update(UserInfo user)throws Exception{
		return UserInfo.update(user);
	}
	
	/*
	 * 회원탈퇴
	 */
	public int remove(String u_id)throws Exception{
		return UserInfo.delete(u_id);
	}
	
}

