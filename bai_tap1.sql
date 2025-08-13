create database book_management;
use  book_management;
create table books(
  id int auto_increment ,
  name nvarchar(50),
  page_size int,
  author nvarchar (50),
  primary key(id)
);


delete from books where id = 1;
insert into books values (1, "Toán", 45, "Nguyễn Thái Học");
insert into books values (2, "Văn", 34, "Trần Mình Hoàng");
insert into books values (3, "Sử", 56, "Dương Trung Quốc");
insert into books values (4, "Địa", 76, "Lê Văn Hiến");
insert into books values (5, "Hoá", 32, "Hà Văn Minh");

-- cập nhật page_size = 50 có title : Sử
SET SQL_SAFE_UPDATES = 0;
update books set page_size = 50 where name = "Sử";
SET SQL_SAFE_UPDATES = 1;

-- Xoá sách có id =5
delete from books where id = 5;
-- Xoá bảng books
drop table books;
drop database book_management;
-- Xóa Cơ Sở dữ liệu book_managerment
