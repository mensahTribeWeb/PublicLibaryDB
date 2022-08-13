--Create a dataBase

CREATE DATABASE PUBLICLIBARYDB;

--CREATE TABLES
 --CREATE Author TABLE

CREATE TABLE AUTHOR (AUTHORID SERIAL PRIMARY KEY,
AUTHORFIRSTNAME VARCHAR(30),
AUTHORLASTNAME VARCHAR(30),
AUTHORNATIONALITY VARCHAR(50));
-- INDEX(authorid, authorfirstname, authorlastname, authornationality);

--CREATE Book TABLE

CREATE TABLE BOOK (BOOKID SERIAL PRIMARY KEY,
BOOKTITLE VARCHAR(50),
BOOKAUTHOR INTEGER, GENRE VARCHAR(30),
FOREIGN KEY(BOOKAUTHOR) REFERENCES AUTHOR(AUTHORID));
-- INDEX(bookid,booktitle,bookauthor,genre);

--CREATE Client TABLE

CREATE TABLE CLIENT (CLIENTID SERIAL PRIMARY KEY,
CLIENTFIRSTNAME VARCHAR(30),
CLIENTLASTNAME VARCHAR(30),
CLIENTDOB INTEGER, 
OCCUPATION VARCHAR(50));
-- INDEX(clientid, clientfirstname, clientlastname, occupation, clientdob);



ALTER TABLE client 
ALTER COLUMN clientDOB  
TYPE year;



--CREATE Borrower TABLE

CREATE TABLE BORROWER 
(BORROWID SERIAL PRIMARY KEY,CLIENTID INTEGER, BOOKID INTEGER, BORROWDATE Date,
FOREIGN KEY(CLIENTID) REFERENCES CLIENT(CLIENTID),
FOREIGN KEY(BOOKID) REFERENCES BOOK(BOOKID));
-- INDEX(borrowid, clientid, bookid, borrowdate);

--populate TABLE's
 --populate Author TABLE
 
INSERT INTO AUTHOR (AUTHORID, AUTHORFIRSTNAME, AUTHORLASTNAME, AUTHORNATIONALITY) 
VALUES(1,'Sofia','Smith','Canada'), 
						(2, 'Maria','Brown','Brazil'), 
						(3, 'Elena','Martin','Mexico'), 
						(4, 'Zoe', 'Roy','France'), 
						(5, 'Sebastian','Lavoie','Canada'), 
						(6, 'Dylan', 'Garcia', 'Spain'), 
						(7, 'Ian', 'Cruz', 'Mexico'), 
						(8, 'Lucas', 'Smith', 'USA'), 
						(9, 'Fabian', 'Wilson', 'USA'), 
						(10, 'Liam', 'Taylor', 'Canada'), 
						(11, 'William', 'Thomas', 'Great Britain'), 
						(12, 'Logan', 'Moore', 'Canada'), 
						(13, 'Oliver', 'Martin', 'France'), 
						(14, 'Alysha', 'Thompson', 'Canada'), 
						(15, 'Isabelle', 'Lee', 'Canada'), 
						(16, 'Emily', 'Clark', 'USA'), 
						(17, 'John', 'Young', 'China'), 
						(18, 'David', 'Wright', 'Canada'), 
						(19, 'Thomas', 'Scott', 'Canada'), 
						(20, 'Helena', 'Adams', 'Canada'), 
						(21, 'Sofia', 'Carter', 'USA'), 
						(22, 'Liam', 'Parker', 'Canada'), 
						(23, 'Emily', 'Murphy', 'USA');

-- QUERY Author TABLE

SELECT *
FROM AUTHOR
ORDER BY AUTHOR;

-- populate Book table:

