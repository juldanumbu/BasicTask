 CREATE DATABASE TaskDB

USE TaskDB

 CREATE TABLE customers
 (
     id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
     forename varchar(255) NOT NULL,
     surename varchar(255) NOT NULL,
     add1 varchar(255),
     add2 varchar(255),
     add3 varchar(255),
     postcode varchar(255),
     phone varchar(255) NOT NULL, UNIQUE,
     email varchar(255) NOT NULL, UNIQUE,
     registered bit NOT NULL,
 )

 CREATE TABLE logins
 (
     id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
     customer_id int,
     username varchar(255),
     password varchar(255), 
 )

 CREATE TABLE orders
 (
     id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
     customer_id int,
     registered bit,
     delivery_add_id int,
     payment_type varchar(255),
     date date,
     status varchar(255),
     session varchar(255),
     total int
 )

 CREATE TABLE order_items
 (
     id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
     order_id int,
     product_id int, 
     quantity int
 )

 CREATE TABLE products
 (
     id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
     cat_id int,
     name varchar(255),
     description varchar(255),
     image image,
     price int
 )

 CREATE TABLE delivery_address
 (
     id int PRIMARY KEY IDENTITY(1,1) NOT NULL,
     forename varchar(255),
     surename varchar(255),
     add1 varchar(255),
     add2 varchar(255),
     add3 varchar(255),
     postcode varchar(255),
     phone varchar(255),
     email varchar(255)
 )

 CREATE TABLE admins
 (
     id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
     username varchar(255),
     password varchar(255)
 )

 CREATE TABLE categories
 (
     id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
     name varchar(255),
     description varchar(255),
     image image,
 )

INSERT INTO customers
(forename, surename, postcode, phone, email, registered)
VALUES
('Peggie', 'Pallent', NULL, '521-107-9777', 'peggie@pallent.com', 1),
('Mathias', 'Foister', '56528', '545-991-1112', 'mathias@foister.com',0),
('Tamarra', 'Le Merchant', '551 84', '808-786-9467', 'tamara@lm.com',1),
('Janetta', 'Helin', NULL, '686-355-4931', 'janetta@helin.com',1),
('Reinhold', 'Martijn', NULL, '795-679-7136', 'reinhold@martijn.com',0),
('Lauritz', 'Provest', NULL, '296-351-8061', 'lauritz@provest.com',0),
('Con', 'Kupisz', NULL, '184-411-1830', 'con@kupisz.com',1),
('Beatrisa', 'Tomowicz', NULL, '979-772-1232', 'beatrisa@tomowicz.com',1),
('Nathanial', 'Rupert', '3025-419', '636-290-1463', 'nathanial@rupert.com',0),
('Etta', 'Edginton', '48100', '862-845-2560', 'etta@edginton.com', 1)


INSERT INTO order_items
(order_id, product_id, quantity)
VALUES
(4, 8, 4),
(8, 10, 11),
(8, 4, 1),
(1, 2, 3),
(7, 9, 15),
(1, 4, 13),
(10, 7, 6),
(9, 10, 12),
(7, 6, 11),
(6, 2, 16)

 INSERT INTO products
 (cat_id, name, description, image, price)
 VALUES
 (1, 'Truffle Paste', 'Future-proofed interactive forecast', 'http://dummyimage.com/107x194.png/ff4444/fffttt', 8791),
 (6, 'Carrots - Mini Red Organic', 'Object-based methodical functionalities', 'http://dummyimage.com/121x200.png/ff4444/ffffft', 9675),
 (4, 'Sprouts Dikon', 'Adaptive zero administration challenge', 'http://dummyimage.com/113x203.bmp/dddddd/000000', 9147),
 (4, 'Mushrooms - Black, Dried', 'Synergistic background secured', 'line http://dummyimage.com/179x246.jpg/ccO000/ffffff', 2019),
 (6, 'Coffee - Flavoured', 'Future-proofed even-keeled firmware', 'http://dummyimage.com/192x243.bmp/Sfa2dd/ffffff', 5270),
 (10, 'Juice - Orange', 'Progressive uniform solution', 'http://dummyimage.com/229x219.bmp/Sfa2dd/ffffff', 9780),
 (1, 'Energy Drink - Franks Original', 'Secured actuating service-desk', 'http://dummyimage.com/241x144.|pg/ff4444/fffTtt', 9676),
 (9, 'Energy - Boo - Koo', 'Enterprise-wide mobile artificial intelligence', 'http://dummyimage.com/241x176.png/ff4444/ffftft', 2916),
 (4, 'Tart - Lemon', 'Quality-focused object-oriented process improvement', 'http://dummyimage.com/151x181.bmp/Sfa2dd/ffffff', 2099),
 (5, 'Beef Tenderloin Aaa', 'Stand-alone systematic secured line', 'http://dummyimage.com/140x226.png/ccOOoo/fffftf', 6888)

 INSERT INTO categories
 (name, description, image)
 VALUES
 ('vegetables', 'lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat', 'http://dummyimage.com/109x123.)pg/ff4444/fffTft'),
 ('vegetables', 'eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante — ipsum primis in faucibus orci luctus et', 'http://dummyimage.com/133x136.png/ccOOoo/ffffff'),
 ('fruits', 'nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis —_eget elit sodales scelerisque', 'http://dummyimage.com/168x104.jpg/ff4444/fffttt'),
 ('vegetables', 'nulla nisl nunc nisl duis bibendum felis sed interdum venenatis', 'http://dummyimage.com/242x201 .jpg/dddddd/000000'),
 ('vegetables', 'tristique est et tempus semper est quam pharetra magna ac consequat metus sapien', 'http://dummyimage.com/223x206.bmp/Sfa2dd/ffffff'),
 ('vegetables', 'lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris', 'http://dummyimage.com/118x121.png/Sfa2da/ffffff'),
 ('fruits', 'vivamus metus arcu adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus pellentesque eget', 'http://dummyimage.com/233x124.jpg/dddddd/000000')

