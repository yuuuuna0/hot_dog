/**********************member insert************************/
insert into userinfo(userid,password,name,email) values('guard1','1111','김경호1','guard1@korea.com');
insert into userinfo(userid,password,name,email) values('guard2','2222','김경호2','guard2@korea.com');
insert into userinfo(userid,password,name,email) values('guard3','3333','김경호3','guard3@korea.com');

/**********************category insert************************/
insert into category values(category_ct_no_seq.nextval,'사료');
insert into category values(category_ct_no_seq.nextval,'간식');
insert into category values(category_ct_no_seq.nextval,'옷');
insert into category values(category_ct_no_seq.nextval,'장난감');

/**********************product insert************************/
insert into product values(product_p_no_SEQ.nextval, '애기사료', 550000, 10 ,'기타 상세 정보 등...','image.jpg', 0,1);
insert into product values(product_p_no_SEQ.nextval, '노견사료', 500000, 5,'기타 상세 정보 등...', 'image.jpg', 0,1);
insert into product values(product_p_no_SEQ.nextval, '대형견사료', 400000, 15,'기타 상세 정보 등...', 'image.jpg', 0,1);

insert into product values(product_p_no_SEQ.nextval, '껌', 450000, 5,'기타 상세 정보 등...', 'image.jpg', 0,2);
insert into product values(product_p_no_SEQ.nextval, '육포', 800000,5,'기타 상세 정보 등...', 'image.jpg', 0,2);
insert into product values(product_p_no_SEQ.nextval, '말린고구마', 700000, 5,'기타 상세 정보 등...', 'image.jpg', 0,2);

insert into product values(product_p_no_SEQ.nextval, '턱받이', 450000, 5,'기타 상세 정보 등...', 'image.jpg', 0,3);
insert into product values(product_p_no_SEQ.nextval, '모자', 800000,5,'기타 상세 정보 등...', 'image.jpg', 0,3);
insert into product values(product_p_no_SEQ.nextval, '점프수트', 700000, 5,'기타 상세 정보 등...', 'image.jpg', 0,3);

insert into product values(product_p_no_SEQ.nextval, '공', 450000, 5,'기타 상세 정보 등...', 'image.jpg', 0,4);
insert into product values(product_p_no_SEQ.nextval, '노즈워크', 800000,5,'기타 상세 정보 등...', 'image.jpg', 0,4);


/**********************cart insert************************/
insert into cart(cart_no,userId,p_no,cart_qty) values (cart_cart_no_SEQ.nextval,'guard1',1,2);
insert into cart(cart_no,userId,p_no,cart_qty) 
values
(cart_cart_no_SEQ.nextval,'guard1',2,1);

insert into cart(cart_no,userId,p_no,cart_qty) 
values
(cart_cart_no_SEQ.nextval,'guard1',3,5);


insert into cart(cart_no,userId,p_no,cart_qty) 
values
(cart_cart_no_SEQ.nextval,'guard2',1,1);
insert into cart(cart_no,userId,p_no,cart_qty) 
values
(cart_cart_no_SEQ.nextval,'guard2',3,1);

/**********************orders insert************************/
insert into orders(o_no,o_desc,o_date,o_price,userid) values (orders_o_no_SEQ.nextval,'비글외1종',sysdate-2,1050000,'guard1');
insert into order_item(oi_no,oi_qty,o_no,p_no) values(order_item_oi_no_SEQ.nextval,1,orders_o_no_SEQ.currval,1);
insert into order_item(oi_no,oi_qty,o_no,p_no) values(order_item_oi_no_SEQ.nextval,1,orders_o_no_SEQ.currval,2);

insert into orders(o_no,o_desc,o_date,o_price,userid) values (orders_o_no_SEQ.nextval,'퍼그외0종',sysdate-1,400000,'guard1');
insert into order_item(oi_no,oi_qty,o_no,p_no) values(order_item_oi_no_SEQ.nextval,1,orders_o_no_SEQ.currval,3);


insert into orders(o_no,o_desc,o_date,o_price,userid) values (orders_o_no_SEQ.nextval,'페키니즈외1종',sysdate,1450000,'guard1');
insert into order_item(oi_no,oi_qty,o_no,p_no) values(order_item_oi_no_SEQ.nextval,1,orders_o_no_SEQ.currval,4);
insert into order_item(oi_no,oi_qty,o_no,p_no) values(order_item_oi_no_SEQ.nextval,2,orders_o_no_SEQ.currval,2);



insert into orders(o_no,o_desc,o_date,o_price,userid) values (orders_o_no_SEQ.nextval,'달마시안외0종',sysdate-1,500000,'guard2');
insert into order_item(oi_no,oi_qty,o_no,p_no) values(order_item_oi_no_SEQ.nextval,1,orders_o_no_SEQ.currval,2);

insert into orders(o_no,o_desc,o_date,o_price,userid) values (orders_o_no_SEQ.nextval,'비글외1종',sysdate,1000000,'guard2');
insert into order_item(oi_no,oi_qty,o_no,p_no) values(order_item_oi_no_SEQ.nextval,1,orders_o_no_SEQ.currval,2);
insert into order_item(oi_no,oi_qty,o_no,p_no) values(order_item_oi_no_SEQ.nextval,1,orders_o_no_SEQ.currval,4);


commit;
desc order_item;


