.open restaurant.db

-- create table 1
DROP TABLE customers;  --just for create a same table
CREATE TABLE IF NOT EXISTS customers (
    customerid int,
    name text,
    many_people int,
    branchid int
);

INSERT INTO customers VALUES 
    (1, "toy", 5, 1),
    (2, "jane", 3, 2),
    (3, "Jonut", 1, 1),
    (4, "Flook", 2, 2),
    (5, "Joy", 1, 1);

-- create table 2
DROP TABLE menus;
CREATE TABLE IF NOT EXISTS menus (
    menusid int,
    name text,
    price decimal(999,2)
);

INSERT INTO menus VALUES 
    (1, "Pad Thai", 19.99),
    (2, "Tom Yum", 39.99),
    (3, "Egg Boil", 1.99);

-- create table 3
DROP TABLE branchs;
CREATE TABLE IF NOT EXISTS branchs (
    branchid int,
    branchname text
);

INSERT INTO branchs VALUES 
    (1, "BKK"),
    (2, "CNX");

-- create table 4
DROP TABLE orders;
CREATE TABLE IF NOT EXISTS orders (
    orderid int,
    customerid int,
    menusid int,
    branchid int
);

INSERT INTO orders VALUES 
    (1, 5, 3, 1),
    (2, 1, 2, 1),
    (3, 4, 1, 1),
    (4, 2, 1, 2),
    (5, 3, 2, 2);

-- list tables in the db 
.table 

-- change how we display data in terminal/ shell
.mode column 
SELECT * FROM customers;
SELECT * FROM menus;
SELECT * FROM branchs;
SELECT * FROM orders;

-- Aggregate Functions
SELECT 
  SUM(price) || " " || "CAD" as total_menu_price
FROM menus;

--Join tables
SELECT
  ord.orderid as orderlist,
  cus.name as customername,
  bra.branchname as branchname,
  men.name as menuname,
  men.price || " " || "CAD" as total
FROM customers as cus
JOIN branchs as bra ON cus.branchid = bra.branchid
JOIN orders as ord ON ord.customerid = cus.customerid
JOIN menus as men ON ord.menusid = men.menusid
ORDER BY orderlist;

-- Common Table Expression (WITH)
WITH sub1 AS (
  SELECT * FROM customers
  WHERE name LIKE 'J%'
), sub2 AS (
  SELECT * FROM branchs
  WHERE branchid = 1
)

SELECT 
  sub1.name,
  sub2.branchname
FROM sub1
JOIN sub2
ON sub1.branchid = sub2.branchid;