INSERT INTO delivery_address
(forename, surename, add1, post_code, phone email)
VALUES
('Harry', 'Blamires', '5 Northwestern Point', 'K67', '709-178-2038', 'hblamireso@lulu.com'),
('Adi', 'Carlon', '37136 Macpherson Street', NULL, '522-462-4973', 'acarlon1@discuz.net'),
('Barty', 'Monkley', '55 Hauk Trail', NULL, '879-792-1014', 'bmonkley2@ihg.com'),
('Salem', 'Ewert', '81078 Oakridge Circle', NULL, '223-256-8714', 'sewert3@hostgator.com'),
('Vilhelmina', 'Bairnsfather', '72949 Eastwood Street', '2402', '632-170-9234', 'vbairnsfather4@psu.edu'),
('Hayyim', 'Lisamore', '388 Birchwood Place', '71122', '901-562-9922', 'hlisamoreS@prweb.com'),
('Mareah', 'Gutans', '6 Tony Terrace', NULL, '142-802-2019', 'mgutans6@ucoz.com'),
('Garret', 'Grayston', '64394 Clove Place', NULL, '580-799-7576', 'ggrayston7@prweb.com'),
('Roxine', 'Booler', '69 Lakewood Gardens Place', '241551', '857-659-8653', 'rbooler8@springer.com'),
('Filbert', 'Brougham', '8756 Village Green Place', '5049', '476-610-5525', 'fbrougham9@si.edu')

INSERT INTO orders
(customer_id, registered, delivery_add_id, payment_type, date, status, total)
VALUES
(6, 0, 17, 'diners-club-us-ca', '2019-05-31', 'Paid', 182389),
(6, 1, 1, 'jcb', '2019-12-24', 'Canceled', 385376),
(2, 0, 4, 'mastercard', '2019-12-14', 'Canceled', 404804),
(10, 1, 13, 'jcb', '2019-07-16', 'Canceled', 428182),
(5, 1, 10, 'visa-electron', '2020-01-13', 'Canceled', 370261),
(6, 1, 3, 'americanexpress', '2019-10-22', 'Canceled', 440665),
(3, 0, 14, 'Jeb', '2020-01-30', 'Canceled', 427954),
(6, 0, 11, 'mastercard', '2019-08-30', 'Canceled', 250107),
(2, 0, 4, 'jcb', '2019-06-03', 'Paid', 144049),
(5, 0, 6, 'Jeb', '2019-08-31', 'Pending', 114408)

--NOMOR 1.

SELECT o.id, o.customer_id, (c.forename + ' ' + c.surename) AS fullname
FROM orders AS o JOIN customers AS c
ON c.id = o.customer_id

--NOMOR 2.

SELECT status, count(total) AS orders_count
FROM orders GROUP BY status;

--NOMOR 3.

--SELECT c.id, c.name AS cat_name, p.name AS pro_name
--FROM categories AS c LEFT JOIN products AS p
--ON c.id = p.cat_id
--GROUP BY c.id, c.name, p.name

SELECT c.name AS cat_name, STRING_AGG(p.name, ', ') AS pro_name
FROM categories AS c LEFT JOIN products AS p
ON c.id = p.cat_id
GROUP BY c.name

--NOMOR 4.

SELECT o.id AS order_id, da.add1
FROM orders AS o JOIN delivery_address AS da
ON o.delivery_add_id = da.id

--NOMOR 5.

SELECT oi.id AS order_item_id, p.name AS product_name, o.*
FROM order_items AS oi JOIN products AS p
ON oi.product_id = p.id
JOIN orders AS o
ON oi.order_id = o.id