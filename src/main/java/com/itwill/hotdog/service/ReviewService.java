package com.itwill.hotdog.service;

import java.util.ArrayList;
import java.util.List;

import com.itwill.hotdog.common.util.PageMaker;
import com.itwill.hotdog.domain.Review;
import com.itwill.hotdog.domain.ReviewListPageMakerDto;
import com.itwill.hotdog.repository.ReviewRepository;


public class ReviewService {
	
	private ReviewRepository reviewRepository;
	
	public ReviewService() throws Exception {
		reviewRepository = new ReviewRepository();
	}

/*
 * 리뷰 생성	
 */
	public int createReview(Review review) throws Exception {
		return reviewRepository.createReview(review);
	}

/*
 * 답글 생성	
 */
	public int createReply(Review review) throws Exception{
		return reviewRepository.createReply(review);
	}

/*
 * 리뷰 1개 (r_no)
 */
	public Review findReviewNo(int r_no) throws Exception{
		Review review = reviewRepository.findReviewNo(r_no);
		return review;
	}
	
/*
 * 리뷰 리스트(p_no)	
 */
	
	public ArrayList<Review> fineReviewPno(int p_no) throws Exception{
		return reviewRepository.findReviewPno(p_no);
	}
	
/*
* 리뷰 리스트(u_id)	
*/
	
	public ArrayList<Review> fineReviewId(String u_id) throws Exception{
		return reviewRepository.findReviewId(u_id);
	}
	
/*
 * 리뷰 리스트(r_groupno)	
 */
	
	public ArrayList<Review> fineReviewGno(int r_groupno) throws Exception{
		return reviewRepository.findReviewGno(r_groupno);
	}

	
/*
 * 리뷰 리스트(all)
 */	
	public ReviewListPageMakerDto findReviewList(int currentPage) throws Exception{
		//1.전체글의 갯수
		int totalRecordCount = reviewRepository.getReviewCount();
		
		//2.paging계산 (PageMaker 유틸클래스)
		PageMaker pageMaker = new PageMaker(totalRecordCount, currentPage);
		
		//3.리뷰데이타 얻기
		List<Review> reviewList =
				reviewRepository.findReviewList(pageMaker.getPageBegin(), pageMaker.getPageEnd());
		
		ReviewListPageMakerDto pageMakerReviewList = new ReviewListPageMakerDto();
		pageMakerReviewList.postList = reviewList;
		pageMakerReviewList.pageMaker = pageMaker;		
		
		return pageMakerReviewList;
		
	}

	
	
/*
 * 리뷰 수정
 */
	public int updateReview(Review review) throws Exception{
		return reviewRepository.updateReview(review);
	}

/*
 * 리뷰 삭제
 */	
	public int remove(int r_no) throws Exception{
		return reviewRepository.removeReview(r_no);
	}

	
}
