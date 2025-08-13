create database `library`; 
use `library`;

drop table authors;
create  table authors (
 id_authors int auto_increment,
 name_authors varchar(50) not null,
 primary key (id_authors)
);

create table category(
  id_category int auto_increment,
  name_category varchar(50) not null,
  primary key (id_category)
);

create table students(
 id_students int auto_increment,
 name_student nvarchar(50) not null,
 dob date not null,
 class_name varchar(50) not null,
 primary key(id_students)
);

create table books(
  id_books int auto_increment,
  title varchar(50),
  page_size int,
  id_authors int,
  id_category int,
  foreign key (id_authors) references authors (id_authors),
  foreign key (id_category) references category (id_category),
  primary key(id_books)
);

create table borrows(
   id_students int,
   id_books int,
   borrow_date date,
   return_date date,
   primary key(id_students,id_books),
   foreign key (id_students) references students(id_students),
   foreign key (id_books) references books(id_books)
);
INSERT INTO category (name_category) VALUES
('Tự nhiên'),
('Xã Hội'),
('Truyện'),
('Tiểu Thuyết'),
('Khác');

-- 2) Authors
INSERT INTO authors (name_authors) VALUES
('Nguyễn Thái Học'),
('Trần Minh Hoàng'),
('Dương Trung Quốc'),
('Lê Văn Hiên'),
('Hà Văn Minh');

-- 3) Students
INSERT INTO students (name_student, dob, class_name) VALUES
('Nguyễn Văn A', '1999-12-12', 'C0822G1'),
('Nguyễn Văn B', '1999-12-13', 'C0822G1'),
('Nguyễn Văn C', '1999-12-14', 'C0822G1'),
('Nguyễn Văn D', '1999-12-15', 'C0922G1'),
('Nguyễn Văn E', '1999-12-16', 'C1022G1');

-- 4) Books  (id sẽ tự là 1..5 theo thứ tự insert)
-- id  title  page_size  author_id  category_id
INSERT INTO books (title, page_size, id_authors, id_category) VALUES
('Toán', 45, 1, 1),
('Văn', 34, 2, 2),
('Sử', 56, 3, 2),
('Địa', 76, 4, 2),
('Hoá', 32, 5, 1);


INSERT INTO borrows (id_students, id_books, borrow_date, return_date) VALUES
(1, 1, '2022-12-12', '2022-12-13'),
(2, 2, '2022-12-12', '2022-12-15'),
(3, 3, '2022-12-12', '2022-12-15'),
(4, 4, '2022-12-12', '2022-12-12'),
(1, 5, '2022-12-13', '2022-12-15'),
(1, 5, '2022-12-14', '2022-12-14'),
(3, 4, '2022-12-15', '2022-12-29'),
(3, 3, '2022-12-08', '2022-12-14'),
(1, 2, '2022-12-06', '2022-12-30');
ALTER TABLE borrows DROP PRIMARY KEY;

ALTER TABLE borrows
  DROP PRIMARY KEY,
  ADD PRIMARY KEY (id_students, id_books, borrow_date);
  
  
  -- liệt kê toàn bộ sách có trong thư viện, cùng với tên thể loại và tác giả.
  select 
  b.id_books,
  b.title,
  b.page_size,
  a.name_authors as authors_name,
  c.name_category as category_name
  from books b
  left join authors a ON b.id_authors = a.id_authors
  left join category c ON b.id_category = c.id_category ;
  
  --  lấy ra danh sách các học viên đã từng mượn sách và sắp xếp theo thứ tự từ a đến z
  
  -- distinct : loại bỏ trùng lặp 
  select distinct  
  s.id_students,
  s.name_student ,
  s.class_name
  from students s
  join borrows b ON b.id_students = s.id_students
  order by s.name_student desc;
  
  -- lấy ra 2 quyển sách được mượn nhiều nhất
  select
  b.id_books,
  b.title,
  count(*) as borrows_count
  from borrows br
  join books b ON br.id_books = b.id_books
  group by b.id_books , b.title
  order by borrows_count desc
  limit 2;