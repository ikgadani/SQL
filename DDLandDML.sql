-- Isha Gadani
-- 041085940
-- PARENT ENTITIES ALWAYS COMES FIRST THEN CHILD ENTITIES WILL
-- MADE AFTER


CREATE DATABASE IF NOT EXISTS LAB6;

USE LAB6;

DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS product_types;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS order_lines;

CREATE TABLE customer(
customerID INT NOT NULL AUTO_INCREMENT,
NAME VARCHAR (50) NOT NULL,
email VARCHAR (150) NULL,
phone_number VARCHAR (20) NULL,
street_address VARCHAR (50) NULL,
city VARCHAR (30) NULL,
province CHAR (2) NULL,
postal_code CHAR (6) NULL,

CONSTRAINT customerPK PRIMARY KEY (customerID),
CONSTRAINT customerAK1 UNIQUE (name)
);

INSERT INTO customer VALUES (1 , 'isha' , 'lixdel@hotmail.com', '8904449999', '900 harry road', 'toronto', 'TO', 'K1L2Y2');
INSERT INTO customer VALUES (2 , 'larry' , 'larry@hotmail.com', '6476476477', '130 john street', 'ottawa', 'ON', 'K0T4G4');
INSERT INTO customer VALUES (3 , 'joe' , 'joe@hotmail.com', '6136136133', '70 mike street', 'toronto', 'TO', 'K1R9G9');
INSERT INTO customer VALUES (4 , 'samuel' , 'samuel@hotmail.com', '6130000000', '80 hawk road', 'montreal', 'MT', 'K1T6V8');
INSERT INTO customer VALUES (5 , 'elon' , 'elon@hotmail.com', '8199099009', '90 french street', 'ottawa', 'ON', 'K1T9G4');




CREATE TABLE orders 
(
orderID INT AUTO_INCREMENT NOT NULL ,
customerID INT NOT NULL,
order_date DATETIME NULL,



CONSTRAINT orderPK PRIMARY KEY (orderID),
CONSTRAINT customerFK FOREIGN KEY (customerID)

REFERENCES customer(customerID)

);


CREATE TABLE product_types
(
product_typesID int AUTO_INCREMENT NOT NULL,
NAME VARCHAR (50) NOT NULL,

CONSTRAINT product_typesPK PRIMARY KEY (product_typesID),
CONSTRAINT product_typesAK1 UNIQUE (name)

 
);

INSERT INTO product_types VALUES (1 , 'software');
INSERT INTO product_types VALUES (2 , 'hardware');
INSERT INTO product_types VALUES (3 , 'service');



CREATE TABLE products (

productID INT AUTO_INCREMENT NOT NULL,
DESCRIPTION VARCHAR (50) NOT NULL,
price DECIMAL (6,2),
product_typesID INT NOT NULL,

CONSTRAINT productPK PRIMARY KEY (productID),
CONSTRAINT productAK1 UNIQUE (description),
CONSTRAINT product_typesFK FOREIGN KEY (product_typesID)

REFERENCES product_types(product_typesID)
);

INSERT INTO products VALUES (1, 'WINDOWS', '50.0', 1);
INSERT INTO products VALUES (2, 'VISUAL STUDIO','42.99' , 1);
INSERT INTO products VALUES (3, 'MOUSE','15.99' ,2);
INSERT INTO products VALUES (4, 'MICROSOFT PRO ','400', 1);
INSERT INTO products VALUES (5, 'KEYBOARD','20.99', 2);
INSERT INTO products VALUES (6, 'CLEANING','30.99', 3);



CREATE TABLE order_lines
(
orderID INT NOT NULL,
productID INT NOT NULL,
quantity INT NULL,
price DECIMAL (6,2) NULL,
line_total DECIMAL (8,2) NULL,


CONSTRAINT orderFK FOREIGN KEY(orderID)
REFERENCES orders (orderID),

CONSTRAINT productFK FOREIGN KEY (productID)
REFERENCES products(productID)

)

SELECT *
FROM customer;

UPDATE customer
SET phone_number = 6139999999
WHERE customerID = 4;

UPDATE customer
SET postal_code = 'K1T7T7'
WHERE customerID = 3;



DELETE FROM products
WHERE product_typesID = 1;

SELECT *
FROM products;

SELECT *
FROM  product_types;


DELETE FROM product_types
WHERE product_typesID = 1;



