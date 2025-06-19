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
  odQTY int,
  product_id int,
  order_id int,
  primary key(product_id,order_id),
  foreign key(product_id) references product(p_id),
  foreign key(order_id) references orders(o_id)
);