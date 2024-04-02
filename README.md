select * from items;
select * from villager;
TRUNCATE TABLE villager;

-- create table villager(id INT AUTO_INCREMENT PRIMARY KEY,name varchar(100),address varchar(200),gender varchar(10), dob varchar(20),phone varchar(12),email varchar(50), land_holding varchar(10),family_id int, income double);



INSERT INTO villager (name, address, gender, dob, land_holding, family_id, income, phone, email) VALUES ('Parag Pawar', 'Pune, Maharashtra', 'male','28-03-2004','10',5,60000,'1234567543','parag.pawar@example.com');

-- drop table tax_payer;

create table tax_payer(tax_id INT AUTO_INCREMENT PRIMARY KEY, name varchar(100),water_tax boolean,property_tax boolean, house_number int);

select * from tax_payer;

INSERT INTO tax_payer (name, water_tax, property_tax, house_number)
VALUES
('Sairaj Patil', TRUE, TRUE, 1),
('Om Sagar', TRUE, TRUE, 2),
('Parag Pawar', TRUE, TRUE, 2),
('Smita Deshmukh', TRUE, TRUE, 3),
('Vikas Deshmukh', FALSE, TRUE, 3),
('Swati Mohite', TRUE, TRUE, 4),
('Sagar Mohite', TRUE, TRUE, 4),
('Priya Kulkarni', TRUE, TRUE, 5),
('Rahul Kulkarni', TRUE, TRUE, 5),
('Rajesh Pawar', TRUE, TRUE, 6),
('Sneha Pawar', TRUE, TRUE, 6),
('Ajay Shah', TRUE, TRUE, 7),
('Pooja Shah', TRUE, TRUE, 7),
('Amit Patil', TRUE, TRUE, 8),
('Pooja Patil', TRUE, TRUE, 8),
('Ashish Deshpande', FALSE, FALSE, 9),
('Neha Deshpande', TRUE, TRUE, 9),
('Siddharth Joshi', TRUE, TRUE, 10),
('Aarti Joshi', TRUE, TRUE, 10),
('Anita Mane', TRUE, TRUE, 11),
('Rohan Mane', TRUE, TRUE, 11),
('Amit Mane', TRUE, TRUE, 11),
('Priya Mane', TRUE, TRUE, 11),
('Suresh Patel', TRUE, TRUE, 12),
('Ritu Patel', TRUE, TRUE, 12),
('Karan Patel', TRUE, TRUE, 12),
('Jiya Patel', TRUE, TRUE, 12),
('Manisha Patel', TRUE, TRUE, 12),
('Rajesh Khedkar', TRUE, TRUE, 13),
('Amrita Khedkar', TRUE, TRUE, 13),
('Aditya Khedkar', TRUE, TRUE, 13),
('Sneha Khedkar', TRUE, TRUE, 13),
('Aryan Khedkar', TRUE, TRUE, 13),
('Aarohi Khedkar', TRUE, TRUE, 13),
('Avinash Joshi', TRUE, TRUE, 14),
('Neha Joshi', FALSE, TRUE, 14),
('Rohan Joshi', TRUE, TRUE, 14),
('Simran Joshi', TRUE, TRUE, 14),
('Harish Joshi', TRUE, TRUE, 14),
('Varsha Kulkarni', TRUE, TRUE, 15),
('Abhay Kulkarni', TRUE, TRUE, 15),
('Pooja Kulkarni', TRUE, FALSE, 15),
('Yash Kulkarni', TRUE, TRUE, 15),
('Arjun Kulkarni', TRUE, TRUE, 15),
('Neha Kulkarni', TRUE, TRUE, 15),
('Rajesh Sharma', FALSE, TRUE, 16),
('Priya Sharma', TRUE, TRUE, 16),
('Aryan Sharma', TRUE, TRUE, 16),
('Vinayak Desai', FALSE, TRUE, 17),
('Meera Desai', TRUE, TRUE, 17),
('Aniket Desai', FALSE, FALSE, 17),
('Riya Desai', TRUE, TRUE, 17),
('Aarav Desai', TRUE, TRUE, 17),
('Ganesh Kamble', TRUE, TRUE, 18),
('Neha Kamble', TRUE, FALSE, 18),
('Aditya Kamble', TRUE, TRUE, 18),
('Rajeshwari Gavade', TRUE, TRUE, 19),
('Nitin Gavade', TRUE, TRUE, 19),
('Amitabh Shah', TRUE, TRUE, 20),
('Neha Shah', TRUE, TRUE, 20),
('Rohit Shah', TRUE, TRUE, 20),
('Priya Shah', TRUE, TRUE, 20);




-- truncate table tax_payer;
-- create database digipanchayatiditems;
-- use digipanchayat;

-- create table events( id INT AUTO_INCREMENT PRIMARY KEY,title varchar(100),date_and_time varchar(30));

-- select * from events;

