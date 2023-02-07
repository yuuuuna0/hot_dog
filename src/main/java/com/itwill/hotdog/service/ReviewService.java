package com.itwill.hotdog.service;

import java.util.List;

import com.itwill.hotdog.common.util.PageMaker;
import com.itwill.hotdog.domain.Review;
import com.itwill.hotdog.domain.ReviewListPageMakerDto;
import com.itwill.hotdog.repository.ReviewRepository;


public class ReviewService {
	private static ReviewService _instance;
	
	private ReviewRepository reviewDao;
	
	public ReviewService() throws Exception{
		reviewDao = new ReviewRepository();
	}
	
	public static ReviewService getInstance() throws Exception{
		if(_instance==null) {
			_instance=new ReviewService();
		}
	return _instance;
	}

/*
 * 리뷰 생성	
 */
	public int createReview(Review review) throws Exception {
		return reviewDao.createReview(review);
	}

/*
 * 답글 생성	
 */
	public int createReply(Review review) throws Exception{
		return reviewDao.createReply(review);
	}

/*
 * 리뷰 1개 (r_no)
 */
	public Review findReview(int r_no) throws Exception{
		Review review = reviewDao.findReview(r_no);
		return review;
	}
	
/*
 * 리뷰 리스트
 */	
	public ReviewListPageMakerDto findReviewList(int currentPage) throws Exception{
		//1.전체글의 갯수
		int totalRecordCount = reviewDao.getReviewCount();
		
		//2.paging계산 (PageMaker 유틸클래스)
		PageMaker pageMaker = new PageMaker(totalRecordCount, currentPage);
		
		//3.리뷰데이타 얻기
		List<Review> reviewList =
				reviewDao.findReviewList(pageMaker.getPageBegin(), pageMaker.getPageEnd());
		
		ReviewListPageMakerDto pageMakerReviewList = new ReviewListPageMakerDto();
		pageMakerReviewList.postList = reviewList;
		pageMakerReviewList.pageMaker = pageMaker;		
		
		return pageMakerReviewList;
		
	}

	
	
/*
 * 리뷰 수정
 */
	public int updateReview(Review review) throws Exception{
		return reviewDao.updateReview(review);
	}

/*
 * 리뷰 삭제
 */	
	public int remove(int r_no) throws Exception{
		return reviewDao.removeReview(r_no);
	}

	
}
