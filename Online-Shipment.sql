create database OnlineShipment ;
use OnlineShipment ;
-- CREATE TABLE address_user(
-- address_id int primary key,
-- streat varchar(50),
-- city varchar(50),
-- country varchar(50)
-- );

-- alter table address_user
-- add column user_id int;

-- alter table address_user
-- add constraint fk_user_id foreign key(user_id) references user(user_id);

-- CREATE TABLE user(
-- user_id int primary key,
-- f_name varchar(50),
-- l_name varchar(50),
-- email varchar(50),
-- role_name varchar(50),
-- address_id int,
-- foreign key (address_id) references address_user(address_id)
-- );

-- CREATE TABLE user_pass(
-- user_id int,
-- password varchar(50),
-- primary key(user_id,password),
-- foreign key (user_id)references user(user_id)
-- );

-- CREATE TABLE user_phonenumber(
-- user_id int,
-- phonenumber varchar(50),
-- primary key(user_id,phonenumber),
-- foreign key (user_id)references user(user_id)
-- );

-- CREATE TABLE tracking(
-- tracking_id int primary key,
-- location varchar(50),
-- time varchar(50),
-- status_name varchar(50)
-- );


-- CREATE TABLE courier(
-- courier_id int primary key,
-- tracking_id int,
-- f_name varchar(50),
-- l_name varchar(50),
-- email varchar(50),
-- foreign key (tracking_id) references tracking(tracking_id)
-- );


-- create table shipment(
-- shipment_id int primary key,
-- courier_id int,
-- user_id int,
-- cost int,
-- sender int,
-- delivery_date varchar(50),
-- reciever varchar(50),
-- status varchar(50),
-- standard varchar(50),
-- express varchar(50),
-- weight int,
-- foreign key (courier_id) references courier(courier_id),
-- foreign key (user_id) references user(user_id)
-- );

-- CREATE TABLE payment(
-- user_id int,
-- payment_id int,
-- shipment_id int,
-- status varchar(50),
-- method varchar(50),
-- amount int,
-- primary key(user_id,payment_id),
-- foreign key (user_id) references user(user_id),
-- foreign key (shipment_id) references shipment(shipment_id)
-- );

-- CREATE TABLE user_tracking(
-- tracking_id int,
-- user_id int,
-- primary key (tracking_id,user_id),
-- foreign key (tracking_id) references tracking(tracking_id),
-- foreign key (user_id) references user(user_id)
-- );

-- CREATE TABLE courier_phone(
-- courier_id int,
-- phone_number int,
-- primary key(courier_id,phone_number),
-- foreign key(courier_id)references courier(courier_id)
-- );

-- alter table courier_phone
-- modify phone_number varchar(50);

-- CREATE TABLE tracking_shipment(
-- tracking_id int,
-- shipment_id int,
-- primary key (tracking_id,shipment_id),
-- foreign key(tracking_id) references tracking(tracking_id),
-- foreign key(shipment_id) references shipment(shipment_id)
-- );

-- CREATE TABLE ware_house(
-- warehouse_id int primary key,
-- location varchar(50),
-- capacity varchar(50)
-- );

-- CREATE TABLE courier_warehouse(
-- courier_id int ,
-- warehouse_id int,
-- primary key(courier_id,warehouse_id),
-- foreign key(courier_id) references courier(courier_id),
-- foreign key(warehouse_id) references ware_house(warehouse_id)
-- );

-- CREATE TABLE shipment_warehouse(
-- shipment_id int ,
-- warehouse_id int,
-- primary key(shipment_id,warehouse_id),
-- foreign key(shipment_id) references shipment(shipment_id),
-- foreign key(warehouse_id) references ware_house(warehouse_id)
-- );
INSERT INTO address_user (address_id, streat, city, country, user_id) VALUES
(1, 'شارع الملك فيصل', 'الرياض', 'السعودية', 1),
(2, 'شارع التحرير', 'القاهرة', 'مصر', 2);

INSERT INTO user (user_id, f_name, l_name, email, role_name, address_id) VALUES
(1, 'محمد', 'العتيبي', 'mohammed@email.com', 'عميل', 1),
(2, 'سارة', 'محمد', 'sara@email.com', 'مسؤول', 2);

INSERT INTO user_pass (user_id, password) VALUES (1, 'كلمةالسر123'), (2, 'سري456');


INSERT INTO user_phonenumber (user_id, phonenumber) VALUES (1, '0501234567'), (2, '0109876543');


INSERT INTO tracking (tracking_id, location, time, status_name) VALUES
(1, 'الرياض', '10:00 صباحًا', 'تم الشحن'),
(2, 'جدة', '4:00 مساءً', 'قيد النقل');


INSERT INTO courier (courier_id, tracking_id, f_name, l_name, email) VALUES
(101, 1, 'علي', 'خالد', 'ali@courier.com');


INSERT INTO courier_phone (courier_id, phone_number) VALUES (101, '0566667777');


INSERT INTO shipment (shipment_id, courier_id, user_id, cost, sender, delivery_date, reciever, status, standard, express, weight)
VALUES (555, 101, 1, 150, 1, '2025-05-18', 'سارة محمد', 'جاري التوصيل', 'نعم', 'لا', 12);


