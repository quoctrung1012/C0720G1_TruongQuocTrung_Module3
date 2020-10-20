create database bai_03_thuc_hanh_tao_khoa_phu;
drop database bai_03_thuc_hanh_tao_khoa_phu;
CREATE TABLE customers(
   id_customers INT AUTO_INCREMENT PRIMARY KEY,
   name VARCHAR(40),
   address VARCHAR(255),
   email VARCHAR(255)
);

-- tạo khóa ngoại:
CREATE TABLE orders(
   id_orders INT AUTO_INCREMENT PRIMARY KEY,
   staff VARCHAR(50),
   customer_id INT,
   FOREIGN KEY (customer_id) REFERENCES customers(id_customers)
);

