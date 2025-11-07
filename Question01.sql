CREATE TABLE products(
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	category VARCHAR(50)
);

CREATE TABLE orders(
	id SERIAL PRIMARY KEY,
	product_id INT REFERENCES products(id),
	quantity INT,
	total_price NUMERIC(10,2)
);

INSERT INTO products (name,category) VALUES
('Laptop Dell', 'Electronics'),
('IPhone 15', 'Electronics'),
('Bàn học gỗ', 'Furniture'),
('Ghế xoay', 'Furniture');

INSERT INTO orders(product_id,quantity,total_price) VALUES
(1,2,2200),
(2,3,3300),
(3,5,2500),
(4,4,1600),
(1,1,1100);

SELECT * FROM products;
SELECT * FROM orders; 

-- Hiển thị tổng doanh thu và Số lượng sản phẩm bán được 

SELECT p.category "Danh mục", SUM(o.total_price) AS "Tổng doanh thu"
FROM products as p
JOIN orders as o 
ON p.id = o.product_id 
GROUP BY p.category; 

-- Hiển thị những nhóm có tổng doang thu lớn hơn 2000 

SELECT p.category "Danh mục"
FROM products as p
JOIN orders as o 
ON p.id = o.product_id 
GROUP BY p.category HAVING SUM(total_price) > 2000;


-- Hiển thị theo thứ tự tổng doanh thu giảm dần 
SELECT p.category "Danh mục", SUM(o.total_price) AS "Tổng doanh thu"
FROM products as p
JOIN orders as o 
ON p.id = o.product_id 
GROUP BY p.category ORDER BY SUM(o.total_price) DESC;
