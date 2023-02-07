/***************************카트****************************/
--sy0 유저 한 사람의 카트에 제품번호 존재여부
--있음 -> update
select count(*) as p_count from cart c where c.u_id='sy0' and c.p_no=1;
--없음 -> insert
select count(*) as p_count from cart c where c.u_id='sy0' and c.p_no=8;

--sy0 카트에 있는 1번제품의 수량 증가
update cart set c_qty=c_qty+1 where u_id='sy0' and p_no=1;
update cart set c_qty=c_qty+3 where u_id='sy0' and p_no=1;--증가하는 수량 선택가능 기능

--sy0 카트에 있는 cart_no 1번의 수량 3개로 수정
update cart set c_qty=3 where c_no=1;

--sy0 멤버한사람의 카트아이템리스트
select * from cart c join product p on c.p_no=p.p_no where c.u_id='sy0';

--sy0 카트아이템 1개 삭제 -> 장바구니 품목별 선택삭제
delete from cart where c_no=1;

--sy0 카트아이템 모두 삭제 -> 장바구니 전체삭제
delete from cart where u_id='sy0';


/***************************주문****************************/
--1. 멤버 한 사람의 주문전체목록 (조인x) - 구현시 멤버는 세션으로부터 얻는다. (로그인 된 사용자.)
select * from orders where u_id='sy0';


--2. 주문 한 개(멤버 한 사람의) (조인x)
select * from orders where o_no=1;


--3. 주문(orders) 한 개의 주문상세(order_item) 여러 개 (조인x)
select * from order_item where o_no=2;


--4. 로그인한 멤버의 주문 리스트 - 주문정보(orders), 주문상세정보(order_item), 제품정보(product) 여러 개 (orders, order_item, product 테이블의 조인연산)
--sy0
select * from orders o join order_item oi on o.o_no=oi.o_no join product p on oi.p_no=p.p_no where o.u_id='sy0';
--sy1
select * from orders o join order_item oi on o.o_no=oi.o_no join product p on oi.p_no=p.p_no where o.u_id='sy1';


--4-2. 로그인한 멤버의 주문 1개 (주문상세, 제품정보) - orders, order_item, product join
select * from orders o join order_item oi on o.o_no=oi.o_no join product p on oi.p_no=p.p_no where o.u_id='sy0' and o.o_no=2;


--5. orders, payment, userinfo, order_item, product JOIN
select * from orders o join payment pm on o.pm_no=pm.pm_no join userinfo u on o.u_id=u.u_id join order_item oi on o.o_no=oi.o_no join product p on oi.p_no=p.p_no;

select * from orders o join payment pm on o.pm_no=pm.pm_no join userinfo u on o.u_id=u.u_id join order_item oi on o.o_no=oi.o_no join product p on oi.p_no=p.p_no where u.u_id='sy0';

select * from orders o join payment pm on o.pm_no=pm.pm_no join userinfo u on o.u_id=u.u_id join order_item oi on o.o_no=oi.o_no join product p on oi.p_no=p.p_no where o.o_no=2;


--5-2. orders, payment, userinfo JOIN
select * from orders o join payment pm on o.pm_no=pm.pm_no join userinfo u on o.u_id=u.u_id where o.u_id='sy0';


--6. 주문 1개 삭제 (주문상세삭제)
delete from orders where o_no=1;


--7. 유저 1명의 주문내역 전체삭제
--sy0
delete from orders where u_id='sy0';