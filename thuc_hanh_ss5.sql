create database company;

use company

CREATE TABLE employees (
      id INT AUTO_INCREMENT PRIMARY KEY,
      name VARCHAR(50) NOT NULL,
      department VARCHAR(50) NOT NULL,
      salary DECIMAL(10,2) NOT NULL
);
-- sử dụng trigger
DROP TRIGGER IF EXISTS update_department;

DELIMITER //

CREATE TRIGGER update_department
BEFORE INSERT ON employees
FOR EACH ROW
BEGIN 
    IF NEW.salary >= 5000 THEN
        SET NEW.department = 'Management';
    ELSEIF NEW.salary >= 3000 THEN
        SET NEW.department = 'Sales';
    ELSE 
        SET NEW.department = 'Support';
    END IF;
END //

DELIMITER ;
  
  
  
  
  