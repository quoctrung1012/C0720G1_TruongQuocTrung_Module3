-- Và để tìm thông tin của Julie King (mã số 175), bạn sẽ query như sau:
SELECT * FROM customers WHERE customerNumber = 175; 
-- =========================================================================================
-- Nhưng trước khi sửa lại cấu trúc của table ở trên, chúng ta khảo sát 1 chút về cách theo dõi kết quả “Tăng tốc MySQL” mà bạn đang làm. Hãy sử dụng lệnh EXPLAIN
EXPLAIN SELECT * FROM customers WHERE customerNumber = 175;
-- table : Bảng nào đang liên quan đến output data
-- type : Đây là thông tin quan trọng, nó cho chúng ta biết kiểu query nào nó đang sử dụng. Mức độ từ tốt nhất đến chậm nhất như sau: system, const, eq_ref, ref, range, index, all
-- =========================================================================================
-- Nhìn lại câu query của chúng ta mới thật khủng khiếp. Không có Possible_keys nào được sử dụng, MySQL phải duyệt qua 17123 bản ghi mới tìm ra cái ta cần (Hãy tưởng tượng 1 Forum sẽ có đến hơn 500.000 bản ghi).
-- Các bạn thêm chỉ mục cho bảng customers như sau:

ALTER TABLE customers ADD INDEX idx_customerNumber(customerNumber);
EXPLAIN SELECT * FROM customers WHERE customerNumber = 175;
-- possible_keys : Đưa ra những Index có thể sử dụng để query
-- key : và Index nào đang được sử dụng
-- key_len : Chiều dài của từng mục trong Index
-- ref : Cột nào đang sử dụng
-- rows : Số hàng (rows) mà MySQL dự đoán phải tìm
-- extra : Thông tin phụ, thật tệ nếu tại cột này là “using temporary” hay “using filesort”
-- =========================================================================================
-- Nếu muốn thêm Index cho những cột mà có thể có nhiều hơn 1 kết quả khi query thì sao?
-- Bạn có thể Add index theo cặp như bạn add index cho cặp contactFirstName và contactLastName.
ALTER TABLE customers ADD INDEX idx_full_name(contactFirstName, contactLastName);
EXPLAIN SELECT * FROM customers WHERE contactFirstName = 'Jean' or contactFirstName = 'King';

-- =========================================================================================
-- Để xoá chỉ mục trong bảng, bạn làm như sau:
ALTER TABLE customers DROP INDEX idx_full_name;