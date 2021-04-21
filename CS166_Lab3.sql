-University Database

DROP TABLE IF EXISTS Professor
CREATE TABLE Professor (ssn NUMERIC (9, 0),
			name CHAR(20) NOT NULL,
			age INTEGER,
			rank INTEGER,
			specialty CHAR(20),
			PRIMARY KEY(ssn));

DROP TABLE IF EXISTS Project
CREATE TABLE Project (pno NUMERIC (9, 0),
			sponsor CHAR(20),
			start_date CHAR(10),
			end_date CHAR(10),
			budget INTEGER,
			PRIMARY KEY(pno));

DROP TABLE IF EXISTS Dept
CREATE TABLE Dept (dno NUMERIC (9, 0),
			dname CHAR(30),
			office CHAR(20),
			PRIMARY KEY(dno));

DROP TABLE IF EXISTS Graduate
CREATE TABLE Graduate (ssn NUMERIC (9, 0),
			name CHAR(30) NOT NULL,
			age INTEGER,
			deg_pg CHAR(20),
			PRIMARY KEY(ssn));






DROP TABLE IF EXISTS Notown Records


