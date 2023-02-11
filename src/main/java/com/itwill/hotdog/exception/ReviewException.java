package com.itwill.hotdog.exception;

public class ReviewException extends Exception {
	public ReviewException(){
		this("게시판 관련 에러 발생");
	}
	public ReviewException(String errorMsg){
		super(errorMsg);
	}
	public ReviewException(String errorMsg, Throwable cause){
		super(errorMsg, cause);
	}	
}
