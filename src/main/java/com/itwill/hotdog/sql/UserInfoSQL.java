package com.itwill.hotdog.sql;

public class UserInfoSQL {
	        public final static String USER_INSERT=
			"insert into userinfo(u_id,u_password,u_name,u_phone,u_point) values(?,?,?,?,?)";
			public final static String USER_UPDATE=
			"update  userinfo set u_password=?,u_name=?,u_phone=?,u_point=? where u_id=?";
			public final static String USER_REMOVE=
			"delete userinfo where u_id=?";
			public final static String USER_SELECT_BY_ID=
			"select u_id,u_password,u_name,u_phone,u_point from userinfo where u_id=?";
			public final static String USER_SELECT_ALL=
			"select u_id,u_password,u_name,u_phone,u_point from userinfo";
			public final static String USER_SELECT_BY_ID_COUNT=
					"select count(*) cnt from userinfo where u_id=?";
}
