-- Bước 1: Sử dụng inner join để lấy dữ liệu từ hai bảng.
select customers.customerNumber, customerName, phone, paymentDate, amount from customers
inner join payments
on customers.customerNumber = payments.customerNumber
where city = 'Las Vegas';

-- Bước 2: Sử dụng left join để lấy dữ liệu từ hai bảng. 

select customers.customerNumber, customers.customerName, orders.orderNumber, orders.status
from customers
left join orders
on customers.customerNumber = orders.customerNumber ;

-- Tất cả các bản ghi trong bảng customers đều được đưa vào bộ kết quả. 
-- Tuy nhiên, có những bản ghi trong bộ kết quả có dữ liệu khách hàng nhưng không có dữ liệu đặt hàng ví dụ: 168, 169, vv các dữ liệu lệnh trong những hàng này là NULL. 
-- Điều này có nghĩa là những khách hàng này không có đơn hàng nào trong bảng orders.
-- Nếu bạn thay thế mệnh đề LEFT JOIN bởi mệnh đề INNER JOIN, bạn chỉ nhận được những khách hàng có đơn đặt hàng trong bảng đơn đặt hàng.
-- Để tìm tất cả khách hàng chưa đặt hàng bất kỳ sản phẩm nào, bạn có thể sử dụng truy vấn sau: 

select customers.customerNumber, customers.customerName, orders.orderNumber, orders.status
from customers LEFT JOIN orders
on customers.customerNumber = orders.customerNumber
where orderNumber is null;


