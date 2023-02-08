package com.itwill.hotdog.service;

import com.itwill.hotdog.repository.UserInfoRepository;
import com.itwill.hotdog.domain.UserInfo;
import com.itwill.hotdog.exception.ExistedUserException;

public class UserInfoService {
	private UserInfoRepository userInfo;
	public UserInfoService() throws Exception{
		userInfo=new UserInfoRepository();
	}
	/*
	 * 회원가입
	 */
	public int create(UserInfo user)throws Exception{
		// 1.아이디중복체크
				if (userInfo.existedUser(user.getU_id())) {
					throw new ExistedUserException(user.getU_id() + " 는 이미존재하는 아이디입니다.");
				}
				return userInfo.insert(user);

			}

	
	public int login(String u_id,String u_password) throws Exception{
		int result=-1;
		//1.아이디존재여부
		UserInfo user = userInfo.findUser(u_id);
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
		return userInfo.findUser(u_id);
	}
	/*
	 * 회원수정
	 */
	public int update(UserInfo user)throws Exception{
		return userInfo.update(user);
	}
	
	/*
	 * 회원탈퇴
	 */
	public int remove(String u_id)throws Exception{
		return userInfo.delete(u_id);
	}
	/*
	 * 회원중복여부
	 */
	public boolean isDuplicateId(String userId) throws Exception {
		boolean isExist = userInfo.existedUser(userId);
		if (isExist) {
			return true;
		} else {
			return false;
		}
	}
}

