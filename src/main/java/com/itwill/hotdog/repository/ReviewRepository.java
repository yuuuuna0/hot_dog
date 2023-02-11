package com.itwill.hotdog.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.hotdog.domain.Review;
import com.itwill.hotdog.sql.ReviewSQL;

public class ReviewRepository {
	
	private DataSource dataSource;
	
	
public ReviewRepository() throws Exception{
	Properties properties = new Properties();
	properties.load(this.getClass().getResourceAsStream("/jdbc.properties"));
	/*** Apache DataSource 	***/
	BasicDataSource basicDataSource = new BasicDataSource();
	basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
	basicDataSource.setUrl(properties.getProperty("url"));
	basicDataSource.setUsername(properties.getProperty("username"));
	basicDataSource.setPassword(properties.getProperty("password"));
	dataSource = basicDataSource;

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

/* 해당 상품 리뷰리스트*/
public ArrayList<Review> findReviewist(int p_no) throws Exception{
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;// 조회 결과에 접근하는 참조 변수
	// 데이터베이스의 데이터를 읽어서 저장할 객체 컬렉션
	ArrayList<Review> reviews = new ArrayList<Review>();
	try {
		con = dataSource.getConnection();

		pstmt = con.prepareStatement(ReviewSQL.REVIEW_SELECT_BY_P_NO);
		pstmt.setInt(1, p_no);
		rs=pstmt.executeQuery();
		
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
	} finally {
		// 6. 연결닫기
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

/* 해당 상품 리뷰리스트 (시작/끝)*/
public ArrayList<Review> findReviewList(int start, int last,int p_no) throws Exception{
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	ArrayList<Review> reviews = new ArrayList<Review>();
	try {
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(ReviewSQL.REVIEW_SELECT_BY_PNO);
		pstmt.setInt(1, p_no);
		pstmt.setInt(2, start);
		pstmt.setInt(3, last);
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
public ArrayList<Review> findReviewGno(int start, int last,int r_groupNo) throws Exception{

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	ArrayList<Review> reviews = new ArrayList<Review>();
	try {
		con = dataSource.getConnection();
		pstmt = con.prepareStatement(ReviewSQL.REVIEW_SELECT_BY_GNO);
		pstmt.setInt(1, r_groupNo);
		pstmt.setInt(2, start);
		pstmt.setInt(3, last);
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
/*
 * 답변게시물 존재여부확인메쏘드
 */
public boolean countReply(Review review) throws SQLException {

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Boolean isExist = false;
	int cnt = 0;
	try {
		con = dataSource.getConnection();
		StringBuffer sql = new StringBuffer(300);
		sql.append("SELECT ");
		sql.append("count(*) cnt ");
		sql.append("FROM review ");
		sql.append("WHERE r_groupno = ? ");
		sql.append("AND r_depth >= ? ");
		sql.append("AND r_step >= ? ");
		sql.append("ORDER BY r_step,r_depth ASC");

		pstmt = con.prepareStatement(sql.toString());
		pstmt.setInt(1, review.getR_groupNo());
		pstmt.setInt(2, review.getR_depth());
		pstmt.setInt(3, review.getR_step());

		rs = pstmt.executeQuery();
		if (rs.next()) {
			cnt = rs.getInt("cnt");
		}
		if (cnt > 1) {
			isExist = true;
		}
	} catch (Exception ex) {
		ex.printStackTrace();
	} finally {
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
	return isExist;

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

/* 상품별 리뷰 총 건수를 조회, 반환*/
public int getReviewCountPno(int p_no) throws Exception{
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int count = 0;
	try {
		con=dataSource.getConnection();
		pstmt = con.prepareStatement(ReviewSQL.REVIEW_COUNT_PNO);
		pstmt.setInt(1, p_no);
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
