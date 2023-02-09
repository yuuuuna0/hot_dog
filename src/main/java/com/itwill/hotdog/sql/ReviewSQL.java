package com.itwill.hotdog.sql;

public class ReviewSQL {

		public static final String REVIEW_INSERT_NEW = "insert into review values(REVIEW_R_NO_SEQ.nextval,sysdate,?,?,REVIEW_R_NO_SEQ.currval,1,0,?,?)";
		public static final String REVIEW_INSERT_REPLY = "insert into review values(REVIEW_R_NO_SEQ.nextval,sysdate,?,null,?,?,?,?,?)";

		public static final String REVIEW_UPDATE = "update review set r_comment=?, r_grade=? where r_no = ?";
		
		public static final String REVIEW_DELETE = "delete review where r_no=?";
		
		public static final String REVIEW_SELECT_BY_NO = "select * from review where r_no=? order by r_groupno desc, r_step asc";
		public static final String REVIEW_SELECT_BY_PNO = "select * from review where p_no=? order by r_groupno desc, r_step asc";
		public static final String REVIEW_SELECT_BY_ID = "select * from review where u_id=? order by r_groupno desc, r_step asc";
		public static final String REVIEW_SELECT_BY_GNO = "select * from review where r_groupno=? order by r_groupno desc, r_depth asc, r_step asc";
		public static final String REVIEW_SELECT_LIST = "SELECT * FROM (SELECT rownum idx, s.* FROM ( SELECT * FROM review ORDER BY r_groupno DESC, r_step ASC ) s ) WHERE idx >= ? AND idx <= ?";
		
		public static final String REVIEW_COUNT = "select count(*) from review";
		
	
	}

	