-- drop table events;
-- CREATE TABLE events (
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   name VARCHAR(255) NOT NULL,
--   description TEXT
-- );

-- CREATE TABLE items (
--   id INT AUTO_INCREMENT PRIMARY KEY,
--   name VARCHAR(255) NOT NULL,
--   description TEXT
-- );

-- drop table villager;

-- create table villager(id INT AUTO_INCREMENT PRIMARY KEY,name varchar(100),address varchar(200),gender varchar(10), dob varchar(20), land_holding varchar(10),family_id int, income double);

-- INSERT INTO villager (name, address, gender, dob, land_holding, family_id, income) VALUES ('sairaj', 'ujani', 'M', 'sgrsg', 1, 1, 1);

-- INSERT INTO villager (name, address, gender, dob, land_holding, family_id, income, phone, email) VALUES ('Om sagar', 'Ausa, Maharashtra', 'male','20-03-2004','5',4,80000,'1234567890','om.sagar@example.com');


INSERT INTO villager (name, address, gender, dob, land_holding, family_id, income, phone, email) VALUES
('Sairaj Patil', 'Ujani, Maharashtra', 'Male', '1985-05-10', '5', 1, 50000, '9876543210', 'rahul.patil@example.com'),
('Om Patil', 'Ujani, Maharashtra', 'Female', '1990-08-15', '4', 1, 45000, '8765432109', 'sneha.patil@example.com'),
('Nitin Patil', 'Pune, Maharashtra', 'Male', '1988-02-20', '6', 1, 60000, '7654321098', 'nitin.patil@example.com'),
('Pooja Patil', 'Ujani, Maharashtra', 'Female', '1982-11-12', '3', 1, 55000, '6543210987', 'pooja.patil@example.com'),
('Amol Patil', 'Ujani, Maharashtra', 'Male', '1995-06-25', '2', 1, 70000, '5432109876', 'amol.patil@example.com');



