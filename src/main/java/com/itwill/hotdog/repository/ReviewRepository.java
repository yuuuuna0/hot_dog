package com.itwill.hotdog.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.hotdog.common.DataSourceFactory;
import com.itwill.hotdog.domain.Review;
import com.itwill.hotdog.sql.ReviewSQL;

public class ReviewRepository {
	
	private DataSource dataSource;
	
	
	public ReviewRepository() throws Exception {
		  dataSource=DataSourceFactory.getDataSource();
	}


/*새로운 리뷰 작성*/
public int createReview(Review review) throws Exception { 
	Connection con = null;
	PreparedStatement pstmt = null; 
	try {
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(ReviewSQL.REVIEW_INSERT_NEW);
		pstmt.setString(1, review.getR_comment());
		pstmt.setInt(2, review.getR_grade());
		pstmt.setString(3, review.getU_id());
		pstmt.setInt(4, review.getP_no());
		
		int result = pstmt.executeUpdate();
		return result;
		
	}finally {
		con.close();
	}
	
}

/*리뷰 답글 작성*/
public int createReply(Review review) throws Exception{
	Connection con = null;
	PreparedStatement pstmt = null;
	int count = 0;
	try {
		// 답글을 작성할 대상글(원글)의 정보를 조회
		Review temp = this.findReviewNo(review.getR_no());
		
		// 영향을 받는 기존 글들의 논리적인 순서 번호 변경
		con = dataSource.getConnection();
		String sql = "UPDATE review " + "SET r_step = r_step + 1 " + "WHERE r_step > ? AND r_groupno = ?";
		pstmt = con.prepareStatement(sql.toString());
		pstmt.setInt(1, temp.getR_step()); // step 번호
		pstmt.setInt(2, temp.getR_groupNo());// group 번호
		pstmt.executeUpdate();
		pstmt.close();
		
		// 답글 삽입
		pstmt = con.prepareStatement(ReviewSQL.REVIEW_INSERT_REPLY);
		pstmt.setString(1, review.getR_comment()); // 내용
		pstmt.setInt(2, temp.getR_groupNo()); // group no
		pstmt.setInt(3, temp.getR_step()+1); // step
		pstmt.setInt(4, temp.getR_depth()+1);// depth
		pstmt.setString(5, review.getU_id()); // 작성자
		pstmt.setInt(6, review.getP_no()); //상품번호
		
		count = pstmt.executeUpdate();
		
	}finally {
		try {
			if(pstmt != null)
				pstmt.close();
		}catch (Exception ex) {

		}try {
			if(con != null)
				con.close();
		}catch (Exception ex) {
		}
		
	}
	
	return count;
}

/* 리뷰 리스트를 반환(게시물시작번호,게시물끝번호)*/
public ArrayList<Review> findReviewList(int start, int last) throws Exception{
	System.out.println("" + start + " ~ " + last);
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	ArrayList<Review> reviews = new ArrayList<Review>();
	try {
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(ReviewSQL.REVIEW_SELECT_LIST);
		pstmt.setInt(1, start);
		pstmt.setInt(2, last);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Review review = new Review();
			review.setR_no(rs.getInt("r_no"));
			review.setR_date(rs.getDate("r_date"));
			review.setR_comment(rs.getString("r_comment"));
			review.setR_grade(rs.getInt("r_grade"));
			review.setR_groupNo(rs.getInt("r_groupNo"));
			review.setR_step(rs.getInt("r_step"));
			review.setR_depth(rs.getInt("r_depth"));
			review.setU_id(rs.getString("u_id"));
			review.setP_no(rs.getInt("p_no"));
			
			reviews.add(review);
		}
		
	}finally {
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (Exception ex) {
			}
		if (con != null)
			try {
				con.close();
			} catch (Exception ex) {
			}
	}
	
	
return reviews;
}

/* 해당 상품 리뷰리스트 */
public ArrayList<Review> findReviewPno(int p_no) throws Exception{
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	ArrayList<Review> reviews = new ArrayList<Review>();
	try {
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(ReviewSQL.REVIEW_SELECT_BY_PNO);
		pstmt.setInt(1, p_no);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Review review = new Review();
			review.setR_no(rs.getInt("r_no"));
			review.setR_date(rs.getDate("r_date"));
			review.setR_comment(rs.getString("r_comment"));
			review.setR_grade(rs.getInt("r_grade"));
			review.setR_groupNo(rs.getInt("r_groupNo"));
			review.setR_step(rs.getInt("r_step"));
			review.setR_depth(rs.getInt("r_depth"));
			review.setU_id(rs.getString("u_id"));
			review.setP_no(rs.getInt("p_no"));
			
			reviews.add(review);
		}
		
	}finally {
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (Exception ex) {
			}
		if (con != null)
			try {
				con.close();
			} catch (Exception ex) {
			}
	}
	
	
return reviews;
}

