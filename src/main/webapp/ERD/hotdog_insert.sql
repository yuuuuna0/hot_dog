/**********************userinfo insert************************/
insert into userinfo(u_id, u_password, u_name, u_phone, u_point) values('sy0','0000','김세영','010-0000-0000', 1000);
insert into userinfo(u_id, u_password, u_name, u_phone, u_point) values('sy1','1111','김세일','010-1111-1111', 1000);
insert into userinfo(u_id, u_password, u_name, u_phone, u_point) values('sy2','2222','김세이','010-2222-2222', 1000);

/**********************delivery insert************************/
--sy0
insert into delivery(d_no, d_name, d_address, u_id) values(DELIVERY_D_NO_SEQ.nextval, '집', '서울시 송파구', 'sy0');
insert into delivery(d_no, d_name, d_address, u_id) values(DELIVERY_D_NO_SEQ.nextval, '학원', '서울시 강남구', 'sy0');
insert into delivery(d_no, d_name, d_address, u_id) values(DELIVERY_D_NO_SEQ.nextval, '학교', '서울시 강동구', 'sy0');
--sy1
insert into delivery(d_no, d_name, d_address, u_id) values(DELIVERY_D_NO_SEQ.nextval, '집', '서울시 서초구', 'sy1');
insert into delivery(d_no, d_name, d_address, u_id) values(DELIVERY_D_NO_SEQ.nextval, '회사', '서울시 구로구', 'sy1');

/**********************cartegory insert************************/
insert into categories(ct_no, ct_name, ct_img) values(CATEGORIES_CT_NO_SEQ.nextval, '사료', 'default.jpg');
insert into categories(ct_no, ct_name, ct_img) values(CATEGORIES_CT_NO_SEQ.nextval, '간식', 'default.jpg');

/**********************product insert************************/
insert into product(p_no, p_name, p_price, p_discount, p_desc, p_img, p_click, ct_no) values(PRODUCT_P_NO_SEQ.nextval, '강아지사료1', 10000, 10, '강아지사료1입니다.', '1.jpg', 0, 1);
insert into product(p_no, p_name, p_price, p_discount, p_desc, p_img, p_click, ct_no) values(PRODUCT_P_NO_SEQ.nextval, '강아지사료2', 10000, 20, '강아지사료2입니다.', '2.jpg', 0, 1);
insert into product(p_no, p_name, p_price, p_discount, p_desc, p_img, p_click, ct_no) values(PRODUCT_P_NO_SEQ.nextval, '강아지사료3', 10000, 30, '강아지사료3입니다.', '3.jpg', 0, 1);
insert into product(p_no, p_name, p_price, p_discount, p_desc, p_img, p_click, ct_no) values(PRODUCT_P_NO_SEQ.nextval, '강아지간식1', 10000, 15, '강아지간식1입니다.', '4.jpg', 0, 2);
insert into product(p_no, p_name, p_price, p_discount, p_desc, p_img, p_click, ct_no) values(PRODUCT_P_NO_SEQ.nextval, '강아지간식2', 10000, 25, '강아지간식2입니다.', '5.jpg', 0, 2);
insert into product(p_no, p_name, p_price, p_discount, p_desc, p_img, p_click, ct_no) values(PRODUCT_P_NO_SEQ.nextval, '강아지간식3', 10000, 35, '강아지간식3입니다.', '6.jpg', 0, 2);



/**********************cart insert************************/
--sy0님이 1번제품 1개, 3번제품 3개, 5번제품 5개 담기
insert into cart(c_no, c_qty, u_id, p_no) values(CART_C_NO_SEQ.nextval, 1, 'sy0', 1);
insert into cart(c_no, c_qty, u_id, p_no) values(CART_C_NO_SEQ.nextval, 3, 'sy0', 3);
insert into cart(c_no, c_qty, u_id, p_no) values(CART_C_NO_SEQ.nextval, 5, 'sy0', 5);

--sy1님이 2번제품 2개, 4번제품 4개, 6번제품 6개 담기
insert into cart(c_no, c_qty, u_id, p_no) values(CART_C_NO_SEQ.nextval, 2, 'sy1', 2);
insert into cart(c_no, c_qty, u_id, p_no) values(CART_C_NO_SEQ.nextval, 4, 'sy1', 4);
insert into cart(c_no, c_qty, u_id, p_no) values(CART_C_NO_SEQ.nextval, 6, 'sy1', 6);

/**********************payment insert************************/
insert into payment(pm_no, pm_name) values(PAYMENT_PM_NO_SEQ.nextval, '신용카드');
insert into payment(pm_no, pm_name) values(PAYMENT_PM_NO_SEQ.nextval, '계좌이체');

/**********************orders insert************************/
--sy0
--제품 상세보기에서 주문 (1개품목) - 신용카드로 1번제품 1개 주문
insert into orders(o_no, o_date, o_totalprice, o_usedpoint, pm_no, u_id) values (ORDERS_O_NO_SEQ.nextval, sysdate, 10000, 0, 1, 'sy0');
insert into order_item(oi_no, oi_qty, o_no, p_no) values(ORDER_ITEM_OI_NO_SEQ.nextval, 1, ORDERS_O_NO_SEQ.currval, 1);

