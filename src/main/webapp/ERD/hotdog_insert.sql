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
insert into categories(ct_no, ct_name, ct_img) values(CATEGORIES_CT_NO_SEQ.nextval, '사료', '사료.jpg');
insert into categories(ct_no, ct_name, ct_img) values(CATEGORIES_CT_NO_SEQ.nextval, '간식', '간식.jpg');
insert into categories(ct_no, ct_name, ct_img) values(CATEGORIES_CT_NO_SEQ.nextval, '장난감', '장난감.jpg');

/**********************product insert************************/
insert into product values(product_p_no_SEQ.nextval, '뉴트리나 건강백서 사료 푸들 10.2kg', 67000,4, '견종의 특성을 고려한 사료입니다. DHA,상어연골,글루코사민을 첨가하였습니다.','1.jpg',0,1);
insert into product values(product_p_no_SEQ.nextval, '오리젠 사료 오리지널 독 11.4kg', 132000,13,'모든 견종과 전연령의 개들에게 필요한 사료입니다. 양질의 단밸질이 풍부합니다. ','2.jpg', 0,1);
insert into product values(product_p_no_SEQ.nextval, '아카나 사료 와일드 프레이리 독 11.4kg',111000,12, '서부 캐나다의 농장들과 물에서 나는 지역 특산물을 이용합니다.', '3.jpg',0,1);
insert into product values(product_p_no_SEQ.nextval, '로얄캐닌 사료 미니 인도어 어덜트 3kg',46500,11, '건강에 대한 바른 집념, 로얄캐닌의 모든 생각이 건강입니다.','4.jpg',0, 1);
insert into product values(product_p_no_SEQ.nextval, '퓨리나 프로플랜 대형견 사료 퍼포먼스 17kg', 116000,11, '활동량이 많은 반려견을 위한 사료입니다. 근육 손실을 막고, 수유중인 모견에게 적합합니다.','5.jpg',0, 1);
insert into product values(product_p_no_SEQ.nextval, '피너클 사료 그레인프리 송어,고구마 10.89kg', 127000,11, '무알러지 사료와 검수받은 천연 원료를 선별하였습니다.','6.jpg',0, 1);
insert into product values(product_p_no_SEQ.nextval, '네츄럴코어 사료 에코 4 오리고기 슬림다운 작은알갱이 6kg', 66000,14, '소화흡수율이 높은 다이어트 사료입니다. 균형잡힌 영양식과 체중조절을 위한 오리고기 레시피','7.jpg',0, 1);
insert into product values(product_p_no_SEQ.nextval, '퓨리나 프로플랜 대형견 사료 어덜트 큰알갱이 15.4kg', 116000,14, '대형견을 위한 사료입니다. 관절, 연골, 면역 기능 강화에 도움을 줄 수 있습니다.','8.jpg',0, 1);
insert into product values(product_p_no_SEQ.nextval, 'ANF 사료 램 28 프리미엄 7.2kg', 42,000,11, '모든 반려견에 적합한 크기의 알갱이와 단백질 밸런스를 고려한 사료입니다','9.jpg',0, 1);
insert into product values(product_p_no_SEQ.nextval, '오리젠 사료 시니어 독 11.4kg', 132000,10, '노견용 사료입니다. 칼로리 제한을 위한 재료구성을 이용합니다','10.jpg',0, 1);
insert into product values(product_p_no_SEQ.nextval, '네츄럴코어 비프 주식 캔 80g', 2400,21,'호주산 소 살코기와 그레이비 소스가 들어있는 습식캔입니다.','11.jpg',0, 2);
insert into product values(product_p_no_SEQ.nextval, '내추럴키티 스팀 농어 도미 2종 콤보 10개', 2800,0, '100% 농어를 사용했습니다. 낱개포장으로 본연의 맛과 향이 풍부합니다.','12.jpg',0, 2);
insert into product values(product_p_no_SEQ.nextval, '내추럴키티 그릴 스팀 원물통살 4종 콤보 20개',38000,19,'100% 그릴치킨, 스팀 고등어, 스팀참치뱃살, 스팀참치등살로 구성했습니다.  ','13.jpg',0, 2);
insert into product values(product_p_no_SEQ.nextval, '구루머스 치킨 우유껌 7개입', 2000,10,'스트레스와 치석제거에 좋은 간식입니다.','14.jpg',0, 2);
insert into product values(product_p_no_SEQ.nextval, '구루머스 치킨어포 400g', 8000,39,'신선한 재료를 이용한 치킨어포사시미 간식입니다. 반려견에 단백질을 제공합니다.','15.jpg',0, 2);
insert into product values(product_p_no_SEQ.nextval, '네츄럴코어 닭 연골 40g', 2400,21,'부드러운 연골과 닭가슴살을 이용한 반려견 간식입니다.','16.jpg',0, 2);
insert into product values(product_p_no_SEQ.nextval, '메디코펫 데일리 덴탈 바 양치껌 치석제거 조인트 14p x 2개', 32000,0,'관절에 좋은 부드러운 간식입니다.','17.jpg',0, 2);
insert into product values(product_p_no_SEQ.nextval, '포켄스 덴티페어리 디스펜서 강아지 덴탈껌 S 80개입', 40000,25,'데일리 치석제거 영양간식입니다. 구취감소에 좋습니다.','18.jpg',0, 2);
insert into product values(product_p_no_SEQ.nextval, '포켄스 카누들 기능성 강아지 덴탈껌 필로팩 S 소형견용 1박스 100개입', 42000,21,'데일리 치석감소 간식입니다. 소화가 잘 되어 소형견부터 노령견까지 이용가능합니다','19.jpg',0, 2);
insert into product values(product_p_no_SEQ.nextval, '네츄럴코어 치킨 4종 콤보 캔 24개', 40800,18,'단백질이 담긴 순살 닭고기캔 간식입니다. 간편하게 급여할 수 있고 기력회복에도 좋습니다.','20.jpg',0, 2);
insert into product values(product_p_no_SEQ.nextval, '펫모닝 끈질긴 로프토이 긴줄 공 1개 색상랜덤', 2400,17, '치석제거에 도움을 주는 튼튼한 놀이 장난감입니다.','21.jpg',0,3);
insert into product values(product_p_no_SEQ.nextval, '펫모닝 바닐라향 바다토이 돌고래', 2500,20,'바닐린향을 첨가한 기분좋은 장난감입니다. 소리가 나는 스쿼크가 들어있고 플라스틱 장식을 배제했습니다.','22.jpg', 0,3);
insert into product values(product_p_no_SEQ.nextval, '펫모닝 바닐라향 바다토이 펭귄',2500,20,'바닐린향을 첨가한 장난감입니다. 소리가 나는 스쿼크가 들어있고 플라스틱 장식을 배제했습니다.','23.jpg',0,3);
insert into product values(product_p_no_SEQ.nextval, '펫모닝 바닐라향 럭셔리 도기볼 1개 색상랜덤', 2000,10,'바닐린향을 첨가한 공 형태 장난감입니다. 스쿼크가 들어있고 플라스틱 장식을 배제했습니다.','24.jpg',0, 3);
insert into product values(product_p_no_SEQ.nextval, '펫모닝 바베큐 갈비', 2500,8, '보화원단을 이용하여 부드러운 봉제 장난감입니다. 바닐라향을 추가했습니다.','25.jpg',0, 3);
insert into product values(product_p_no_SEQ.nextval, '펫모닝 바닐라향 뿔도깨비 1개 색상랜덤', 2500,24, '부드러운 원단을 이용한 바닐린향 봉제 장난감입니다.','26.jpg',0, 3);
insert into product values(product_p_no_SEQ.nextval, '펫모닝 실타래 로프 미니 15cm', 1000,20, '양쪽에 매듭을 지은 치석제거 장난감입니다.','27.jpg',0, 3);
insert into product values(product_p_no_SEQ.nextval, '펫모닝 바닐라향 바다토이 상어', 2500,20, '부드러운 원단을 이용한 바닐린향 봉제 장난감입니다.','28.jpg',0, 3);
insert into product values(product_p_no_SEQ.nextval, '펫모닝 알파카 브라운', 5000,22, '치석제거와 스트레스해소를 도와주는 봉제 장난감입니다.','29.jpg',0, 3);
insert into product values(product_p_no_SEQ.nextval, '피단 노즈워크 볼 블루',12500,21, '공형태의 장난감입니다. 양쪽 끝을 뒤집을 수 있어 간식을 숨기는 공간이 있습니다.','30.jpg',0, 3);

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