/* 해당 아이디 리뷰리스트 */
public ArrayList<Review> findReviewId(String u_id) throws Exception{
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	ArrayList<Review> reviews = new ArrayList<Review>();
	try {
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(ReviewSQL.REVIEW_SELECT_BY_ID);
		pstmt.setString(1, u_id);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Review review = new Review();
			review.setR_no(rs.getInt("r_no"));
			review.setR_date(rs.getDate("r_date"));
			review.setR_comment(rs.getString("r_comment"));
			review.setR_grade(rs.getInt("r_grade"));
			review.setR_groupNo(rs.getInt("r_groupNo"));
			review.setR_step(rs.getInt("r_step"));
			review.setR_depth(rs.getInt("r_depth"));
			review.setU_id(rs.getString("u_id"));
			review.setP_no(rs.getInt("p_no"));
			
			reviews.add(review);
		}
		
	}finally {
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (Exception ex) {
			}
		if (con != null)
			try {
				con.close();
			} catch (Exception ex) {
			}
	}
	
	
	return reviews;
}
/* 해당 그룹넘버 리뷰리스트 */
public ArrayList<Review> findReviewGno(int r_gropno) throws Exception{
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	ArrayList<Review> reviews = new ArrayList<Review>();
	try {
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(ReviewSQL.REVIEW_SELECT_BY_GNO);
		pstmt.setInt(1, r_gropno);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Review review = new Review();
			review.setR_no(rs.getInt("r_no"));
			review.setR_date(rs.getDate("r_date"));
			review.setR_comment(rs.getString("r_comment"));
			review.setR_grade(rs.getInt("r_grade"));
			review.setR_groupNo(rs.getInt("r_groupNo"));
			review.setR_step(rs.getInt("r_step"));
			review.setR_depth(rs.getInt("r_depth"));
			review.setU_id(rs.getString("u_id"));
			review.setP_no(rs.getInt("p_no"));
			
			reviews.add(review);
		}
		
	}finally {
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (Exception ex) {
			}
		if (con != null)
			try {
				con.close();
			} catch (Exception ex) {
			}
	}
	
	
	return reviews;
}





/*리뷰 삭제*/
public int removeReview(int r_no) throws Exception{
	
	Connection con = null;
	PreparedStatement pstmt = null;
	int count = 0;
	
	try {
		con =dataSource.getConnection();
		pstmt = con.prepareStatement(ReviewSQL.REVIEW_DELETE);
		pstmt.setInt(1, r_no);
		count = pstmt.executeUpdate();

	} finally {
		try {
			if (pstmt != null)
				pstmt.close();
		} catch (Exception ex) {
		}
		try {
			if (con != null)
				con.close();
		} catch (Exception ex) {
		}
	}
	return count;

}


/*리뷰 수정*/
public int updateReview(Review review) throws Exception{
	Connection con = null;
	PreparedStatement pstmt = null;
	int count = 0;
	try {
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(ReviewSQL.REVIEW_UPDATE);
		pstmt.setString(1, review.getR_comment());
		pstmt.setInt(2, review.getR_grade());
		pstmt.setInt(3, review.getR_no());
		count = pstmt.executeUpdate();
		
	}finally {
		try{
			if(pstmt != null)
				pstmt.close();
			
		}catch (Exception ex) {
			// TODO: handle exception
		}
		try {
			if(con!=null)
				con.close();
		}catch (Exception ex) {
			// TODO: handle exception
		}
	}
	
	return count;
}

/*리뷰 번호에 해당하는 리뷰 정보를 반환*/
public Review findReviewNo(int r_no) throws Exception{
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Review review = null;
	try {
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(ReviewSQL.REVIEW_SELECT_BY_NO);
		pstmt.setInt(1, r_no);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			review = new Review();
			review.setR_no(rs.getInt("r_no"));
			review.setR_date(rs.getDate("r_date"));
			review.setR_comment(rs.getString("r_comment"));
			review.setR_grade(rs.getInt("r_grade"));
			review.setR_groupNo(rs.getInt("r_groupNo"));
			review.setR_step(rs.getInt("r_step"));
			review.setR_depth(rs.getInt("r_depth"));
			review.setU_id(rs.getString("u_id"));
			review.setP_no(rs.getInt("p_no"));
			
		}
		
	}finally {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception ex) {
		}
		try {
			if (pstmt != null)
				pstmt.close();
		} catch (Exception ex) {
		}
		try {
			if (con != null)
				con.close();
		} catch (Exception ex) {
		}	
	}
	
	return review;
}

/* 리뷰 총 건수를 조회, 반환*/
public int getReviewCount() throws Exception{
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int count = 0;
	try {
		con=dataSource.getConnection();
		pstmt = con.prepareStatement(ReviewSQL.REVIEW_COUNT);
		rs = pstmt.executeQuery();
		if(rs.next())
			count= rs.getInt(1);
		
	}finally {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception ex) {
		}
		try {
			if (pstmt != null)
				pstmt.close();
		} catch (Exception ex) {
		}
		try {
			if (con != null)
				con.close();
		} catch (Exception ex) {
		}
	}
	return count;
}

}