-- Family 1 (Ujani)
-- INSERT INTO villager (name, address, gender, dob, land_holding, family_id, income, phone, email)
-- VALUES
-- ('Shubham Patil', 'Ujani, Maharashtra', 'M', '1990-01-01', 2.5, 1, 30000, '9876543210', 'shubham.patil@example.com'),
-- ('Anjali Patil', 'Ujani, Maharashtra', 'F', '1992-05-15', 0, 1, 25000, '9876543211', 'anjali.patil@example.com'),
-- ('Ramesh Patil', 'Ujani, Maharashtra', 'M', '1960-08-20', 5, 1, 40000, '9876543212', 'ramesh.patil@example.com'),
-- ('Sunita Jadhav', 'Ujani, Maharashtra', 'F', '1988-07-22', 1.8, 2, 28000, '9876543215', 'sunita.jadhav@example.com'),
-- ('Sachin Jadhav', 'Ujani, Maharashtra', 'M', '1986-04-03', 3, 2, 32000, '9876543216', 'sachin.jadhav@example.com'),
-- ('Smita Deshmukh', 'Mumbai, Maharashtra', 'F', '1985-03-05', 0, 3, 35000, '9876543213', 'smita.deshmukh@example.com'),
-- ('Vikas Deshmukh', 'Mumbai, Maharashtra', 'M', '1982-10-12', 0, 3, 45000, '9876543214', 'vikas.deshmukh@example.com'),
-- ('Swati Mohite', 'Ujani, Maharashtra', 'F', '1993-09-15', 2.2, 4, 33000, '9876543219', 'swati.mohite@example.com'),
-- ('Sagar Mohite', 'Ujani, Maharashtra', 'M', '1990-06-07', 4.1, 4, 41000, '9876543220', 'sagar.mohite@example.com'),
-- ('Priya Kulkarni', 'Pune, Maharashtra', 'F', '1995-11-18', 0, 5, 22000, '9876543217', 'priya.kulkarni@example.com'),
-- ('Rahul Kulkarni', 'Pune, Maharashtra', 'M', '1993-06-09', 0, 5, 38000, '9876543218', 'rahul.kulkarni@example.com'),
-- ('Rajesh Pawar', 'Ujani, Maharashtra', 'M', '1987-04-25', 3.8, 6, 38000, '9876543221', 'rajesh.pawar@example.com'),
-- ('Sneha Pawar', 'Ujani, Maharashtra', 'F', '1990-12-12', 2.1, 6, 30000, '9876543222', 'sneha.pawar@example.com'),
-- ('Ajay Shah', 'Mumbai, Maharashtra', 'M', '1983-09-08', 0, 7, 40000, '9876543223', 'ajay.shah@example.com'),
-- ('Pooja Shah', 'Mumbai, Maharashtra', 'F', '1986-02-14', 0, 7, 32000, '9876543224', 'pooja.shah@example.com'),
-- ('Amit Patil', 'Ujani, Maharashtra', 'M', '1994-07-20', 2.6, 8, 35000, '9876543225', 'amit.patil@example.com'),
-- ('Pooja Patil', 'Ujani, Maharashtra', 'F', '1997-01-30', 1.3, 8, 28000, '9876543226', 'pooja.patil@example.com'),
-- ('Ashish Deshpande', 'Nagpur, Maharashtra', 'M', '1989-11-05', 0, 9, 45000, '9876543227', 'ashish.deshpande@example.com'),
-- ('Neha Deshpande', 'Nagpur, Maharashtra', 'F', '1992-08-18', 0, 9, 38000, '9876543228', 'neha.deshpande@example.com'),
-- ('Siddharth Joshi', 'Ujani, Maharashtra', 'M', '1991-05-10', 3.1, 10, 39000, '9876543229', 'siddharth.joshi@example.com'),
-- ('Aarti Joshi', 'Ujani, Maharashtra', 'F', '1993-10-22', 1.9, 10, 32000, '9876543230', 'aarti.joshi@example.com'),
-- ('Anita Mane', 'Ujani, Maharashtra', 'F', '1975-03-12', 4.5, 11, 42000, '9876543231', 'anita.mane@example.com'),
-- ('Rohan Mane', 'Ujani, Maharashtra', 'M', '2000-08-05', 0, 11, 0, '9876543232', 'rohan.mane@example.com'),
-- ('Amit Mane', 'Ujani, Maharashtra', 'M', '2005-11-20', 0, 11, 0, '9876543233', 'amit.mane@example.com'),
-- ('Priya Mane', 'Ujani, Maharashtra', 'F', '2010-05-03', 0, 11, 0, '9876543234', 'priya.mane@example.com'),
-- ('Suresh Patel', 'Mumbai, Maharashtra', 'M', '1980-12-18', 0, 12, 48000, '9876543235', 'suresh.patel@example.com'),
-- ('Ritu Patel', 'Mumbai, Maharashtra', 'F', '1983-06-25', 0, 12, 32000, '9876543236', 'ritu.patel@example.com'),
-- ('Karan Patel', 'Mumbai, Maharashtra', 'M', '2010-09-10', 0, 12, 0, '9876543237', 'karan.patel@example.com'),
-- ('Jiya Patel', 'Mumbai, Maharashtra', 'F', '2013-03-28', 0, 12, 0, '9876543238', 'jiya.patel@example.com'),
-- ('Manisha Patel', 'Mumbai, Maharashtra', 'F', '1950-02-10', 5, 12, 30000, '9876543239', 'manisha.patel@example.com'),
-- ('Rajesh Khedkar', 'Ujani, Maharashtra', 'M', '1970-05-20', 6, 13, 50000, '9876543240', 'rajesh.khedkar@example.com'),
-- ('Amrita Khedkar', 'Ujani, Maharashtra', 'F', '1975-09-15', 0, 13, 42000, '9876543241', 'amrita.khedkar@example.com'),
-- ('Aditya Khedkar', 'Ujani, Maharashtra', 'M', '1998-04-30', 0, 13, 0, '9876543242', 'aditya.khedkar@example.com'),
-- ('Sneha Khedkar', 'Ujani, Maharashtra', 'F', '2002-10-12', 0, 13, 0, '9876543243', 'sneha.khedkar@example.com'),
-- ('Aryan Khedkar', 'Ujani, Maharashtra', 'M', '2005-07-08', 0, 13, 0, '9876543244', 'aryan.khedkar@example.com'),
-- ('Aarohi Khedkar', 'Ujani, Maharashtra', 'F', '2010-12-25', 0, 13, 0, '9876543245', 'aarohi.khedkar@example.com'),
-- ('Avinash Joshi', 'Pune, Maharashtra', 'M', '1988-11-10', 0, 14, 55000, '9876543246', 'avinash.joshi@example.com'),
-- ('Neha Joshi', 'Pune, Maharashtra', 'F', '1990-07-28', 0, 14, 47000, '9876543247', 'neha.joshi@example.com'),
-- ('Rohan Joshi', 'Pune, Maharashtra', 'M', '2013-02-15', 0, 14, 0, '9876543248', 'rohan.joshi@example.com'),
-- ('Simran Joshi', 'Pune, Maharashtra', 'F', '2015-09-30', 0, 14, 0, '9876543249', 'simran.joshi@example.com'),
-- ('Harish Joshi', 'Pune, Maharashtra', 'M', '1945-04-12', 4, 14, 30000, '9876543250', 'harish.joshi@example.com'),
-- ('Varsha Kulkarni', 'Ujani, Maharashtra', 'F', '1978-08-05', 4.2, 15, 43000, '9876543251', 'varsha.kulkarni@example.com'),
-- ('Abhay Kulkarni', 'Ujani, Maharashtra', 'M', '1980-02-20', 0, 15, 48000, '9876543252', 'abhay.kulkarni@example.com'),
-- ('Pooja Kulkarni', 'Ujani, Maharashtra', 'F', '1999-06-10', 0, 15, 0, '9876543253', 'pooja.kulkarni@example.com'),
-- ('Yash Kulkarni', 'Ujani, Maharashtra', 'M', '2002-11-28', 0, 15, 0, '9876543254', 'yash.kulkarni@example.com'),
-- ('Arjun Kulkarni', 'Ujani, Maharashtra', 'M', '2004-07-15', 0, 15, 0, '9876543255', 'arjun.kulkarni@example.com'),
-- ('Neha Kulkarni', 'Ujani, Maharashtra', 'F', '2007-12-30', 0, 15, 0, '9876543256', 'neha.kulkarni@example.com'),
-- ('Rajesh Sharma', 'Mumbai, Maharashtra', 'M', '1972-09-18', 4, 16, 55000, '9876543257', 'rajesh.sharma@example.com'),
-- ('Priya Sharma', 'Mumbai, Maharashtra', 'F', '1975-04-25', 0, 16, 48000, '9876543258', 'priya.sharma@example.com'),
-- ('Aryan Sharma', 'Mumbai, Maharashtra', 'M', '2003-12-10', 0, 16, 0, '9876543259', 'aryan.sharma@example.com'),
-- ('Vinayak Desai', 'Ujani, Maharashtra', 'M', '1965-03-12', 5.8, 17, 60000, '9876543260', 'vinayak.desai@example.com'),
-- ('Meera Desai', 'Ujani, Maharashtra', 'F', '1970-07-08', 0, 17, 52000, '9876543261', 'meera.desai@example.com'),
-- ('Aniket Desai', 'Ujani, Maharashtra', 'M', '2000-10-15', 0, 17, 0, '9876543262', 'aniket.desai@example.com'),
-- ('Riya Desai', 'Ujani, Maharashtra', 'F', '2005-05-20', 0, 17, 0, '9876543263', 'riya.desai@example.com'),
-- ('Aarav Desai', 'Ujani, Maharashtra', 'M', '2009-08-30', 0, 17, 0, '9876543264', 'aarav.desai@example.com'),
-- ('Ganesh Kamble', 'Nagpur, Maharashtra', 'M', '1983-06-10', 0, 18, 52000, '9876543265', 'ganesh.kamble@example.com'),
-- ('Neha Kamble', 'Nagpur, Maharashtra', 'F', '1986-11-25', 0, 18, 45000, '9876543266', 'neha.kamble@example.com'),
-- ('Aditya Kamble', 'Nagpur, Maharashtra', 'M', '2011-03-12', 0, 18, 0, '9876543267', 'aditya.kamble@example.com'),
-- ('Rajeshwari Gavade', 'Ujani, Maharashtra', 'F', '1950-12-05', 7.5, 19, 30000, '9876543268', 'rajeshwari.gavade@example.com'),
-- ('Nitin Gavade', 'Ujani, Maharashtra', 'M', '1955-08-18', 0, 19, 25000, '9876543269', 'nitin.gavade@example.com'),
-- ('Amitabh Shah', 'Mumbai, Maharashtra', 'M', '1968-02-28', 6, 20, 58000, '9876543270', 'amitabh.shah@example.com'),
-- ('Neha Shah', 'Mumbai, Maharashtra', 'F', '1972-07-15', 0, 20, 50000, '9876543271', 'neha.shah@example.com'),
-- ('Rohit Shah', 'Mumbai, Maharashtra', 'M', '1999-05-10', 0, 20, 0, '9876543272', 'rohit.shah@example.com'),
-- ('Priya Shah', 'Mumbai, Maharashtra', 'F', '2003-10-22', 0, 20, 0, '9876543273', 'priya.shah@example.com');