INSERT INTO BOOK (BOOKID, BOOKTITLE, BOOKAUTHOR,GENRE)
VALUES(1, 'Build your database system', 1, 'Science'),
						(2, 'The red wall', 2, 'Fiction'),
						(3, 'The perfect match', 3, 'Fiction'),
						(4, 'Digital Logic', 4, 'Science'),
						(5, 'How to be a great lawyer', 5, 'Law'),
						(6, 'Manage successful negotiations', 6, 'Society'),
						(7, 'Pollution today', 7, 'Science'),
						(8, 'A gray park', 2, 'Fiction'),
						(9, 'How to be rich in one year', 8, 'Humor'),
						(10, 'Their bright fate', 9, 'Fiction'),
						(11, 'Black lines', 10, 'Fiction'),
						(12, 'History of theater', 11, 'Literature'),
						(13, 'Electrical transformers', 12, 'Science'),
						(14, 'Build your big data system', 1, 'Science'),
						(15, 'Right and left', 13, 'Children'),
						(16, 'Programming using Python', 1, 'Science'),
						(17, 'Computer networks', 14, 'Science'),
						(18, 'Performance evaluation', 15, 'Science'),
						(19, 'Daily exercise', 16, 'Well being'),
						(20, 'The silver uniform', 17, 'Fiction'),
						(21, 'Industrial revolution', 18, 'History'),
						(22, 'Green nature', 19, 'Well being'),
						(23, 'Perfect football', 20, 'Well being'),
						(24, 'The chocolate love', 21, 'Humor'),
						(25, 'Director and leader', 22, 'Society'),
						(26, 'Play football every week', 20, 'well being'),
						(27, 'Maya the bee', 13, 'Children'),
						(28, 'Perfect rugby', 20, 'Well being'),
						(29, 'The end', 23, 'Fiction'),
						(30, 'Computer security', 1, 'Science'),
						(31, 'Participate', 22, 'Society'),
						(32, 'Positive figures', 3, 'Fiction');


SELECT *
FROM BOOK
ORDER BY BOOKID;

-- Populate Client table:

