create database quan_ly_sinh_vien_thuc_hanh;
use quan_ly_sinh_vien_thuc_hanh;

create table class(
 class_id int auto_increment,
 class_name varchar(50),
 start_date date,
 status_cl int(2),
 primary key(class_id)

);
create table students(
student_id int auto_increment,
student_name varchar(50),
adress varchar(50),
phone_number int(11),
status_student int (2),
class_id int,
primary key(student_id),
foreign key (class_id) references class(class_id)
);

create table subjects(
sub_id int auto_increment,
sub_name varchar(50),
credit int,
status_sub int (2),
primary key(sub_id)

);

create table mark(
 mark_id int auto_increment,
 mark double,
 sub_id int,
 student_id int,
 primary key(mark_id),
 foreign key(sub_id) references subjects(sub_id),
foreign key (student_id) references students(student_id)

 
);


ALTER TABLE students MODIFY COLUMN phone_number VARCHAR(15);
ALTER TABLE mark ADD COLUMN exam_times int;


INSERT INTO students (student_name, adress, phone_number, status_student, class_id) VALUES
('Nguyen Van A', 'Ha Noi', 1234567890, 1, 1),
('Tran Thi B', 'Da Nang', 2345678901, 1, 1),
('Le Van C', 'Hue', 3456789012, 1, 2),
('Pham Thi D', 'Ho Chi Minh', 4567890123, 0, 3);

INSERT INTO subjects (sub_name, credit, status_sub) VALUES
('Mathematics', 3, 1),
('English', 2, 1),
('Computer Science', 4, 1),
('History', 2, 0);

INSERT INTO Mark (sub_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);

INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

INSERT INTO students (student_name,adress,phone_number,status_student,class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO students (student_name,adress, status_student,class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO students (student_name,adress,phone_number,status_student,class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subjects
VALUES (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 
 INSERT INTO mark (sub_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
 (1, 2, 10, 2),
 (2, 1, 12, 1);


SELECT * FROM students;
SELECT * FROM mark;
SELECT * FROM class;
SELECT * FROM subjects;



SELECT * FROM students WHERE student_name LIKE 'h%';

SELECT * FROM class 
WHERE MONTH(start_date) = 12;


SELECT * FROM subjects
WHERE credit >= 3 AND credit <=5 ;


UPDATE students
SET class_id = 2
WHERE student_name = 'Hung';

SET SQL_SAFE_UPDATES = 0;
UPDATE students
SET class_id = 2
WHERE student_name = 'Hung';
SET SQL_SAFE_UPDATES = 1;

SELECT s.student_name AS StudentName,
       sub.sub_name AS SubName,
       m.mark AS Mark
FROM mark m
JOIN students s ON m.student_id = s.student_id
JOIN subjects sub ON m.sub_id = sub.sub_id
ORDER BY m.mark DESC, s.student_name ASC;


-- Hiển thị số lượng sinh viên ở từng nơi
SELECT adress, COUNT(student_id) AS 'Số lượng sinh viên từng nơi'
FROM students
GROUP BY adress ;

-- Tính điểm trung bình các môn học của mỗi sinh viên bằng cách sử dụng hàm AVG và hiển thị điều kiện điểm trung bình các môn phải lớn hơn 15
SELECT S.student_id , S.student_name, AVG(mark)
FROM students S JOIN mark m ON S.student_id = m.student_id
GROUP BY S.student_id, S.student_name
HAVING AVG(mark) >= ALL (SELECT AVG(mark) FROM mark GROUP BY mark.student_id)
-- HAVING AVG(mark) >15;

-- Hiển thị tất cả các thông tin của môn học (bảng subjects) có credit lớn nhất

SELECT  * FROM subjects s
WHERE s.credit = (SELECT MAX(credit) FROM subjects);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT s.* , m.mark FROM subjects s
JOIN mark m ON s.sub_id = m.sub_id 
WHERE m.mark=(SELECT MAX(mark)FROM mark)

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự giảm dần 
SELECT s. * , m.mark FROM students s
JOIN mark m ON s.student_id = m.student_id
WHERE m.mark=(SELECT AVG(mark) ORDER BY mark DESC)






