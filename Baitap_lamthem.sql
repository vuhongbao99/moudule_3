CREATE DATABASE furama_resort;
USE furama_resort;


-- ======================
-- 1) BẢNG DỊCH VỤ (CHA)
-- ======================
CREATE TABLE service (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name_service VARCHAR(100) NOT NULL,
    area DOUBLE NOT NULL,
    cost DECIMAL(15,2) NOT NULL,
    max_people INT NOT NULL,
    rent_type ENUM('Year','Month','Day','Hour') NOT NULL,
    service_type ENUM('Villa','House','Room') NOT NULL
);

-- Villa mở rộng
CREATE TABLE villa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    service_id INT UNIQUE,
    room_standard VARCHAR(50),
    description TEXT,
    pool_area DOUBLE,
    number_of_floors INT,
    FOREIGN KEY (service_id) REFERENCES service(id)
);

-- House mở rộng
CREATE TABLE house (
    id INT AUTO_INCREMENT PRIMARY KEY,
    service_id INT UNIQUE,
    room_standard VARCHAR(50),
    description TEXT,
    number_of_floors INT,
    FOREIGN KEY (service_id) REFERENCES service(id)
);

-- Room mở rộng
CREATE TABLE room (
    id INT AUTO_INCREMENT PRIMARY KEY,
    service_id INT UNIQUE,
    free_service VARCHAR(100),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

-- ======================
-- 2) DỊCH VỤ ĐI KÈM
-- ======================
CREATE TABLE extra_service (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name_extra VARCHAR(100) NOT NULL,
    unit VARCHAR(50) NOT NULL,
    price DECIMAL(15,2) NOT NULL
);

-- ======================
-- 3) NHÂN SỰ
-- ======================
CREATE TABLE education_degree (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name_degree ENUM('Trung cấp','Cao đẳng','Đại học','Sau đại học') NOT NULL
);

CREATE TABLE position_resort (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name_position ENUM('Lễ tân','Phục vụ','Chuyên viên','Giám sát','Quản lý','Giám đốc') NOT NULL
);

CREATE TABLE division (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name_division ENUM('Sale - Marketing','Hành Chính','Phục vụ','Quản lý') NOT NULL
);

CREATE TABLE employee (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birthday DATE NOT NULL,
    id_card VARCHAR(20) UNIQUE NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100),
    salary DECIMAL(15,2),
    education_id INT,
    position_id INT,
    division_id INT,
    FOREIGN KEY (education_id) REFERENCES education_degree(id),
    FOREIGN KEY (position_id) REFERENCES position_resort(id),
    FOREIGN KEY (division_id) REFERENCES division(id)
);

-- ======================
-- 4) KHÁCH HÀNG
-- ======================
CREATE TABLE customer_type (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name_type ENUM('Diamond','Platinium','Gold','Silver','Member') NOT NULL
);

CREATE TABLE customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birthday DATE NOT NULL,
    gender ENUM('Male','Female','Other') NOT NULL,
    id_card VARCHAR(20) UNIQUE NOT NULL,
    phone VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(255),
    customer_type_id INT,
    FOREIGN KEY (customer_type_id) REFERENCES customer_type(id)
);

-- ======================
-- 5) HỢP ĐỒNG
-- ======================
CREATE TABLE contract (
    id INT AUTO_INCREMENT PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    deposit DECIMAL(15,2) NOT NULL,
    total_money DECIMAL(15,2) NOT NULL,
    employee_id INT,
    customer_id INT,
    service_id INT,
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (service_id) REFERENCES service(id)
);

CREATE TABLE contract_detail (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contract_id INT,
    extra_service_id INT,
    quantity INT,
    FOREIGN KEY (contract_id) REFERENCES contract(id),
    FOREIGN KEY (extra_service_id) REFERENCES extra_service(id)
);

-- =======================================
-- SEED DỮ LIỆU (10 DÒNG MỖI BẢNG)
-- Chạy theo đúng thứ tự dưới đây
-- =======================================

-- 1) education_degree (10)
INSERT INTO education_degree (id, name_degree) VALUES
(1,'Trung cấp'),(2,'Cao đẳng'),(3,'Đại học'),(4,'Sau đại học'),
(5,'Trung cấp'),(6,'Cao đẳng'),(7,'Đại học'),(8,'Sau đại học'),
(9,'Cao đẳng'),(10,'Đại học');

