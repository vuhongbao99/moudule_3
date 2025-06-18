create database quan_ly_sinh_vien;
use quan_ly_sinh_vien;

create table class(
   id int auto_increment,
   name_student varchar(255),
   primary key(id)
);

create table teachers(
    id int auto_increment,
    name_teacher varchar(255),
    ages int,
    country varchar(255),
    primary key(id)
);
create table students(
 id int auto_increment,
 name_students varchar(255) not null,
 age int not null,
 country varchar(255),
 primary key(id)
);


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

