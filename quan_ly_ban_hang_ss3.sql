create database quan_ly_ban_hang;
use quan_ly_ban_hang;

create table customer(
  c_id int auto_increment,
  c_name varchar(255),
  c_age int ,
  primary key(c_id)
);

create table orders(
  o_id int auto_increment,
  o_date datetime,
  o_totalPrice double,
  primary key(o_id),
  customer_id int,
  foreign key(customer_id) references customer(c_id)
);

create table product(
 p_id int auto_increment,
 p_name varchar(255),
 p_price float,
 primary key(p_id)

);

create table order_detail(
  od_qty int,
  product_id int,
  order_id int,
  primary key(product_id,order_id),
  foreign key(product_id) references product(p_id),
  foreign key(order_id) references orders(o_id)
);

insert into customer (c_id, c_name, c_age) values
(1, 'Minh Quan', 10),
(2, 'Ngoc Oanh', 20),
(3, 'Hong Ha', 50);

insert into orders (o_id, customer_id, o_date, o_totalPrice) values
(1, 1, '2006-03-21', null),
(2, 2, '2006-03-23', null),
(3, 3, '2006-03-16', null);

insert into product (p_id, p_name, p_price) values
(1, 'May Giat', 3),
(2, 'Tu Lanh', 5),
(3, 'Dieu Hoa', 7),
(4, 'Quat', 1),
(5, 'Bep Dien', 2);

insert into order_detail (order_id, product_id, od_qty) values
(1, 1, 3),
(1, 3, 7),
(1, 4, 2),
(2, 1, 1),
(2, 2, 4),
(3, 1, 8);

SELECT o_id, o_date, o_totalPrice FROM orders;

SELECT DISTINCT  c.c_id , c.c_name, c.c_age
FROM customer c
JOIN orders o ON c.c_id = o.customer_id;

SELECT DISTINCT c.c_id, c.c_name, p.p_id, p.p_name, p.p_price
FROM customer c
JOIN orders o ON c.c_id = o.customer_id
JOIN order_detail od ON o.o_id = od.order_id
JOIN product p ON od.product_id = p.p_id;

SELECT c.c_id, c.c_name
FROM customer c
LEFT JOIN orders o ON c.c_id = o.customer_id
WHERE o.o_id IS NULL;

SELECT 
  o.o_id AS ma_hoa_don,
  o.o_date AS ngay_ban,
  SUM(od.od_qty * p.p_price) AS tong_tien
FROM orders o
JOIN order_detail od ON o.o_id = od.order_id
JOIN product p ON od.product_id = p.p_id
GROUP BY o.o_id, o.o_date;