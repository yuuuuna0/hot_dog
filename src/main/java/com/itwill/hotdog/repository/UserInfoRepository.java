package com.itwill.hotdog.repository;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

import com.itwill.hotdog.domain.UserInfo;
import com.itwill.hotdog.sql.UserInfoSQL;
/*
 사용자관리에서 데이타베이스와의 작업을 전담하는 클래스
 USERINFO 테이블에 사용자를 추가,삭제,검색,수정등의 작업을한다.
 */
public class UserInfoRepository {
	/*
	 * - DataSource객체 : Connection을 반환해주는객체
	 * - 톰캣에서제공하는 DataSource 객체사용
	 */
	private DataSource dataSource;

	public UserInfoRepository() throws Exception {
		/******Apache BasicDataSource*****/
		/*
		 * jdbc.properties 파일을 Properties객체로생성
		 */
		BasicDataSource basicDataSource=new BasicDataSource();
		Properties properties=new Properties();
		properties.load(UserInfoRepository.class.getResourceAsStream("/jdbc.properties"));
		basicDataSource.setDriverClassName(properties.getProperty("driverClassName"));
		basicDataSource.setUrl(properties.getProperty("url"));
		basicDataSource.setUsername(properties.getProperty("username"));
		basicDataSource.setPassword(properties.getProperty("password"));
		dataSource=basicDataSource;
	}

	/*
	 * 사용자관리테이블에 새로운사용자생성
	 */
	public int insert(UserInfo user) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int insertRowCount = 0;
		try {
			/*
			 * 예외발생 예상코드
			 */
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserInfoSQL.USER_INSERT);
			pstmt.setString(1, user.getU_id());
			pstmt.setString(2, user.getU_password());
			pstmt.setString(3, user.getU_name());
			pstmt.setString(4, user.getU_phone());
			pstmt.setInt(5, user.getU_point());
			insertRowCount = pstmt.executeUpdate();
		} finally {
			/*
			 * 예외발생과 관계없이 반듯시 실행되는 코드
			 */
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return insertRowCount;
	}

	/*
	 * 기존의 사용자정보를 수정
	 */
	public int update(UserInfo user) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int updateRowCount = 0;
		try {
			/*
			 * 예외발생 예상코드
			 */
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserInfoSQL.USER_UPDATE);
			pstmt.setString(1, user.getU_password());
			pstmt.setString(2, user.getU_name());
			pstmt.setString(3, user.getU_phone());
			pstmt.setInt(4, user.getU_point());
			pstmt.setString(5, user.getU_id());
			updateRowCount = pstmt.executeUpdate();
		} finally {
			/*
			 * 예외발생과 관계없이 반듯시 실행되는 코드
			 */
			if (pstmt != null) {
				pstmt.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return updateRowCount;
	}

	/*
	 * 사용자아이디에해당하는 사용자를 삭제
	 */
	public int delete(String u_id) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		int removeRowCount = 0;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserInfoSQL.USER_REMOVE);
			pstmt.setString(1, u_id);
			removeRowCount = pstmt.executeUpdate();

		} finally {
			/*
			 * 예외발생과 관계없이 반듯시 실행되는 코드
			 */
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();

		}
		return removeRowCount;
	}

	/*
	 * 사용자아이디에해당하는 정보를 데이타베이스에서 찾아서 User 도메인클래스에 저장하여 반환
	 */
	public UserInfo findUser(String u_id) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserInfo findUser = null;
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserInfoSQL.USER_SELECT_BY_ID);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				findUser = new UserInfo(rs.getString("u_id"),
									rs.getString("u_password"),
									rs.getString("u_name"),
									rs.getString("u_phone"),
									rs.getInt("u_point"));
		
									

			}
		} finally {
			/*
			 * 예외발생과 관계없이 반듯시 실행되는 코드
			 */
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return findUser;
	}

	/*
	 * 모든사용자 정보를 데이타베이스에서 찾아서 List<User> 콜렉션 에 저장하여 반환
	 */
	public List<UserInfo> findUserList() throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<UserInfo> findUserList = new ArrayList<UserInfo>();
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserInfoSQL.USER_SELECT_ALL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				findUserList.add(new UserInfo(rs.getString("u_id"),
										  rs.getString("u_password"),
										  rs.getString("u_name"),
										  rs.getString("u_phone"),
										  rs.getInt("u_point")));

			}
		} finally {
			/*
			 * 예외발생과 관계없이 반듯시 실행되는 코드
			 */
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
		return findUserList;
	}

	/*
	 * 인자로 전달되는 아이디를 가지는 사용자가 존재하는지의 여부를판별
	 */
	public int countByUserId(String u_id) throws Exception {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(UserInfoSQL.USER_SELECT_BY_ID_COUNT);
			pstmt.setString(1, u_id);
			rs = pstmt.executeQuery();
			rs.next();
			int count = rs.getInt("cnt");
			return count;
		} finally {
			/*
			 * 예외발생과 관계없이 반듯시 실행되는 코드
			 */
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (con != null)
				con.close();
		}
	}

}