INSERT INTO CLIENT(CLIENTID, CLIENTFIRSTNAME, CLIENTLASTNAME, OCCUPATION, CLIENTDOB)
VALUES(1, 'Kaiden', 'Hill', 'Student', 2006),
						(2, 'Alina', 'Morton','Student', 2010),
						(3, 'Fania', 'Brooks', 'Food Scientist', 1983),
						(4, 'Courtney', 'Jensen', 'Student', 2006),
						(5, 'Brittany', 'Hill', 'Firefighter', 1983),
						(6, 'Max', 'Rogers', 'Student', 2005),
						(7, 'Margaret', 'McCarthy', 'School Psychologist', 1981),
						(8, 'Julie', 'McCarthy', 'Professor', 1973),
						(9, 'Ken', 'McCarthy', 'Securities Clerk', 1974),
						(10, 'Britany', 'O Quinn', 'Violinist', 1984),
						(11, 'Conner', 'Gardner', 'Licensed Massage Therapist', 1998),
						(12, 'Mya', 'Austin', 'Parquet Floor Layer', 1960),
						(13, 'Thierry', 'Rogers', 'Student', 2004),
						(14, 'Eloise', 'Rogers', 'Computer Security Manager', 1984),
						(15, 'Gerard', 'Jackson', 'Oil Exploration Engineer', 1979),
						(16, 'Randy', 'Day', 'Aircraft Electrician', 1986),
						(17, 'Jodie', 'Page', 'Manufacturing Director', 1990),
						(18, 'Coral', 'Rice', 'Window Washer', 1996),
						(19, 'Ayman', 'Austin', 'Student', 2002),
						(20, 'Jaxson', 'Austin', 'Repair Worker', 1999),
						(21, 'Joel', 'Austin', 'Police Officer', 1973),
						(22, 'Alina', 'Austin', 'Student', 2010),
						(23, 'Elin', 'Austin', 'Payroll Clerk', 1962),
						(24, 'Ophelia', 'Wolf', 'Student', 2004),
						(25, 'Eliot', 'McGuire', 'Dentist', 1967),
						(26, 'Peter', 'McKinney', 'Professor', 1968),
						(27, 'Annabella','Henry', 'Nurse', 1974),
						(28, 'Anastasia', 'Baker', 'Student', 2001),
						(29, 'Tyler', 'Baker', 'Police Officer', 1984),
						(30, 'Lilian', 'Ross', 'Insurance Agent', 1983),
						(31, 'Thierry', 'Arnold', 'Bus Driver', 1975),
						(32, 'Angelina', 'Rowe', 'Firefighter', 1979),
						(33, 'Marcia', 'Rowe', 'Health Educator', 1974),
						(34, 'Martin', 'Rowe', 'Ship Engineer', 1976),
						(35, 'Adeline', 'Rowe', 'Student', 2005),
						(36, 'Colette', 'Rowe', 'Professor', 1963),
						(37, 'Diane', 'Clark', 'Payroll Clerk', 1975),
						(38, 'Caroline', 'Clark', 'Dentist', 1960),
						(39, 'Dalton', 'Clayton', 'Police Officer', 1982),
						(40, 'Steve', 'Clayton', 'Bus Driver', 1990),
						(41, 'Melanie', 'Clayton', 'Computer Engineer', 1987),
						(42, 'Alana', 'Wilson', 'Student', 2007),
						(43, 'Carson', 'Byrne', 'Food Scientist', 1995),
						(44, 'Conrad', 'Byrne', 'Student', 2007),
						(45, 'Ryan', 'Porter', 'Student', 2008),
						(46, 'Elin', 'Porter', 'Computer Programmer', 1978),
						(47, 'Tyler', 'Harvey', 'Student', 2007),
						(48, 'Arya', 'Harvey', 'Student', 2008),
						(49, 'Serena', 'Harvey', 'School Teacher', 1978),
						(50, 'Lilly', 'Franklin', 'Doctor', 1976),
						(51, 'Mai', 'Franklin', 'Dentist', 1994),
						(52, 'John', 'Franklin', 'Firefighter', 1999),
						(53, 'Judy', 'Franklin', 'Firefighter', 1995),
						(54, 'Katy', 'Lloyd', 'School Teacher', 1992),
						(55, 'Tamara', 'Allen', 'Ship Engineer', 1963),
						(56, 'Maxim', 'Lyons', 'Police Officer', 1985),
						(57, 'Allan', 'Lyons', 'Computer Engineer', 1983),
						(58, 'Marc', 'Harris', 'School Teacher', 1980),
						(59, 'Elin', 'Young', 'Student', 2009),
						(60, 'Diana', 'Young', 'Student', 2008),
						(61, 'Diane', 'Young', 'Student', 2006),
						(62, 'Alana', 'Bird', 'Student', 2003),
						(63, 'Anna', 'Becker', 'Security Agent', 1979),
						(64, 'Katie', 'Grant', 'Manager', 1977),
						(65, 'Joan', 'Grant', 'Student', 2010),
						(66, 'Bryan', 'Bell', 'Student', 2001),
						(67, 'Belle', 'Miller', 'Professor', 1970),
						(68, 'Peggy', 'Stevens', 'Bus Driver', 1990),
						(69, 'Steve', 'Williamson', 'HR Clerk', 1975),
						(70, 'Tyler', 'Williamson', 'Doctor', 1999),
						(71, 'Izabelle', 'Williamson', 'Systems Analyst', 1990),
						(72, 'Annabel', 'Williamson', 'Cashier', 1960),
						(73, 'Mohamed', 'Waters', 'Insurance Agent', 1966),
						(74, 'Marion', 'Newman', 'Computer Programmer', 1970),
						(75, 'Ada', 'Williams', 'Computer Programmer', 1986),
						(76, 'Sean', 'Scott', 'Bus Driver', 1983),
						(77, 'Farrah', 'Scott', 'Ship Engineer', 1974),
						(78, 'Christine', 'Lambert', 'School Teacher', 1973),
						(79, 'Alysha', 'Lambert', 'Student', 2007),
						(80, 'Maia', 'Grant', 'School Teacher', 1984);


SELECT *
FROM CLIENT
ORDER BY CLIENTID;

-- populate Borrower table:

