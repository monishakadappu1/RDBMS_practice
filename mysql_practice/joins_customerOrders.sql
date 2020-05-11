CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(id)
); 

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
       
SELECT * FROM customers
WHERE last_name='George';

SELECT * FROM orders 
WHERE customer_id=1;

-- subquery for this
SELECT * FROM orders 
WHERE customer_id= (SELECT id FROM customers
                    WHERE last_name='George');

-- cross join
SELECT * FROM customers,orders;


-- implicit inner join
SELECT * FROM customers,orders
WHERE customers.id = orders.customer_id;

SELECT first_name,last_name,order_date,amount FROM customers,orders
WHERE customers.id = orders.customer_id;

-- explicit inner join
SELECT 
    first_name,last_name,order_date,amount
FROM customers JOIN orders
ON customers.id = orders.customer_id;

SELECT 
    first_name,last_name,order_date,amount
FROM orders JOIN customers
ON customers.id = orders.customer_id;

SELECT 
    first_name,last_name,order_date,amount
FROM customers JOIN orders
ON customers.id = orders.customer_id
ORDER BY amount;
       
SELECT
    first_name,last_name,
    AVG(amount) AS spent
FROM customers JOIN orders
ON orders.customer_id = customers.id
GROUP BY orders.customer_id
ORDER BY amount;

-- left join
       
SELECT * FROM customers
INNER JOIN orders 
ON customers.id=orders.customer_id;
 -- becomes
SELECT * FROM customers
LEFT JOIN orders 
ON customers.id=orders.customer_id;      


SELECT first_name,last_name,order_date,amount 
FROM customers
LEFT JOIN orders 
ON customers.id=orders.customer_id; 

SELECT first_name,last_name,order_date,amount 
FROM customers
LEFT JOIN orders 
ON customers.id=orders.customer_id
GROUP BY customers.id; 

SELECT first_name,last_name,
    SUM(amount) 
FROM customers
LEFT JOIN orders 
ON customers.id=orders.customer_id
GROUP BY customers.id; 

SELECT 
    first_name,
    last_name,
    IFNULL(SUM(amount),0) AS total_spent
FROM customers
LEFT JOIN orders 
ON customers.id=orders.customer_id
GROUP BY customers.id
ORDER BY total_spent; 

-- RIGHT JOIN
SELECT * FROM customers
RIGHT JOIN orders 
ON customers.id=orders.customer_id;  

-- SCHEMA CONSTRAINT ON DELETEALTER
-- GIVE ON DELETE CASCADE IN SCHEMA 

    CREATE TABLE customers(
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE orders(
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE,
    amount DECIMAL(8,2),
    customer_id INT,
    FOREIGN KEY(customer_id) 
        REFERENCES customers(id)
         ON DELETE CASCADE
); 

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
      
      
-- exercises    
       
    
