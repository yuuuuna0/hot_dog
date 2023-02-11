package com.itwill.hotdog.service;

import java.util.ArrayList;
import java.util.List;

import com.itwill.hotdog.common.util.PageMaker;
import com.itwill.hotdog.domain.Review;
import com.itwill.hotdog.domain.ReviewListPageMakerDto;
import com.itwill.hotdog.exception.ReviewException;
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
	
	public ReviewListPageMakerDto findReviewPno(int currentPage,int p_no) throws Exception{
		//1.전체글의 갯수
		int totalRecordCount = reviewRepository.getReviewCountPno(p_no);
		
		
		//2.paging계산 (PageMaker 유틸클래스)
		PageMaker pageMaker = new PageMaker(totalRecordCount, currentPage);
		
		//3.리뷰데이타 얻기
		List<Review> reviewList =
				reviewRepository.findReviewList(pageMaker.getPageBegin(), pageMaker.getPageEnd(), p_no);
		
		ReviewListPageMakerDto pageMakerReviewList = new ReviewListPageMakerDto();
		pageMakerReviewList.postList = reviewList;
		pageMakerReviewList.pageMaker = pageMaker;		
		
		return pageMakerReviewList;
		
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
	
	public ReviewListPageMakerDto findReviewGno(int currentPage,int r_groupNo) throws Exception{
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
	public int remove(int r_no) throws Exception,ReviewException{
		Review tempReview = reviewRepository.findReviewNo(r_no);
		boolean rExist= reviewRepository.countReply(tempReview);
		if(reviewRepository.countReply(tempReview)) {
			//답글존재
			throw new ReviewException(" 답변이 있는 게시물은 삭제 불가능합니다.");
		}else {
			//답글x
			return reviewRepository.removeReview(tempReview.getR_no());
		}
	}

		
}