-- 2) position_resort (10)
INSERT INTO position_resort (id, name_position) VALUES
(1,'Lễ tân'),(2,'Phục vụ'),(3,'Chuyên viên'),(4,'Giám sát'),
(5,'Quản lý'),(6,'Giám đốc'),(7,'Phục vụ'),(8,'Lễ tân'),
(9,'Chuyên viên'),(10,'Quản lý');

-- 3) division (10)
INSERT INTO division (id, name_division) VALUES
(1,'Sale - Marketing'),(2,'Hành Chính'),(3,'Phục vụ'),(4,'Quản lý'),
(5,'Sale - Marketing'),(6,'Hành Chính'),(7,'Phục vụ'),(8,'Quản lý'),
(9,'Phục vụ'),(10,'Hành Chính');

-- 4) customer_type (10)
INSERT INTO customer_type (id, name_type) VALUES
(1,'Diamond'),(2,'Platinium'),(3,'Gold'),(4,'Silver'),(5,'Member'),
(6,'Diamond'),(7,'Platinium'),(8,'Gold'),(9,'Silver'),(10,'Member');

-- 5) extra_service (10)
INSERT INTO extra_service (id, name_extra, unit, price) VALUES
(1,'Massage','Giờ',400000),
(2,'Karaoke','Giờ',200000),
(3,'Bữa trưa set menu','Suất',250000),
(4,'Nước uống','Chai',20000),
(5,'Thuê xe tham quan','Giờ',150000),
(6,'Giặt ủi','Bộ',50000),
(7,'BBQ ngoài trời','Suất',300000),
(8,'Spa','Giờ',350000),
(9,'Coffee break','Suất',100000),
(10,'Tour city','Chuyến',1200000);

-- 6) employee (10)
INSERT INTO employee
(id, full_name, birthday, id_card, phone, email, salary, education_id, position_id, division_id)
VALUES
(1,'Nguyễn Văn A','1990-01-01','201111111','0905000001','a.nguyen@furama.vn',12000000,1,1,1),
(2,'Trần Thị B','1988-02-15','201222222','0905000002','b.tran@furama.vn',15000000,2,2,2),
(3,'Lê Văn C','1992-03-20','201333333','0905000003','c.le@furama.vn',17000000,3,3,3),
(4,'Phạm Thị D','1995-04-10','201444444','0905000004','d.pham@furama.vn',14000000,4,4,4),
(5,'Hoàng E','1993-05-05','201555555','0905000005','e.hoang@furama.vn',16000000,5,5,5),
(6,'Trịnh F','1991-06-18','201666666','0905000006','f.trinh@furama.vn',18000000,6,6,6),
(7,'Khánh G','1989-07-22','201777777','0905000007','g.khanh@furama.vn',20000000,7,7,7),
(8,'Hải H','1994-08-30','201888888','0905000008','h.hai@furama.vn',19000000,8,8,8),
(9,'Thu K','1996-09-12','201999999','0905000009','k.thu@furama.vn',13000000,9,9,9),
(10,'Kiệt L','1997-10-25','202000000','0905000010','l.kiet@furama.vn',12500000,10,10,10);

-- 7) customer (10)
INSERT INTO customer
(id, full_name, birthday, gender, id_card, phone, email, address, customer_type_id)
VALUES
(1,'Nguyễn Thị Lan','1995-01-01','Female','203111111','0912000001','lan.nguyen@example.com','Q. Hải Châu, Đà Nẵng',1),
(2,'Trần Văn Nam','1990-02-12','Male','203222222','0912000002','nam.tran@example.com','Q. Sơn Trà, Đà Nẵng',2),
(3,'Lê Thị Hồng','1987-03-23','Female','203333333','0912000003','hong.le@example.com','Q. Ngũ Hành Sơn, Đà Nẵng',3),
(4,'Phạm Văn Dũng','1992-04-14','Male','203444444','0912000004','dung.pham@example.com','Huế',4),
(5,'Hoàng Thị Mai','1993-05-25','Female','203555555','0912000005','mai.hoang@example.com','Quảng Trị',5),
(6,'Đỗ Quốc Huy','1994-06-06','Male','203666666','0912000006','huy.do@example.com','Đà Nẵng',6),
(7,'Ngô Thị Hạnh','1989-07-17','Female','203777777','0912000007','hanh.ngo@example.com','Quảng Trị',7),
(8,'Bùi Văn An','1991-08-28','Male','203888888','0912000008','an.bui@example.com','Hội An',8),
(9,'Phan Thị Hoa','1988-09-09','Female','203999999','0912000009','hoa.phan@example.com','Đông Hà, Quảng Trị',9),
(10,'Trịnh Văn Tuấn','1996-10-20','Male','204000000','0912000010','tuan.trinh@example.com','Q. Thanh Khê, Đà Nẵng',10);

