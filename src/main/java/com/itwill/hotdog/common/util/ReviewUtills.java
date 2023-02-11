package com.itwill.hotdog.common.util;

import com.itwill.hotdog.domain.Review;

public class ReviewUtills {
/*
 * \r\n을 html의 <br>로 변환하기
 */
	public static String convertHtmlBr(String comment) {
		
		if(comment == null)
				return "";
		int length = comment.length();
		StringBuffer buffer = new StringBuffer();
		for(int i=0; i<length; i++) {
			String tmp = comment.substring(i, i+1);
			if("\r".compareTo(tmp)==0) {
				tmp = comment.substring(++i,i+1);
				if("\n".compareTo(tmp)==0)
					buffer.append("<br>\r");
				else
					buffer.append("\r");
			}
			buffer.append(tmp);
		}
		
		return buffer.toString();
	}
	
	public String getCommentString(Review review) {
		
		StringBuilder comment = new StringBuilder(128);
		String c = review.getR_comment();
		if (c.length() > 70) {
			//t = t.substring(0,15);
			//t = t+"...";
			c = String.format("%s...", c.substring(0, 70));
		}
		//답글공백삽입
		
		for (int i = 0; i < review.getR_depth(); i++) {
			comment.append("&nbsp;&nbsp;");
		}
		
		if (review.getR_depth() > 0) {
			comment.append("<img border='0' src='image/re.gif'/>");
		}
		
		comment.append(c.replace(" ", "&nbsp;"));
		
		return comment.toString();
}
}