INSERT INTO BORROWER(BORROWID,CLIENTID, BOOKID, BORROWDATE)
VALUES(1, 35, 17,'2016-07-20'),  
(2, 1,   3,   '2016-07-21'),  
(3, 42,  8,   '2016-07-22'),  
(4, 62, 16,   '2016-07-23'),  
(5, 53, 13,   '2016-07-24'),  
(6, 33, 15,   '2016-07-25'),  
(7, 40, 14,   '2016-07-26'),  
(8, 64,  2,   '2016-07-27'),  
(9, 56, 30,   '2016-07-28'),  
(10, 23, 2,   '2016-07-29'),  
(11, 46, 19,  '2016-07-30'),  
(12, 61, 20,  '2016-07-31'),  
(13, 58,  7,  '2016-08-01'),  
(14, 46, 16,  '2016-08-02'),  
(15, 80, 21,  '2016-08-03'),  
(16, 51, 23,  '2016-08-04'),  
(17, 49, 18,  '2016-08-05'),  
(18, 43, 18,  '2016-08-06'),  
(19, 30,  2,  '2016-08-07'),  
(20, 48, 24,  '2016-08-08'),  
(21, 71,  5,  '2016-08-09'),  
(22, 35,  3,  '2016-08-10'),  
(23, 57,  1,  '2016-08-11'),  
(24, 23, 25,  '2016-08-12'),  
(25, 20, 12,  '2016-08-13'),  
(26, 25,  7,  '2016-08-14'),  
(27, 72, 29,  '2016-08-15'),  
(28, 74, 20,  '2016-08-16'), 
(29, 53, 14,  '2016-08-17'), 
(30, 32, 10,  '2016-08-18'), 
(31, 12, 15,  '2016-08-19'),
(32, 77, 13,  '2016-08-20'),
(33, 30,  4,  '2016-08-21'),
(34, 37, 24,  '2016-08-22'),
(35, 27, 26,  '2016-08-23'),
(36,  1, 16,  '2016-08-24'),
(37, 21,  9,  '2016-08-25'),
(38, 69, 28,  '2016-08-26'),
(39, 17, 19,  '2016-08-27'),
(40,  8,  9,  '2016-08-28'),
(41, 63, 18,  '2016-08-29'),
(42, 65, 20,  '2016-08-30'),
(43, 51, 19,  '2016-08-31'),
(44, 23, 12,  '2016-09-01'),
(45, 17,  4,  '2016-09-02'),
(46, 68,  5,  '2016-09-03'),
(47, 46, 13,  '2016-09-04'),
(48, 15, 13,	'2016-09-05'),
(49, 11, 19,	'2016-09-06'),
(50, 78, 15,	'2016-09-07'),
(51, 47,  9,	'2016-09-08'),
(52, 68,  7,	'2016-09-09'),
(53, 37, 26,	'2016-09-10'),
(54, 48, 27,	'2016-09-11'),
(55,  9, 21,	'2016-09-12'),
(56, 29,  8,	'2016-09-13'),
(57, 64, 18,	'2016-09-14'),
(58, 61, 26,	'2016-09-15'),
(59, 39, 28,	'2016-09-16'),
(60, 73, 18,	'2016-09-17'),
(61, 11, 13,	'2016-09-18'),
(62, 45,  6,	'2016-09-19'),
(63, 33, 13,	'2016-09-20'),
(64, 10, 17,	'2016-09-21'),
(65, 28, 18,	'2016-09-22'),
(66, 51,  3,	'2016-09-23'),
(67, 29,  2,	'2016-09-24'),
(68, 28, 30,	'2016-09-25'),
(69, 15, 22,	'2016-09-26'),
(70, 57,  8,	'2016-09-27'),
(71,  2,  5,    '2016-09-28'),
(72, 74, 12,	'2016-09-29'),
(73, 51, 10,	'2016-09-30'),
(74, 25, 17,	'2016-10-01'),
(75, 45, 21,	'2016-10-02'),
(76, 27, 25,	'2016-10-03'),
(77, 32, 28,	'2016-10-04'),
(78, 71, 21,	'2016-10-05'),
(79, 75, 26,	'2016-10-06'),
(80, 56, 32,	'2016-10-07'),
(81, 26, 32,	'2016-10-08'),
(82, 66, 32,	'2016-10-09'),
(83, 57, 18,	'2016-10-10'),
(84, 40, 15,	'2016-10-11'),
(85, 65,  4,	'2016-10-12'),
(86, 54,  7,	'2016-10-13'),
(87, 29,  4,	'2016-10-14'),
(88, 44,  9,	'2016-10-15'),
(89, 56, 31,	'2016-10-16'),
(90, 17,  4,	'2016-10-17'),
(91, 35, 16,	'2016-10-18'),
(92, 22, 18,	'2016-10-19'),
(93, 39, 24,	'2016-10-20'),
(94, 63,  14,	'2016-10-21'),
(95, 53,  21,	'2016-10-22'),
(96, 40,   9,	'2016-10-23'),
(97, 52,   4,	'2016-10-24'),
(98, 27,  20,	'2016-10-25'),
(99, 72,  29,	'2016-10-26'),
(100, 49, 16,	'2016-10-27'),
(101,  6,  12,	'2016-10-28'),
(102, 74,	31,	'2016-10-29'),
(103, 48,	32,	'2016-10-30'),
(104, 69,	2,	'2016-10-31'),
(105, 60,	32,	'2016-11-01'),
(106, 45,	22,	'2016-11-02'),
(107, 42,	15,	'2016-11-03'),
(108, 79,	8,	'2016-11-04'),
(109, 70,	18,	'2016-11-05'),
(110, 34,	8,	'2016-11-06'),
(111, 43,	8,	'2016-11-07'),
(112, 42,	32,	'2016-11-08'),
(113, 67,	5,	'2016-11-09'),
(114, 80,	25,	'2016-11-10'),
(115, 54,	11,	'2016-11-11'),
(116, 34,	28,	'2016-11-12'),
(117, 65,	20,	'2016-11-13'),
(118, 61,	19,	'2016-11-14'),
(119, 38,	12,	'2016-11-15'),
(120, 51,	 4,	'2016-11-16'),
(121,  7,	16,	'2016-11-17'),
(122, 46,	16,	'2016-11-18'),
(123, 75,	30,	'2016-11-19'),
(124, 72,	32,	'2016-11-20'),
(125, 44,	17,	'2016-11-21'),
(126, 68,	15,	'2016-11-22'),
(127, 21,	 1,	'2016-11-23'),
(128, 14,	25,	'2016-11-24'),
(129, 68,	21,	'2016-11-25'),
(130, 35,	20,	'2016-11-26'),
(131, 16,	27,	'2016-11-27'),
(132, 79,	31,	'2016-11-28'),
(133, 14,	17,	'2016-11-29'),
(134, 29,	28,	'2016-11-30'),
(135, 41,	4,	'2016-12-01'),
(136, 42,	3,	'2016-12-02'),
(137, 45,	3,	'2016-12-03'),
(138, 36,	16,	'2016-12-04'),
(139, 36,	30,	'2016-12-05'),
(140, 54,	32,	'2016-12-06'),
(141, 61,	15,	'2016-12-07'),
(142,  1,	13,	'2016-12-08'),
(143, 43,	 1,	'2016-12-09'),
(144, 37,	14,	'2016-12-10'),
(145, 62,	17,	'2016-12-11'),
(146, 50,	22,	'2016-12-12'),
(147, 45,	 1,	'2016-12-13'),
(148,	32,	17,	'2016-12-14'),
(149,	13,	28,	'2016-12-15'),
(150,	15,	 9,	'2016-12-16'),
(151,	10,	19,	'2016-12-17'),
(152,	66,	 3,	'2016-12-18'),
(153,	68,	29,	'2016-12-19'),
(154,	21,	14,	'2016-12-20'),
(155,	35,	 9,	'2016-12-21'),
(156,	17,	24,	'2016-12-22'),
(157,	40,	21,	'2016-12-23'),
(158,	 1,	24,	'2016-12-24'),
(159,	70,	27,	'2016-12-25'),
(160,	80,	26,	'2016-12-26'),
(161,	29,	5,	'2016-12-27'),
(162,	76,	12,	'2016-12-28'),
(163,	22,	4,	'2016-12-29'),
(164,	2,	2,	'2016-12-30'),
(165,	35,	13,	'2016-12-31'),
(166,	40,	8,	'2017-01-01'),
(167,	68,	9,	'2017-01-02'),
(168,	32,	5,	'2017-01-03'),
(169,	34,	17,	'2017-01-04'),
(170,	34,	16,	'2017-01-05'),
(171,	80,	30,	'2017-01-06'),
(172,	20,	32,	'2017-01-07'),
(173,	36,	10,	'2017-01-08'),
(174,	78,	12,	'2017-01-09'),
(175,	57,	8,	'2017-01-10'),
(176,	75,	11,	'2017-01-11'),
(177,	71,	10,	'2017-01-12'),
(178,	48,	22,	'2017-01-13'),
(179,	19,	16,	'2017-01-14'),
(180,	79,	30,	'2017-01-15'),
(181,	70,	13,	'2017-01-16'),
(182,	30,	6,	'2017-01-17'),
(183,	45,	12,	'2017-01-18'),
(184,	30,	27,	'2017-01-19'),
(185,	26,	3,	'2017-01-20'),
(186,	66,	6,	'2017-01-21'),
(187,	47,	15,	'2017-01-22'),
(188,	53,	30,	'2017-01-23'),
(189,	80,	16,	'2017-01-24'),
(190,	70,	13,	'2017-01-25'),
(191,	14,	25,	'2017-01-26'),
(192,	46,	22,	'2017-01-27'),
(193,	30,	32,	'2017-01-28'),
(194,	60,	14,	'2017-01-29'),
(195,	14,	13,	'2017-01-30'),
(196,	71,	15,	'2017-01-31'),
(197,	38,	21,	'2017-02-01'),
(198,	69,	30,	'2017-02-02'),
(199,	49,	31,	'2017-02-03'),
(200,	28,	28,	'2017-02-04'),
(201,	49,	3,	'2017-02-05'),
(202,	75,	1,	'2017-02-06'),
(203,	78,	3,	'2017-02-07'),
(204,	43,	18,	'2017-02-08'),
(205,	27,	21,	'2017-02-09'),
(206,	64,	22,	'2017-02-10'),
(207,	21,	11,	'2017-02-11'),
(208,	66,	29,	'2017-02-12'),
(209,	45,	13,	'2017-02-13'),
(210,	48,	30,	'2017-02-14'),
(211,	20,	25,	'2017-02-15'),
(212,	41,	20,	'2017-02-16'),
(213,	51,	12,	'2017-02-17'),
(214,	5,	1,	'2017-02-18'),
(215,	40,	3,	'2017-02-19'),
(216,	79,	4,	'2017-02-20'),
(217,	15,	10,	'2017-02-21'),
(218,	42,	22,	'2017-02-22'),
(219,	17,	9,	'2017-02-23'),
(220,	38,	13,	'2017-02-24'),
(221,	79,	2,	'2017-02-25'),
(222,	74,	3,	'2017-02-26'),
(223,	46,	8,	'2017-02-27'),
(224,	78,	22,	'2017-02-28'),
(225,	45,	2,	'2017-03-01'),
(226,	72,	31,	'2017-03-02'),
(227,	18,	17,	'2017-03-03'),
(228,	29,	3,	'2017-03-04'),
(229,	66,	11,	'2017-03-05'),
(230,	36,	16,	'2017-03-06'),
(231,	26,	2,	'2017-03-07'),
(232,	32,	1,	'2017-03-08'),
(233,	62,	14,	'2017-03-09'),
(234,	12,	4,	'2017-03-10'),
(235,	38,	32,	'2017-03-11'),
(236,	29,	16,	'2017-03-12'),
(237,	36,	25,	'2017-03-13'),
(238,	76,	7,	'2017-03-14'),
(239,	28,	16,	'2017-03-15'),
(240,	60,	13,	'2017-03-16'),
(241,	8,	3,	'2017-03-17'),
(242,	25,	1,	'2017-03-18'),
(243,	62,	29,	'2017-03-19'),
(244,	51,	8,	'2017-03-20'),
(245,	27,	23,	'2017-03-21'),
(246,	69,	12,	'2017-03-22'),
(247,	51,	12,	'2017-03-23'),
(248,	7,	4,	'2017-03-24'),
(249,	31,	15,	'2017-03-25'),
(250,	14,	23,	'2017-03-26'),
(251,	14,	1,	'2017-03-27'),
(252,	39,	25,	'2017-03-28'),
(253,	79,	24,	'2017-03-29'),
(254,	40,	15,	'2017-03-30'),
(255,	51,	13,	'2017-03-31'),
(256,	61,	1,	'2017-04-01'),
(257,	15,	24,	'2017-04-02'),
(258,	10,	22,	'2017-04-03'),
(259,	67,	10,	'2017-04-04'),
(260,	79,	11,	'2017-04-05'),
(261,	19,	32,	'2017-04-06'),
(262,	35,	11,	'2017-04-07'),
(263,	27,	13,	'2017-04-08'),
(264,	30,	22,	'2017-04-09'),
(265,	8,	7,	'2017-04-10'),
(266,	70,	9,	'2017-04-11'),
(267,	56,	18,	'2017-04-12'),
(268,	13,	19,	'2017-04-13'),
(269,	61,	2,	'2017-04-14'),
(270,	47,	13,	'2017-04-15'),
(271,	30,	22,	'2017-04-16'),
(272,	18,	22,	'2017-04-17'),
(273,	34,	29,	'2017-04-18'),
(274,	32,	21,	'2017-04-19'),
(275,	9,	28,	'2017-04-20'),
(276,	62,	24,	'2017-04-21'),
(277,	44,	22,	'2017-04-22'),
(278,	27,	5,	'2017-04-23'),
(279,	61,	28,	'2017-04-24'),
(280,	5,	13,	'2017-04-25'),
(281,	43,	19,	'2017-04-26'),
(282,	34,	19,	'2017-04-27'),
(283,	35,	5,	'2017-04-28'),
(284,	13,	12,	'2017-04-29'),
(285,	74,	18,	'2017-04-30'),
(286,	70,	31,	'2017-05-01'),
(287,	42,	17,	'2017-05-02'),
(288,	51,	24,	'2017-05-03'),
(289,	45,	30,	'2017-05-04'),
(290,	70,	17,	'2017-05-05'),
(291,	77,	7,	'2017-05-06'),
(292,	74,	25,	'2017-05-07'),
(293,	47,	14,	'2017-05-08'),
(294,	10,	2,	'2017-05-09'),
(295,	16,	21,	'2017-05-10'),
(296,	48,	5,	'2017-05-11'),
(297,	72,	3,	'2017-05-12'),
(298,	26,	23,	'2017-05-13'),
(299,	49,	23,	'2017-05-14');
 
 
 
