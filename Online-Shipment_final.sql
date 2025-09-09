CREATE DATABASE project_final_1;
USE project_final_1;

CREATE TABLE address_user (
    address_id INT PRIMARY KEY,
    streat VARCHAR(50),
    city VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE user (
    user_id INT PRIMARY KEY,
    f_name VARCHAR(50),
    l_name VARCHAR(50),
    email VARCHAR(50),
    role_name VARCHAR(50),
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES address_user(address_id)
);

CREATE TABLE user_pass (
    user_id INT,
    password VARCHAR(50),
    PRIMARY KEY(user_id, password),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE user_phonenumber (
    user_id INT,
    phonenumber VARCHAR(50),
    PRIMARY KEY(user_id, phonenumber),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE tracking (
    tracking_id INT PRIMARY KEY,
    location VARCHAR(50),
    time VARCHAR(50),
    status_name VARCHAR(50)
);

CREATE TABLE courier (
    courier_id INT PRIMARY KEY,
    tracking_id INT,
    f_name VARCHAR(50),
    l_name VARCHAR(50),
    email VARCHAR(50),
    FOREIGN KEY (tracking_id) REFERENCES tracking(tracking_id)
);

CREATE TABLE shipment (
    shipment_id INT PRIMARY KEY,
    courier_id INT,
    user_id INT,
    cost INT,
    sender INT,
    delivery_date VARCHAR(50),
    reciever VARCHAR(50),
    status VARCHAR(50),
    standard VARCHAR(50),
    express VARCHAR(50),
    weight INT,
    FOREIGN KEY (courier_id) REFERENCES courier(courier_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE payment (
    user_id INT,
    payment_id INT,
    shipment_id INT,
    status VARCHAR(50),
    method VARCHAR(50),
    amount INT,
    PRIMARY KEY(user_id, payment_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (shipment_id) REFERENCES shipment(shipment_id)
);

CREATE TABLE user_tracking (
    tracking_id INT,
    user_id INT,
    PRIMARY KEY (tracking_id, user_id),
    FOREIGN KEY (tracking_id) REFERENCES tracking(tracking_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE courier_phone (
    courier_id INT,
    phone_number VARCHAR(50),
    PRIMARY KEY(courier_id, phone_number),
    FOREIGN KEY(courier_id) REFERENCES courier(courier_id)
);

CREATE TABLE tracking_shipment (
    tracking_id INT,
    shipment_id INT,
    PRIMARY KEY (tracking_id, shipment_id),
    FOREIGN KEY(tracking_id) REFERENCES tracking(tracking_id),
    FOREIGN KEY(shipment_id) REFERENCES shipment(shipment_id)
);

CREATE TABLE ware_house (
    warehouse_id INT PRIMARY KEY,
    location VARCHAR(50),
    capacity VARCHAR(50)
);

CREATE TABLE courier_warehouse (
    courier_id INT,
    warehouse_id INT,
    PRIMARY KEY(courier_id, warehouse_id),
    FOREIGN KEY(courier_id) REFERENCES courier(courier_id),
    FOREIGN KEY(warehouse_id) REFERENCES ware_house(warehouse_id)
);

CREATE TABLE shipment_warehouse (
    shipment_id INT,
    warehouse_id INT,
    PRIMARY KEY(shipment_id, warehouse_id),
    FOREIGN KEY(shipment_id) REFERENCES shipment(shipment_id),
    FOREIGN KEY(warehouse_id) REFERENCES ware_house(warehouse_id)
);

-- Insertions
INSERT INTO address_user (address_id, streat, city, country)
VALUES 
(1, 'Street 1', 'Cairo', 'Egypt'),
(2, 'Street 2', 'Alexandria', 'Egypt');

INSERT INTO user (user_id, f_name, l_name, email, role_name, address_id)
VALUES 
(1, 'Ali', 'Hassan', 'ali@example.com', 'sender', 1),
(2, 'Mona', 'Youssef', 'mona@example.com', 'receiver', 2);

INSERT INTO user_pass (user_id, password)
VALUES 
(1, 'pass123'),
(2, 'mypass456');

INSERT INTO user_phonenumber (user_id, phonenumber)
VALUES 
(1, '01012345678'),
(1, '01122334455'),
(2, '01298765432');

INSERT INTO tracking (tracking_id, location, time, status_name)
VALUES 
(1, 'Cairo', '2025-05-18 10:00', 'In Transit'),
(2, 'Alexandria', '2025-05-17 09:30', 'Delivered');

INSERT INTO courier (courier_id, tracking_id, f_name, l_name, email)
VALUES 
(1, 1, 'Khaled', 'Mahmoud', 'khaled@example.com'),
(2, 2, 'Nora', 'Ali', 'nora@example.com');

INSERT INTO shipment (shipment_id, courier_id, user_id, cost, sender, delivery_date, reciever, status, standard, express, weight)
VALUES 
(1, 1, 1, 100, 1, '2025-05-20', 'Mona Youssef', 'In Transit', 'Yes', 'No', 5),
(2, 2, 2, 150, 2, '2025-05-19', 'Ali Hassan', 'Delivered', 'No', 'Yes', 3);

INSERT INTO payment (user_id, payment_id, shipment_id, status, method, amount)
VALUES 
(1, 1, 1, 'Paid', 'Credit Card', 100),
(2, 2, 2, 'Pending', 'Cash', 150);

INSERT INTO user_tracking (tracking_id, user_id)
VALUES 
(1, 1),
(2, 2);

INSERT INTO courier_phone (courier_id, phone_number)
VALUES 
(1, '01055555555'),
(2, '01166666666');

INSERT INTO tracking_shipment (tracking_id, shipment_id)
VALUES 
(1, 1),
(2, 2);

INSERT INTO ware_house (warehouse_id, location, capacity)
VALUES 
(1, 'Nasr City', '1000'),
(2, 'Smouha', '800');

INSERT INTO courier_warehouse (courier_id, warehouse_id)
VALUES 
(1, 1),
(2, 2);

INSERT INTO shipment_warehouse (shipment_id, warehouse_id)
VALUES 
(1, 1),
(2, 2);

-- Updates
UPDATE user 
SET email = 'mohammed.new@email.com' 
WHERE user_id = 1;

UPDATE shipment 
SET status = 'تم التوصيل', delivery_date = '2025-05-17' 
WHERE shipment_id = 1;

UPDATE address_user 
SET streat = 'شارع النصر', city = 'الدمام' 
WHERE address_id = 1;

UPDATE payment 
SET method = 'نقداً', amount = 180 
WHERE user_id = 1 AND shipment_id = 1;

UPDATE courier 
SET f_name = 'محمود', l_name = 'أحمد', email = 'mahmoud@courier.com' 
WHERE courier_id = 1;

-- Selects
SELECT * FROM address_user;
SELECT * FROM courier;
SELECT * FROM courier_phone;
SELECT * FROM courier_warehouse;
SELECT * FROM payment;
SELECT * FROM shipment;
SELECT * FROM shipment_warehouse;
SELECT * FROM tracking;
SELECT * FROM tracking_shipment;
SELECT * FROM user;
SELECT * FROM user_pass;
SELECT * FROM user_phonenumber;
SELECT * FROM user_tracking;
SELECT * FROM ware_house;

SELECT u.user_id, u.f_name, u.l_name, s.shipment_id, s.status
FROM user u
LEFT JOIN shipment s ON u.user_id = s.user_id;

SELECT c.courier_id, c.f_name, c.l_name, w.warehouse_id, w.location
FROM courier c
LEFT JOIN courier_warehouse cw ON c.courier_id = cw.courier_id
LEFT JOIN ware_house w ON cw.warehouse_id = w.warehouse_id;

SELECT s.shipment_id, s.status, p.status AS payment_status, p.amount
FROM shipment s
LEFT JOIN payment p ON s.shipment_id = p.shipment_id;

SELECT a.address_id, a.streat, a.city, a.country, u.user_id, u.f_name, u.l_name
FROM address_user a
LEFT JOIN user u ON a.address_id = u.address_id;

SELECT u.user_id, u.f_name, u.l_name, p.phonenumber
FROM user u
LEFT JOIN user_phonenumber p ON u.user_id = p.user_id;

SELECT s.shipment_id, s.delivery_date, c.courier_id, c.f_name AS courier_firstname, c.l_name AS courier_lastname
FROM shipment s
LEFT JOIN courier c ON s.courier_id = c.courier_id;

SELECT w.warehouse_id, w.location, sw.shipment_id
FROM ware_house w
LEFT JOIN shipment_warehouse sw ON w.warehouse_id = sw.warehouse_id;

SELECT u.user_id, u.f_name, u.l_name, a.city, a.country
FROM user u
JOIN address_user a ON u.address_id = a.address_id;

SELECT user_id, COUNT(*) AS total_shipments
FROM shipment
GROUP BY user_id;

SELECT c.courier_id, c.f_name, c.l_name, COUNT(cw.warehouse_id) AS warehouse_count
FROM courier c
JOIN courier_warehouse cw ON c.courier_id = cw.courier_id
GROUP BY c.courier_id, c.f_name, c.l_name
HAVING COUNT(cw.warehouse_id) > 1;

SELECT s.shipment_id, s.status
FROM shipment s
WHERE s.shipment_id NOT IN (
    SELECT p.shipment_id FROM payment p
);

SELECT c.f_name, c.l_name, cp.phone_number
FROM courier c
JOIN courier_phone cp ON c.courier_id = cp.courier_id;

SELECT * FROM user WHERE user_id = 1;

-- Deletions
DELETE FROM user_phonenumber WHERE user_id = 2 AND phonenumber = '0109876543';

DELETE FROM payment WHERE user_id = 1 AND shipment_id = 1;