--카트에서 주문 (1개품목 이상) - 계좌이체로 1번제품 1개, 3번제품 3개, 5번제품 5개 주문
insert into orders(o_no, o_date, o_totalprice, o_usedpoint, pm_no, u_id) values (ORDERS_O_NO_SEQ.nextval, sysdate, 90000, 0, 2, 'sy0');
insert into order_item(oi_no, oi_qty, o_no, p_no) values(ORDER_ITEM_OI_NO_SEQ.nextval, 1, ORDERS_O_NO_SEQ.currval, 1);
insert into order_item(oi_no, oi_qty, o_no, p_no) values(ORDER_ITEM_OI_NO_SEQ.nextval, 3, ORDERS_O_NO_SEQ.currval, 3);
insert into order_item(oi_no, oi_qty, o_no, p_no) values(ORDER_ITEM_OI_NO_SEQ.nextval, 5, ORDERS_O_NO_SEQ.currval, 5);

--sy1
--제품 상세보기에서 주문 (1개품목) - 신용카드로 2번제품 2개 주문
insert into orders(o_no, o_date, o_totalprice, o_usedpoint, pm_no, u_id) values (ORDERS_O_NO_SEQ.nextval, sysdate, 10000, 0, 1, 'sy1');
insert into order_item(oi_no, oi_qty, o_no, p_no) values(ORDER_ITEM_OI_NO_SEQ.nextval, 2, ORDERS_O_NO_SEQ.currval, 2);

--카트에서 주문 (1개품목 이상) - 계좌이체로 2번제품 2개, 4번제품 4개, 6번제품 6개 주문
insert into orders(o_no, o_date, o_totalprice, o_usedpoint, pm_no, u_id) values (ORDERS_O_NO_SEQ.nextval, sysdate, 90000, 0, 2, 'sy1');
insert into order_item(oi_no, oi_qty, o_no, p_no) values(ORDER_ITEM_OI_NO_SEQ.nextval, 2, ORDERS_O_NO_SEQ.currval, 2);
insert into order_item(oi_no, oi_qty, o_no, p_no) values(ORDER_ITEM_OI_NO_SEQ.nextval, 4, ORDERS_O_NO_SEQ.currval, 4);
insert into order_item(oi_no, oi_qty, o_no, p_no) values(ORDER_ITEM_OI_NO_SEQ.nextval, 6, ORDERS_O_NO_SEQ.currval, 6);

/**********************review insert************************/
--sy0
--1번제품 리뷰
insert into review(r_no, r_date, r_comment, r_grade, r_groupno, r_step, r_depth, u_id, p_no) values(REVIEW_R_NO_SEQ.nextval, sysdate, '1번제품리뷰', 9, REVIEW_R_NO_SEQ.currval, 1, 0, 'sy0', 1);
insert into review(r_no, r_date, r_comment, r_grade, r_groupno, r_step, r_depth, u_id, p_no) values(REVIEW_R_NO_SEQ.nextval, sysdate, '1번제품리뷰2', 9, REVIEW_R_NO_SEQ.currval, 1, 0, 'sy0', 1);
--3번제품 리뷰
insert into review(r_no, r_date, r_comment, r_grade, r_groupno, r_step, r_depth, u_id, p_no) values(REVIEW_R_NO_SEQ.nextval, sysdate, '3번제품리뷰', 8, REVIEW_R_NO_SEQ.currval, 1, 0, 'sy0', 3);
insert into review(r_no, r_date, r_comment, r_grade, r_groupno, r_step, r_depth, u_id, p_no) values(REVIEW_R_NO_SEQ.nextval, sysdate, '3번제품리뷰2', 8, REVIEW_R_NO_SEQ.currval, 1, 0, 'sy0', 3);
--1번제품 리뷰의 답글 (자기 글에 답글)
insert into review(r_no, r_date, r_comment, r_grade, r_groupno, r_step, r_depth, u_id, p_no) values(REVIEW_R_NO_SEQ.nextval, sysdate, '1번제품리뷰_답글', 8, 1, 2, 1, 'sy0', 1);

--sy1
--2번제품 리뷰
insert into review(r_no, r_date, r_comment, r_grade, r_groupno, r_step, r_depth, u_id, p_no) values(REVIEW_R_NO_SEQ.nextval, sysdate, '2번제품리뷰', 7, REVIEW_R_NO_SEQ.currval, 1, 0, 'sy1', 2);
--4번제품 리뷰
insert into review(r_no, r_date, r_comment, r_grade, r_groupno, r_step, r_depth, u_id, p_no) values(REVIEW_R_NO_SEQ.nextval, sysdate, '4번제품리뷰', 6, REVIEW_R_NO_SEQ.currval, 1, 0, 'sy1', 4);
--3번제품 리뷰의 답글 (다른사람 글에 답글)
insert into review(r_no, r_date, r_comment, r_grade, r_groupno, r_step, r_depth, u_id, p_no) values(REVIEW_R_NO_SEQ.nextval, sysdate, '3번제품리뷰_답글', 8, 3, 2, 1, 'sy1', 3);



commit;
