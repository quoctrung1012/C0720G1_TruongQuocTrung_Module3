create view customer_views as 
select customerNumber, customerName,phone,city,state
from customers;
select * from customer_views;
drop view customer_views;

CREATE OR REPLACE VIEW customer_views AS
SELECT customerNumber, customerName, contactFirstName, contactLastName, phone,city
FROM customers
WHERE city = 'Nantes';
select * from customer_views;
