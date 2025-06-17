CREATE DATABASE quan_ly_sinh_vien;
use quan_ly_sinh_vien;

CREATE TABLE Class(
 id int auto_increment,
 name_student varchar(255) not null,
 primary key(id));


CREATE TABLE Teacher(
 id int auto_increment,
 name varchar(255) not null,
 age int,
 country varchar(255)not null,
 primary key(id)
 

);
drop database quan_ly_sinh_vien;
