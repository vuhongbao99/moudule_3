create database bai_tap;

use bai_tap;

create table products(
  id int auto_increment,
  product_code int not null,
  product_name varchar (50) not null,
  product_price double not null,
  product_amount int not null,
  product_descreption varchar(50),
  product_status varchar(50),
  primary key(id)

);

INSERT INTO products (product_code, product_name, product_price, product_amount, product_descreption, product_status)
VALUES 
(1006, 'MacBook Air M2',        1199.00, 20, 'Laptop Apple mỏng nhẹ',            'Còn hàng'),
(1007, 'Dell XPS 13',           1099.00, 15, 'Ultrabook cao cấp của Dell',       'Còn hàng'),
(1008, 'Asus ROG Phone 7',       899.00, 25, 'Điện thoại gaming hiệu năng cao',  'Còn hàng'),
(1009, 'Lenovo ThinkPad X1',    1299.00, 12, 'Laptop doanh nhân bền bỉ',         'Còn hàng'),
(1010, 'HP Pavilion 15',         649.99, 30, 'Laptop học sinh, sinh viên',       'Còn hàng'),
(1011, 'iPad Pro M2',            999.99, 18, 'Máy tính bảng hiệu suất cao',      'Còn hàng'),
(1012, 'Apple Watch Series 9',   399.99, 35, 'Đồng hồ thông minh Apple',         'Còn hàng'),
(1013, 'AirPods Pro 2',          249.00, 50, 'Tai nghe chống ồn Apple',          'Còn hàng'),
(1014, 'Logitech MX Master 3S',   99.99, 40, 'Chuột không dây cao cấp',          'Còn hàng'),
(1015, 'Sony WH-1000XM5',        349.99, 22, 'Tai nghe chống ồn Sony',           'Còn hàng');

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)

CREATE UNIQUE INDEX idx_product_code ON products(product_code) ;

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
CREATE UNIQUE INDEX idx_name_price ON products(product_name,product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
EXPLAIN SELECT * FROM products WHERE product_code = 3;
EXPLAIN SELECT * FROM products WHERE product_name = 'MacBook Air M2';

-- So sánh câu truy vấn trước và sau khi tạo index : trước và sau truy vấn sẽ giống hết nhau nhưng khi dùng index thì nó tìm đến vị trí chứa giá trị
-- không cần quét toàn bộ bảng =>> truy vấn nhanh hơn.

--  Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
CREATE VIEW product_view AS
SELECT product_code, product_name, product_price, product_amount,product_descreption,product_status
FROM products ; 

SELECT * FROM product_view ;

-- cập nhật product_view
UPDATE product_view 
SET product_price = 2000
WHERE product_name = 'MacBook Air M2'
 -- xóa view
 
DELETE FROM product_view
 WHERE product_code = '1006'; 
 
 
 -- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
 DELIMITER //
 
 CREATE PROCEDURE getAllProduct()
 BEGIN 
  
  SELECT * FROM products;
  
  END //
  
  DELIMITER ;
  
  -- Tạo store procedure thêm một sản phẩm mới

DELIMITER // 

CREATE PROCEDURE addProduct(
  IN p_code int ,
  IN p_name varchar (50) ,
  IN p_price double,
  IN p_amount int ,
  IN p_description varchar(50),
  IN p_status varchar(50)
) 

BEGIN 
  INSERT INTO products(
   product_code,
   product_name,
   product_price,
   product_amount,
   product_descreption,
   product_status
  )
  VALUES (
        p_code,
        p_name,
        p_price,	
        p_amount,
        p_description,
        p_status
    );

END //
DELIMITER ;


call addProduct(1016, 'Realme 12 Pro', 499.99, 25, 'Camera ẩn dưới màn hình', 'Còn hàng');

-- Tạo store procedure sửa thông tin sản phẩm theo id

DELIMITER //

CREATE PROCEDURE updateProductById(
    IN p_id INT,
    IN p_code INT,
    IN p_name VARCHAR(50),
    IN p_price DOUBLE,
    IN p_amount INT,
    IN p_description VARCHAR(50),
    IN p_status VARCHAR(50)
)
BEGIN
    UPDATE products
    SET 
        id = p_id,
        product_code = p_code,
        product_name = p_name,
        product_price = p_price,
        product_amount = p_amount,
        product_descreption = p_description,
        product_status = p_status
    WHERE id = p_id;
END //

DELIMITER ;

CALL updateProductById( 3,2003,'iPhone 15 Pro Max',1199.99,15,'Bản cao cấp nhất','Còn hàng');

-- Tạo store procedure xoá sản phẩm theo id
DELIMITER //

CREATE PROCEDURE deleteProductById(
    IN p_id INT
)
BEGIN
    DELETE FROM products
    WHERE id = p_id;
END //

DELIMITER ;

CALL deleteProductById(3);