--                         SELECT *
--                         FROM BORROWER;


-- Display all contents from the client table
--  The first query wanted us to return all which is represented by an asterisk, 
--  From the client Table. The query was organized by the primary clientId in ascending order
 SELECT *
 FROM client
 ORDER BY clientid ASC;
 
-- First names, last names, ages and occupations of all clients
 SELECT clientfirstname, clientlastname, (2022 - clientdob) AS age, occupation
 FROM client
 ORDER BY clientid;
 
-- First and last names of clients that borrowed books in March 2018
 SELECT clientfirstname, clientlastname
 FROM client AS c
 INNER JOIN borrower AS b
 ON c.clientid = b.clientid
 WHERE borrowdate >= '2017-03-01' AND borrowdate <= '2017-03-31'
 GROUP BY c.clientid;
 
 
-- First and last names of the top 5 authors clients borrowed in 2017
 SELECT  authorfirstname, authorlastname
 FROM  author AS a
 INNER JOIN book AS b ON a.authorid = b.bookauthor
 INNER JOIN borrower AS bo ON b.bookid = bo.bookid
 WHERE borrowdate >= DATE('2017-01-01') AND  borrowdate <= DATE('2017-12-31')
 GROUP BY a.Authorid
 ORDER BY COUNT(a.authorID) DESC
 LIMIT 5;
 
