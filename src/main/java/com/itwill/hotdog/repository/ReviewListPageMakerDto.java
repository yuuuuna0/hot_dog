package com.itwill.hotdog.repository;

import java.util.List;

import com.itwill.hotdog.common.util.PageMaker;
import com.itwill.hotdog.domain.Review;


public class ReviewListPageMakerDto {
	public List<Review> postList;
	public PageMaker pageMaker;
}