-- 😎 service (10)
INSERT INTO service
(id, name_service, area, cost, max_people, rent_type, service_type)
VALUES
(1,'Villa Ocean A',300,8000000,8,'Day','Villa'),
(2,'Villa Garden B',250,6000000,6,'Day','Villa'),
(3,'House Family C',150,3000000,5,'Month','House'),
(4,'House Deluxe D',180,3500000,6,'Day','House'),
(5,'Room Superior E',40,900000,2,'Day','Room'),
(6,'Room Standard F',35,700000,2,'Day','Room'),
(7,'Villa Premium G',320,10000000,10,'Day','Villa'),
(8,'House Classic H',140,2800000,5,'Month','House'),
(9,'Room Deluxe I',45,1200000,2,'Day','Room'),
(10,'Room Basic J',30,500000,2,'Day','Room');

-- villa / house / room mở rộng (tham chiếu service)
INSERT INTO villa (id, service_id, room_standard, description, pool_area, number_of_floors) VALUES
(1,1,'5 sao','View biển, hồ bơi lớn',60,2),
(2,2,'4 sao','Sân vườn riêng',40,2),
(3,7,'5 sao','Siêu sang trọng',80,3);

INSERT INTO house (id, service_id, room_standard, description, number_of_floors) VALUES
(1,3,'4 sao','Phù hợp gia đình',2),
(2,4,'4 sao','Nội thất gỗ',3),
(3,8,'3 sao','Cổ điển',2);

INSERT INTO room (id, service_id, free_service) VALUES
(1,5,'Nước suối miễn phí'),
(2,6,'Giặt ủi miễn phí'),
(3,9,'Ăn sáng miễn phí'),
(4,10,'Cafe miễn phí');

-- 9) contract (10)
INSERT INTO contract
(id, start_date, end_date, deposit, total_money, employee_id, customer_id, service_id)
VALUES
(1,'2025-01-01','2025-01-05',2000000,25000000,1,1,1),
(2,'2025-02-01','2025-02-03',1000000,12000000,2,2,2),
(3,'2025-03-01','2025-03-07',3000000,35000000,3,3,3),
(4,'2025-04-01','2025-04-02',500000,5000000,4,4,5),
(5,'2025-05-01','2025-05-05',1500000,10000000,5,5,6),
(6,'2025-06-01','2025-06-04',1000000,15000000,6,6,7),
(7,'2025-07-01','2025-07-02',800000,6000000,7,7,8),
(8,'2025-08-01','2025-08-03',2000000,18000000,8,8,9),
(9,'2025-09-01','2025-09-05',2500000,20000000,9,9,10),
(10,'2025-10-01','2025-10-07',3500000,40000000,10,10,1);

-- 10) contract_detail (10)
INSERT INTO contract_detail (id, contract_id, extra_service_id, quantity) VALUES
(1,1,1,2),
(2,1,2,3),
(3,2,4,10),
(4,3,5,5),
(5,4,3,2),
(6,5,6,4),
(7,6,7,1),
(8,7,8,2),
(9,8,9,3),
(10,9,10,1);

-- 2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select *
from employee where (full_name like 'A%'
or   full_name like 'T%' 
or   full_name like 'K%')   ;
                
                
	-- 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select birthday,
address	
from customer 
where (timestampdiff(year, birthday, CURDATE()) BETWEEN 18 AND 50)
and address like '%Đà Nẵng%'
or  address like  '%Quảng Trị%';
	 
-- 4.Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
	
	select c.id,
           c.full_name,
           ct.name_type as customer_name,
           count(*) as quantity_cus
	from customer c 
    join customer_type ct on c.customer_type_id = ct.id
    where ct.name_type = 'Diamond'
    group by c.id , c.full_name , ct.name_type
    order by quantity_cus asc

-- 5.	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
