CREATE DATABASE HotelDB;
USE HotelDB;
CREATE TABLE Customers(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
customer_name VARCHAR(30) NOT NULL,
customer_phno INT UNIQUE);

CREATE TABLE Membership(
membership_id INT PRIMARY KEY AUTO_INCREMENT,
membership_type VARCHAR(12) DEFAULT "NONE",
membership_status VARCHAR(10) DEFAULT "EXPIRED",
customer_id INT,
FOREIGN KEY(customer_id) REFERENCES Customers(customer_id));

INSERT INTO Customers (customer_name,customer_phno) VALUES 
("Periyar",636966030),
("Ani",735808762),
("Dube",234587669),
("Vignesh",979065980),
("Vk",77771818);

INSERT INTO Membership (customer_id) VALUES
(1),
(3);
INSERT INTO Membership (membership_type,membership_status,customer_id) VALUES
("Platinum","Active",4),
("GOLD","Active",2),
("Gold","Active",5);

#All customers detail
select customer_name,membership_type,membership_status,customer_phno as phonenumber from Customers left join Membership  ON Customers.customer_id = Membership.customer_id;

#Expierd customers detail
select customer_name,membership_type,membership_status,customer_phno as phonenumber from Customers left join Membership  ON Customers.customer_id = Membership.customer_id
where membership_status ="EXPIRED";

#Active customers detail
select customer_name,membership_type,membership_status,customer_phno as phonenumber from Customers left join Membership  ON Customers.customer_id = Membership.customer_id
where membership_status ="Active";

#Expierd membership customers phno detail
select customer_name,customer_phno as phonenumber from Customers left join Membership  ON Customers.customer_id = Membership.customer_id
where membership_status ="EXPIRED";

#Totalcustomers
select count(customer_id) as total_customers from customers;

delete 

#Emptying the tables
TRUNCATE TABLE Customers;
TRUNCATE TABLE Membership;

#Deleting the tables
DROP TABLE Customers;
DROP TABLE Membership;