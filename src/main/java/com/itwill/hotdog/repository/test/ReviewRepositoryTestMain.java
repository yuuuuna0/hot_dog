package com.itwill.hotdog.repository.test;

import com.itwill.hotdog.domain.Review;
import com.itwill.hotdog.repository.ReviewRepository;

public class ReviewRepositoryTestMain {

	public static void main(String[] args) throws Exception {
		ReviewRepository reviewDao = new ReviewRepository();
		
		//System.out.println("insert newReview");
		//reviewDao.createReview(new Review(0,null,"새리뷰입력테스트",8,0,1,0,"sy1",5));
		
		//System.out.println("insert newReply");
		//reviewDao.createReply(new Review(8,null,"이건새로답글",5,0,1,0,"sy1",5));
		
		//System.out.println(reviewDao.findReviewList(1, 3));
		
		//System.out.println(reviewDao.removeReview(10));
		
		//System.out.println("review Update");
		//reviewDao.updateReview(new Review(2,null,"리뷰수정할래요",3,0,0,0,null,0));
		
		//System.out.println(reviewDao.findReview(2));
		//System.out.println(reviewDao.getReviewCount());
	
		


	}

}