-- Continue adding entries for remaining families as needed

-- Family 21 (Ujani)
INSERT INTO villager (name, address, gender, dob, land_holding, family_id, income, phone, email)
VALUES
('Madhuri Joshi', 'Ujani, Maharashtra', 'F', '1973-08-15', 6.3, 21, 56000, '9876543274', 'madhuri.joshi@example.com'),
('Alok Joshi', 'Ujani, Maharashtra', 'M', '1975-12-10', 0, 21, 50000, '9876543275', 'alok.joshi@example.com'),
('Ananya Joshi', 'Ujani, Maharashtra', 'F', '2002-05-25', 0, 21, 0, '9876543276', 'ananya.joshi@example.com'),
('Rajesh Singh', 'Mumbai, Maharashtra', 'M', '1980-06-28', 3.5, 22, 60000, '9876543277', 'rajesh.singh@example.com'),
('Anita Singh', 'Mumbai, Maharashtra', 'F', '1982-09-12', 0, 22, 52000, '9876543278', 'anita.singh@example.com'),
('Aarav Singh', 'Mumbai, Maharashtra', 'M', '2007-03-20', 0, 22, 0, '9876543279', 'aarav.singh@example.com'),
('Ananya Singh', 'Mumbai, Maharashtra', 'F', '2010-10-08', 0, 22, 0, '9876543280', 'ananya.singh@example.com'),
('Rahul Mane', 'Ujani, Maharashtra', 'M', '1960-03-20', 7, 23, 58000, '9876543281', 'rahul.mane@example.com'),
('Pooja Mane', 'Ujani, Maharashtra', 'F', '1965-11-08', 0, 23, 49000, '9876543282', 'pooja.mane@example.com'),
('Rohan Mane', 'Ujani, Maharashtra', 'M', '1990-09-15', 0, 23, 0, '9876543283', 'rohan.mane@example.com'),
('Sneha Mane', 'Ujani, Maharashtra', 'F', '1995-04-25', 0, 23, 0, '9876543284', 'sneha.mane@example.com'),
('Aryan Mane', 'Ujani, Maharashtra', 'M', '1998-12-10', 0, 23, 0, '9876543285', 'aryan.mane@example.com'),
('Amit Dixit', 'Nagpur, Maharashtra', 'M', '1985-02-10', 0, 24, 62000, '9876543286', 'amit.dixit@example.com'),
('Nisha Dixit', 'Nagpur, Maharashtra', 'F', '1988-07-28', 0, 24, 54000, '9876543287', 'nisha.dixit@example.com'),
('Aarav Dixit', 'Nagpur, Maharashtra', 'M', '2010-05-15', 0, 24, 0, '9876543288', 'aarav.dixit@example.com'),
('Aanya Dixit', 'Nagpur, Maharashtra', 'F', '2013-11-22', 0, 24, 0, '9876543289', 'aanya.dixit@example.com'),
('Sachin Gavade', 'Ujani, Maharashtra', 'M', '1978-10-12', 5.2, 25, 57000, '9876543290', 'sachin.gavade@example.com'),
('Pooja Gavade', 'Ujani, Maharashtra', 'F', '1980-12-28', 0, 25, 49000, '9876543291', 'pooja.gavade@example.com'),
('Aniket Gavade', 'Ujani, Maharashtra', 'M', '2002-03-15', 0, 25, 0, '9876543292', 'aniket.gavade@example.com'),
('Riya Gavade', 'Ujani, Maharashtra', 'F', '2005-08-20', 0, 25, 0, '9876543293', 'riya.gavade@example.com'),
('Rakesh Gupta', 'Mumbai, Maharashtra', 'M', '1976-04-08', 3.8, 26, 58000, '9876543294', 'rakesh.gupta@example.com'),
('Neha Gupta', 'Mumbai, Maharashtra', 'F', '1978-09-22', 0, 26, 50000, '9876543295', 'neha.gupta@example.com'),
('Aarav Gupta', 'Mumbai, Maharashtra', 'M', '2004-01-15', 0, 26, 0, '9876543296', 'aarav.gupta@example.com'),
('Ananya Gupta', 'Mumbai, Maharashtra', 'F', '2007-06-30', 0, 26, 0, '9876543297', 'ananya.gupta@example.com'),
('Rajendra Patil', 'Ujani, Maharashtra', 'M', '1972-12-10', 6.5, 27, 60000, '9876543298', 'rajendra.patil@example.com'),
('Sangeeta Patil', 'Ujani, Maharashtra', 'F', '1976-07-25', 0, 27, 52000, '9876543299', 'sangeeta.patil@example.com'),
('Siddharth Patil', 'Ujani, Maharashtra', 'M', '1998-05-18', 0, 27, 0, '9876543300', 'siddharth.patil@example.com'),
('Shreya Patil', 'Ujani, Maharashtra', 'F', '2002-10-05', 0, 27, 0, '9876543301', 'shreya.patil@example.com'),
('Aryan Patil', 'Ujani, Maharashtra', 'M', '2006-03-20', 0, 27, 0, '9876543302', 'aryan.patil@example.com'),
('Suresh Sharma', 'Nagpur, Maharashtra', 'M', '1982-08-05', 0, 28, 62000, '9876543303', 'suresh.sharma@example.com'),
('Nisha Sharma', 'Nagpur, Maharashtra', 'F', '1985-11-18', 0, 28, 54000, '9876543304', 'nisha.sharma@example.com'),
('Arnav Sharma', 'Nagpur, Maharashtra', 'M', '2010-07-10', 0, 28, 0, '9876543305', 'arnav.sharma@example.com'),
('Anika Sharma', 'Nagpur, Maharashtra', 'F', '2013-12-25', 0, 28, 0, '9876543306', 'anika.sharma@example.com'),
('Narendra Gaikwad', 'Ujani, Maharashtra', 'M', '1976-03-15', 5.0, 29, 57000, '9876543307', 'narendra.gaikwad@example.com'),
('Sunita Gaikwad', 'Ujani, Maharashtra', 'F', '1978-10-28', 0, 29, 49000, '9876543308', 'sunita.gaikwad@example.com'),
('Akshay Gaikwad', 'Ujani, Maharashtra', 'M', '2000-05-10', 0, 29, 0, '9876543309', 'akshay.gaikwad@example.com'),
('Sandeep Shah', 'Mumbai, Maharashtra', 'M', '1979-09-20', 4.2, 30, 59000, '9876543310', 'sandeep.shah@example.com'),
('Pooja Shah', 'Mumbai, Maharashtra', 'F', '1982-02-08', 0, 30, 51000, '9876543311', 'pooja.shah@example.com'),
('Arjun Shah', 'Mumbai, Maharashtra', 'M', '2005-07-15', 0, 30, 0, '9876543312', 'arjun.shah@example.com'),
('Aarohi Shah', 'Mumbai, Maharashtra', 'F', '2008-12-30', 0, 30, 0, '9876543313', 'aarohi.shah@example.com'),
('Rajeshwari Patil', 'Ujani, Maharashtra', 'F', '1974-06-12', 6.8, 31, 58000, '9876543314', 'rajeshwari.patil@example.com'),
('Rohit Patil', 'Ujani, Maharashtra', 'M', '1978-11-25', 0, 31, 52000, '9876543315', 'rohit.patil@example.com'),
('Neha Patil', 'Ujani, Maharashtra', 'F', '2000-08-18', 0, 31, 0, '9876543316', 'neha.patil@example.com'),
('Aryan Patil', 'Ujani, Maharashtra', 'M', '2004-01-30', 0, 31, 0, '9876543317', 'aryan.patil@example.com'),
('Ananya Patil', 'Ujani, Maharashtra', 'F', '2008-05-15', 0, 31, 0, '9876543318', 'ananya.patil@example.com'),
('Sachin Shah', 'Mumbai, Maharashtra', 'M', '1983-03-08', 4.5, 32, 60000, '9876543319', 'sachin.shah@example.com'),
('Neha Shah', 'Mumbai, Maharashtra', 'F', '1987-08-22', 0, 32, 52000, '9876543320', 'neha.shah@example.com'),
('Aarav Shah', 'Mumbai, Maharashtra', 'M', '2009-05-15', 0, 32, 0, '9876543321', 'aarav.shah@example.com'),
('Anika Shah', 'Mumbai, Maharashtra', 'F', '2013-10-30', 0, 32, 0, '9876543322', 'anika.shah@example.com'),
('Sanjay Mane', 'Ujani, Maharashtra', 'M', '1970-12-20', 7.2, 33, 60000, '9876543323', 'sanjay.mane@example.com'),
('Savita Mane', 'Ujani, Maharashtra', 'F', '1975-03-05', 0, 33, 53000, '9876543324', 'savita.mane@example.com'),
('Siddharth Mane', 'Ujani, Maharashtra', 'M', '1995-08-18', 0, 33, 0, '9876543325', 'siddharth.mane@example.com'),
('Shreya Mane', 'Ujani, Maharashtra', 'F', '1998-11-30', 0, 33, 0, '9876543326', 'shreya.mane@example.com'),
('Aarav Mane', 'Ujani, Maharashtra', 'M', '2001-04-15', 0, 33, 0, '9876543327', 'aarav.mane@example.com'),
('Prakash Sharma', 'Nagpur, Maharashtra', 'M', '1980-09-10', 0, 34, 63000, '9876543328', 'prakash.sharma@example.com'),
('Neha Sharma', 'Nagpur, Maharashtra', 'F', '1983-04-28', 0, 34, 55000, '9876543329', 'neha.sharma@example.com'),
('Aryan Sharma', 'Nagpur, Maharashtra', 'M', '2006-07-15', 0, 34, 0, '9876543330', 'aryan.sharma@example.com'),
('Ananya Sharma', 'Nagpur, Maharashtra', 'F', '2010-12-25', 0, 34, 0, '9876543331', 'ananya.sharma@example.com'),
('Ramesh Pawar', 'Ujani, Maharashtra', 'M', '1975-02-15', 5.5, 35, 59000, '9876543332', 'ramesh.pawar@example.com'),
('Sangeeta Pawar', 'Ujani, Maharashtra', 'F', '1978-07-28', 0, 35, 51000, '9876543333', 'sangeeta.pawar@example.com'),
('Akshay Pawar', 'Ujani, Maharashtra', 'M', '2003-05-10', 0, 35, 0, '9876543334', 'akshay.pawar@example.com'),
('Rajesh Kumar', 'Mumbai, Maharashtra', 'M', '1982-11-20', 4.8, 36, 61000, '9876543335', 'rajesh.kumar@example.com'),
('Neha Kumar', 'Mumbai, Maharashtra', 'F', '1986-04-08', 0, 36, 53000, '9876543336', 'neha.kumar@example.com'),
('Aarav Kumar', 'Mumbai, Maharashtra', 'M', '2008-09-15', 0, 36, 0, '9876543337', 'aarav.kumar@example.com'),
('Anika Kumar', 'Mumbai, Maharashtra', 'F', '2012-02-28', 0, 36, 0, '9876543338', 'anika.kumar@example.com'),
('Vinod More', 'Ujani, Maharashtra', 'M', '1976-08-12', 4.2, 37, 57000, '9876543339', 'vinod.more@example.com'),
('Neha More', 'Ujani, Maharashtra', 'F', '1979-01-25', 0, 37, 49000, '9876543340', 'neha.more@example.com'),
('Aryan More', 'Ujani, Maharashtra', 'M', '2001-06-18', 0, 37, 0, '9876543341', 'aryan.more@example.com'),
('Anaya More', 'Ujani, Maharashtra', 'F', '2004-11-30', 0, 37, 0, '9876543342', 'anaya.more@example.com'),
('Sanjay Desai', 'Nagpur, Maharashtra', 'M', '1978-05-10', 0, 38, 64000, '9876543343', 'sanjay.desai@example.com'),
('Nisha Desai', 'Nagpur, Maharashtra', 'F', '1982-10-28', 0, 38, 56000, '9876543344', 'nisha.desai@example.com'),
('Arnav Desai', 'Nagpur, Maharashtra', 'M', '2005-03-15', 0, 38, 0, '9876543345', 'arnav.desai@example.com'),
('Anika Desai', 'Nagpur, Maharashtra', 'F', '2008-08-30', 0, 38, 0, '9876543346', 'anika.desai@example.com'),
('Ravi Joshi', 'Ujani, Maharashtra', 'M', '1973-12-15', 5.8, 39, 58000, '9876543347', 'ravi.joshi@example.com'),
('Smita Joshi', 'Ujani, Maharashtra', 'F', '1976-07-28', 0, 39, 50000, '9876543348', 'smita.joshi@example.com'),
('Akash Joshi', 'Ujani, Maharashtra', 'M', '2001-05-10', 0, 39, 0, '9876543349', 'akash.joshi@example.com'),
('Rahul Patel', 'Mumbai, Maharashtra', 'M', '1985-10-20', 4.5, 40, 62000, '9876543350', 'rahul.patel@example.com'),
('Neha Patel', 'Mumbai, Maharashtra', 'F', '1988-03-08', 0, 40, 54000, '9876543351', 'neha.patel@example.com'),
('Arjun Patel', 'Mumbai, Maharashtra', 'M', '2011-08-15', 0, 40, 0, '9876543352', 'arjun.patel@example.com'),
('Ananya Patel', 'Mumbai, Maharashtra', 'F', '2014-01-28', 0, 40, 0, '9876543353', 'ananya.patel@example.com'),
('Vijay Pawar', 'Ujani, Maharashtra', 'M', '1979-04-12', 5.2, 41, 59000, '9876543354', 'vijay.pawar@example.com'),
('Neha Pawar', 'Ujani, Maharashtra', 'F', '1982-09-25', 0, 41, 51000, '9876543355', 'neha.pawar@example.com'),
('Aarav Pawar', 'Ujani, Maharashtra', 'M', '2003-07-10', 0, 41, 0, '9876543356', 'aarav.pawar@example.com'),
('Rajesh Gupta', 'Mumbai, Maharashtra', 'M', '1984-11-18', 4.8, 42, 63000, '9876543357', 'rajesh.gupta@example.com'),
('Neha Gupta', 'Mumbai, Maharashtra', 'F', '1987-04-02', 0, 42, 55000, '9876543358', 'neha.gupta@example.com'),
('Aarav Gupta', 'Mumbai, Maharashtra', 'M', '2010-08-15', 0, 42, 0, '9876543359', 'aarav.gupta@example.com'),
('Ananya Gupta', 'Mumbai, Maharashtra', 'F', '2013-01-28', 0, 42, 0, '9876543360', 'ananya.gupta@example.com'),
('Anil Deshmukh', 'Ujani, Maharashtra', 'M', '1972-06-15', 6.5, 43, 60000, '9876543361', 'anil.deshmukh@example.com'),
('Neha Deshmukh', 'Ujani, Maharashtra', 'F', '1975-11-28', 0, 43, 52000, '9876543362', 'neha.deshmukh@example.com'),
('Akshay Deshmukh', 'Ujani, Maharashtra', 'M', '1995-08-10', 0, 43, 0, '9876543363', 'akshay.deshmukh@example.com'),
('Shreya Deshmukh', 'Ujani, Maharashtra', 'F', '1999-01-25', 0, 43, 0, '9876543364', 'shreya.deshmukh@example.com'),
('Aryan Deshmukh', 'Ujani, Maharashtra', 'M', '2003-04-08', 0, 43, 0, '9876543365', 'aryan.deshmukh@example.com'),
('Rajendra Thakur', 'Nagpur, Maharashtra', 'M', '1976-05-20', 0, 44, 64000, '9876543366', 'rajendra.thakur@example.com'),
('Neha Thakur', 'Nagpur, Maharashtra', 'F', '1979-10-08', 0, 44, 56000, '9876543367', 'neha.thakur@example.com'),
('Aryan Thakur', 'Nagpur, Maharashtra', 'M', '2003-03-15', 0, 44, 0, '9876543368', 'aryan.thakur@example.com'),
('Ananya Thakur', 'Nagpur, Maharashtra', 'F', '2006-08-30', 0, 44, 0, '9876543369', 'ananya.thakur@example.com'),
('Sanjay Pawar', 'Ujani, Maharashtra', 'M', '1978-02-12', 5.0, 45, 57000, '9876543370', 'sanjay.pawar@example.com'),
('Neha Pawar', 'Ujani, Maharashtra', 'F', '1981-07-25', 0, 45, 49000, '9876543371', 'neha.pawar@example.com'),
('Aarav Pawar', 'Ujani, Maharashtra', 'M', '2001-04-10', 0, 45, 0, '9876543372', 'aarav.pawar@example.com'),
('Anaya Pawar', 'Ujani, Maharashtra', 'F', '2004-09-30', 0, 45, 0, '9876543373', 'anaya.pawar@example.com'),
('Rahul Shah', 'Mumbai, Maharashtra', 'M', '1981-07-20', 4.2, 46, 61000, '9876543374', 'rahul.shah@example.com'),
('Nisha Shah', 'Mumbai, Maharashtra', 'F', '1984-12-08', 0, 46, 53000, '9876543375', 'nisha.shah@example.com'),
('Arjun Shah', 'Mumbai, Maharashtra', 'M', '2007-05-15', 0, 46, 0, '9876543376', 'arjun.shah@example.com'),
('Ananya Shah', 'Mumbai, Maharashtra', 'F', '2010-10-30', 0, 46, 0, '9876543377', 'ananya.shah@example.com'),
('Ravi Patil', 'Ujani, Maharashtra', 'M', '1975-06-15', 5.5, 47, 58000, '9876543378', 'ravi.patil@example.com'),
('Smita Patil', 'Ujani, Maharashtra', 'F', '1978-11-28', 0, 47, 50000, '9876543379', 'smita.patil@example.com'),
('Akash Patil', 'Ujani, Maharashtra', 'M', '2000-08-10', 0, 47, 0, '9876543380', 'akash.patil@example.com'),
('Sanjay Joshi', 'Nagpur, Maharashtra', 'M', '1980-11-10', 0, 48, 65000, '9876543381', 'sanjay.joshi@example.com'),
('Nisha Joshi', 'Nagpur, Maharashtra', 'F', '1983-04-28', 0, 48, 57000, '9876543382', 'nisha.joshi@example.com'),
('Aryan Joshi', 'Nagpur, Maharashtra', 'M', '2005-07-15', 0, 48, 0, '9876543383', 'aryan.joshi@example.com'),
('Ananya Joshi', 'Nagpur, Maharashtra', 'F', '2008-12-30', 0, 48, 0, '9876543384', 'ananya.joshi@example.com'),
('Rajesh More', 'Ujani, Maharashtra', 'M', '1973-05-15', 6.0, 49, 59000, '9876543385', 'rajesh.more@example.com'),
('Sneha More', 'Ujani, Maharashtra', 'F', '1976-10-28', 0, 49, 51000, '9876543386', 'sneha.more@example.com'),
('Akshay More', 'Ujani, Maharashtra', 'M', '1996-07-10', 0, 49, 0, '9876543387', 'akshay.more@example.com'),
('Shreya More', 'Ujani, Maharashtra', 'F', '1999-12-25', 0, 49, 0, '9876543388', 'shreya.more@example.com'),
('Aryan More', 'Ujani, Maharashtra', 'M', '2003-03-08', 0, 49, 0, '9876543389', 'aryan.more@example.com'),
('Rahul Kumar', 'Mumbai, Maharashtra', 'M', '1982-08-20', 4.5, 50, 62000, '9876543390', 'rahul.kumar@example.com'),
('Neha Kumar', 'Mumbai, Maharashtra', 'F', '1985-01-08', 0, 50, 54000, '9876543391', 'neha.kumar@example.com'),
('Arjun Kumar', 'Mumbai, Maharashtra', 'M', '2007-06-15', 0, 50, 0, '9876543392', 'arjun.kumar@example.com'),
('Ananya Kumar', 'Mumbai, Maharashtra', 'F', '2010-11-30', 0, 50, 0, '9876543393', 'ananya.kumar@example.com');