-- Nationalities of the least 5 authors that clients borrowed during the years 2015-2017
--Showing to use JOINS with USING and then JOIN ___ ON ____=____

 SELECT a.authornationality  
 FROM author AS a  
 INNER JOIN book AS b ON a.authorid = b.bookauthor
INNER JOIN borrower AS bo ON b.bookid = bo.bookid
 WHERE borrowdate >= DATE('2015-01-01') AND  borrowdate <= DATE('2017-12-31')
 GROUP BY a.authornationality
 ORDER BY COUNT(a.authornationality) ASC
 LIMIT 5;
 
-- The book that was most borrowed during the years 2015-2017
 SELECT b.booktitle
 FROM  book AS b
 JOIN borrower AS bo USING(bookid)
 WHERE borrowdate >= DATE('2015-01-01') AND  borrowdate <= DATE('2017-12-31')
 GROUP BY b.bookid
 ORDER BY COUNT(bo.bookid) DESC
 LIMIT 1;
 
-- 7 Top borrowed genres for client born in years 1970-1980
 SELECT b.genre
 FROM  book AS b
 JOIN borrower AS bo USING(bookid)
 JOIN client AS c USING(clientid)
 WHERE c.clientdob >= 1970 AND c.clientdob <= 1980
 GROUP BY b.genre
 ORDER BY COUNT(b.genre) DESC;
 
 
