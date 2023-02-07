DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE delivery CASCADE CONSTRAINTS;
DROP TABLE order_item CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE payment CASCADE CONSTRAINTS;
DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE category CASCADE CONSTRAINTS;
DROP TABLE userInfo CASCADE CONSTRAINTS;

CREATE TABLE userInfo(
		u_id                          		VARCHAR2(20)		 NULL ,
		u_password                    		VARCHAR2(50)		 NULL ,
		u_name                        		VARCHAR2(10)		 NULL ,
		u_phone                       		VARCHAR2(50)		 NULL ,
		u_point                       		NUMBER(10)		 NULL 
);


CREATE TABLE category(
		ct_no                         		NUMBER(10)		 NULL ,
		ct_name                       		VARCHAR2(10)		 NULL 
);

DROP SEQUENCE category_ct_no_SEQ;

CREATE SEQUENCE category_ct_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE product(
		p_no                          		NUMBER(10)		 NULL ,
		p_name                        		VARCHAR2(100)		 NULL ,
		p_price                       		NUMBER(10)		 NULL ,
		p_discount                    		NUMBER(10)		 NULL ,
		p_desc                        		VARCHAR2(100)		 NULL ,
		p_img                         		VARCHAR2(100)		 NULL ,
		p_click                       		NUMBER(10)		 DEFAULT 0		 NULL ,
		ct_no                         		NUMBER(10)		 NULL 
);

DROP SEQUENCE product_p_no_SEQ;

CREATE SEQUENCE product_p_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE cart(
		c_no                          		NUMBER(10)		 NULL ,
		c_qty                         		NUMBER(10)		 NULL ,
		u_id                          		VARCHAR2(20)		 NULL ,
		p_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE cart_c_no_SEQ;

CREATE SEQUENCE cart_c_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE payment(
		pm_no                         		NUMBER(10)		 NULL ,
		pm_name                       		VARCHAR2(100)		 NULL 
);

DROP SEQUENCE payment_pm_no_SEQ;

CREATE SEQUENCE payment_pm_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE orders(
		o_no                          		NUMBER(10)		 NULL ,
		o_date                        		DATE		 DEFAULT sysdate		 NULL ,
		o_totalPrice                  		NUMBER(10)		 NULL ,
		o_usedPoint                   		NUMBER(10)		 NULL ,
		pm_no                         		NUMBER(10)		 NULL ,
		u_id                          		VARCHAR2(20)		 NULL 
);

DROP SEQUENCE orders_o_no_SEQ;

CREATE SEQUENCE orders_o_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE order_item(
		oi_no                         		NUMBER(10)		 NULL ,
		oi_qty                        		NUMBER(10)		 NULL ,
		o_no                          		NUMBER(10)		 NULL ,
		p_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE order_item_oi_no_SEQ;

CREATE SEQUENCE order_item_oi_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE delivery(
		d_no                          		NUMBER(10)		 NULL ,
		d_name                        		VARCHAR2(100)		 NULL ,
		d_address                     		VARCHAR2(100)		 NULL ,
		u_id                          		VARCHAR2(20)		 NULL 
);

DROP SEQUENCE delivery_d_no_SEQ;

CREATE SEQUENCE delivery_d_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;




CREATE TABLE review(
		r_no                          		NUMBER(10)		 NULL ,
		r_date                        		DATE		 DEFAULT sysdate		 NULL ,
		r_comment                     		VARCHAR2(1000)		 NULL ,
		r_grade                       		NUMBER(10)		 NULL ,
		r_groupNo                     		NUMBER(10)		 NULL ,
		r_step                        		NUMBER(10)		 NULL ,
		r_depth                       		NUMBER(10)		 NULL ,
		u_id                          		VARCHAR2(20)		 NULL ,
		p_no                          		NUMBER(10)		 NULL 
);

DROP SEQUENCE review_r_no_SEQ;

CREATE SEQUENCE review_r_no_SEQ NOMAXVALUE NOCACHE NOORDER NOCYCLE;





ALTER TABLE userInfo ADD CONSTRAINT IDX_userInfo_PK PRIMARY KEY (u_id);

ALTER TABLE category ADD CONSTRAINT IDX_category_PK PRIMARY KEY (ct_no);

ALTER TABLE product ADD CONSTRAINT IDX_product_PK PRIMARY KEY (p_no);
ALTER TABLE product ADD CONSTRAINT IDX_product_FK0 FOREIGN KEY (ct_no) REFERENCES category (ct_no) on delete cascade;

ALTER TABLE cart ADD CONSTRAINT IDX_cart_PK PRIMARY KEY (c_no);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK0 FOREIGN KEY (u_id) REFERENCES userInfo (u_id) on delete cascade;
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK1 FOREIGN KEY (p_no) REFERENCES product (p_no) on delete cascade;

ALTER TABLE payment ADD CONSTRAINT IDX_payment_PK PRIMARY KEY (pm_no);

ALTER TABLE orders ADD CONSTRAINT IDX_orders_PK PRIMARY KEY (o_no);
ALTER TABLE orders ADD CONSTRAINT IDX_orders_FK0 FOREIGN KEY (pm_no) REFERENCES payment (pm_no) on delete cascade;
ALTER TABLE orders ADD CONSTRAINT IDX_orders_FK1 FOREIGN KEY (u_id) REFERENCES userInfo (u_id) on delete cascade;

ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_PK PRIMARY KEY (oi_no);
ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_FK0 FOREIGN KEY (o_no) REFERENCES orders (o_no) on delete cascade;
ALTER TABLE order_item ADD CONSTRAINT IDX_order_item_FK1 FOREIGN KEY (p_no) REFERENCES product (p_no) on delete cascade;

ALTER TABLE delivery ADD CONSTRAINT IDX_delivery_PK PRIMARY KEY (d_no);
ALTER TABLE delivery ADD CONSTRAINT IDX_delivery_FK0 FOREIGN KEY (u_id) REFERENCES userInfo (u_id) on delete cascade;

ALTER TABLE review ADD CONSTRAINT IDX_review_PK PRIMARY KEY (r_no);
ALTER TABLE review ADD CONSTRAINT IDX_review_FK0 FOREIGN KEY (u_id) REFERENCES userInfo (u_id) on delete cascade;
ALTER TABLE review ADD CONSTRAINT IDX_review_FK1 FOREIGN KEY (p_no) REFERENCES product (p_no) on delete cascade;