INSERT INTO payment (user_id, payment_id, shipment_id, status, method, amount)
VALUES (1, 1, 555, 'تم الدفع', 'بطاقة ائتمان', 150);


INSERT INTO user_tracking (tracking_id, user_id) VALUES (1, 1);


INSERT INTO tracking_shipment (tracking_id, shipment_id) VALUES (1, 555);


INSERT INTO ware_house (warehouse_id, location, capacity) VALUES
(1, 'مستودع الرياض', '1000'),
(2, 'مستودع القاهرة', '500');


INSERT INTO courier_warehouse (courier_id, warehouse_id) VALUES
(101, 1);


INSERT INTO shipment_warehouse (shipment_id, warehouse_id) VALUES
(555, 1);


UPDATE user SET email = 'mohammed.new@email.com' WHERE user_id = 1;


UPDATE shipment SET status = 'تم التوصيل', delivery_date = '2025-05-17' WHERE shipment_id = 555;



DELETE FROM user_phonenumber WHERE user_id = 2 AND phonenumber = '0109876543';


DELETE FROM payment WHERE user_id = 1 AND payment_id = 1;

SELECT 
    u.user_id,
    u.f_name,
    u.l_name,
    s.shipment_id,
    s.status
FROM
    user u
LEFT JOIN
    shipment s ON u.user_id = s.user_id;

SELECT
    c.courier_id,
    c.f_name,
    c.l_name,
    w.warehouse_id,
    w.location
FROM
    courier c
LEFT JOIN
    courier_warehouse cw ON c.courier_id = cw.courier_id
LEFT JOIN
    ware_house w ON cw.warehouse_id = w.warehouse_id;

SELECT 
    s.shipment_id,
    s.status,
    p.payment_id,
    p.status as payment_status,
    p.amount
FROM
    shipment s
LEFT JOIN
    payment p ON s.shipment_id = p.shipment_id;

SELECT 
    a.address_id,
    a.streat,
    a.city,
    a.country,
    u.user_id,
    u.f_name,
    u.l_name
FROM
    address_user a
LEFT JOIN
    user u ON a.address_id = u.address_id;

SELECT 
    u.user_id,
    u.f_name,
    u.l_name,
    p.phonenumber
FROM
    user u
LEFT JOIN
    user_phonenumber p ON u.user_id = p.user_id;

SELECT
    s.shipment_id,
    s.delivery_date,
    c.courier_id,
    c.f_name as courier_firstname,
    c.l_name as courier_lastname
FROM 
    shipment s
LEFT JOIN
    courier c ON s.courier_id = c.courier_id;


SELECT
    w.warehouse_id,
    w.location,
    sw.shipment_id
FROM 
    ware_house w
LEFT JOIN
    shipment_warehouse sw ON w.warehouse_id = sw.warehouse_id;


SELECT u.user_id, u.f_name, u.l_name, a.city, a.country
FROM user u
JOIN address_user a ON u.address_id = a.address_id;

SELECT s.shipment_id, c.f_name AS courier_name, s.reciever, s.status
FROM shipment s
JOIN courier c ON s.courier_id = c.courier_id;


SELECT user_id, COUNT(*) AS total_shipments
FROM shipment
GROUP BY user_id;

SELECT c.courier_id, c.f_name, c.l_name, COUNT(cw.warehouse_id) AS warehouse_count
FROM courier c
JOIN courier_warehouse cw ON c.courier_id = cw.courier_id
GROUP BY c.courier_id, c.f_name, c.l_name
HAVING COUNT(cw.warehouse_id) > 1;

SELECT u.user_id, u.f_name, s.status, s.delivery_date
FROM user u
JOIN shipment s ON u.user_id = s.user_id
WHERE s.delivery_date = (
  SELECT MAX(s2.delivery_date)
  FROM shipment s2
  WHERE s2.user_id = u.user_id
);


SELECT s.shipment_id, s.status
FROM shipment s
WHERE s.shipment_id NOT IN (
  SELECT p.shipment_id FROM payment p
);


SELECT c.f_name, c.l_name, cp.phone_number
FROM courier c
JOIN courier_phone cp ON c.courier_id = cp.courier_id;


SELECT shipment_id FROM shipment WHERE user_id NOT IN (SELECT user_id FROM user);


SELECT * FROM user WHERE user_id = 1;



-- DELETE FROM shipment_warehouse WHERE shipment_id = 555;
-- DELETE FROM courier_warehouse WHERE courier_id = 101;
-- DELETE FROM ware_house WHERE warehouse_id IN (1,2);
-- DELETE FROM tracking_shipment WHERE shipment_id = 555;
-- DELETE FROM courier_phone WHERE courier_id = 101;
-- DELETE FROM courier WHERE courier_id = 101;
-- DELETE FROM tracking WHERE tracking_id IN (1,2);
-- DELETE FROM shipment WHERE shipment_id = 555;
-- DELETE FROM payment WHERE user_id = 1;
-- DELETE FROM user_tracking WHERE user_id = 1;
-- DELETE FROM user_pass WHERE user_id IN (1,2);
-- DELETE FROM user_phonenumber WHERE user_id IN (1,2);
-- DELETE FROM user WHERE user_id IN (1,2);
-- DELETE FROM address_user WHERE address_id IN (1,2);