-- Top 5 occupations that borrowed the most in 2016
 SELECT c.occupation
 FROM  client AS c
 JOIN borrower AS bo USING(clientid)
 WHERE bo.borrowdate >= DATE('2016-01-01') AND  bo.borrowdate <= DATE('2016-12-31')
 GROUP BY c.occupation
 ORDER BY COUNT(c.occupation) DESC
 LIMIT 5;
 
-- Average number of borrowed books by job title
 SELECT c.Occupation, 
 COUNT(c.Occupation) / 
 (SELECT COUNT(Occupation) FROM client WHERE Occupation = c.Occupation GROUP BY Occupation) AS Average
 FROM client c
 INNER JOIN borrower ON borrower.ClientId = c.ClientId
 GROUP BY c.Occupation;   
 
-- Create a VIEW and display the titles that were borrowed by at least 20% of clients
 CREATE VIEW titles_borrowed AS
 SELECT book.BookTitle 
 FROM book
 INNER JOIN borrower USING(bookid) --INNER JOIN borrower ON borrower.BookId = book.BookId
 INNER JOIN client  USING(ClientId) --INNER JOIN client ON client.ClientId = borrower.ClientId
 GROUP BY book.BookId
 HAVING COUNT(book.BookId)/(SELECT COUNT(ClientId) FROM client) >= .2;
 
