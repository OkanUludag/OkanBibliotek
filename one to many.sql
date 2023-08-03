
CREATE TABLE customers (
	customer_id INT  PRIMARY KEY,
	name VARCHAR(255) NOT NULL,
	email VARCHAR(255) NOT NULL
);

INSERT INTO customers (customer_id,name, email)
VALUES (1,'Okan Uludag', 'OkanUludag@outlook.com'),
	   (2,'Fredrik Svensson', 'Fredrik.Svensson@outlook.com');

CREATE TABLE orders (
	order_id INT PRIMARY KEY,
	customer_id INT,
	order_date DATETIME,
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO orders(order_id, customer_id, order_date)
VALUES (1, 1, '2022-01-12'),
	   (2, 2, '2022-01-14');

Select customers.name, orders.order_date FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id;

INSERT INTO orders(order_id, customer_id, order_date)
VALUES (3, 1, '2022-01-12'),
	   (4, 1, '2022-01-14');

SELECT * FROM orders WHERE customer_id = 1;