-- The top month of borrows in 2017
 SELECT BorrowDate
 FROM borrower 
 WHERE BorrowDate >= Date('2017-01-01') AND BorrowDate <= Date('2017-12-31')
 GROUP BY BorrowDate
 ORDER BY COUNT(BorrowDate) DESC
 LIMIT 1;
-- Average number of borrows by age
-- AVG((SELECT Count(borrower.barrowerid) AS barrowed, (2022 - c.clientDob) AS age
--     FROM public.borrower AS bo
--     INNER JOIN book AS b ON bo.bookid = b.bookid
--     INNER JOIN client AS c ON bo.clientid = c.clientid
--     GROUP BY age
--     ORDER BY barrowed DESC))
    

 
-- The oldest and the youngest clients of the library
 (SELECT ClientFirstName, ClientLastName
  FROM client
ORDER BY ClientDoB ASC LIMIT 1) UNION
(SELECT ClientFirstName, ClientLastName FROM client
ORDER BY ClientDoB DESC LIMIT 1);
 
-- First and last names of authors that wrote books in more than one genre
 SELECT AuthorFirstName, AuthorLastName 
 FROM author a
INNER JOIN book ON book.BookAuthor = a.AuthorId
WHERE (SELECT COUNT(*) FROM 
(SELECT COUNT(DISTINCT Genre) FROM book WHERE a.AuthorId = book.BookAuthor GROUP BY Genre) AS no_of_genres) > 1
GROUP BY AuthorId;

SELECT *
FROM titles_borrowed;