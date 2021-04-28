--University Library Database--

DROP TABLE IF EXISTS Students CASCADE;
CREATE TABLE Student (stid NUMERIC (9, 0),
			stname CHAR(20),
			major INTEGER,
			age INTEGER,
			PRIMARY KEY(stid));

INSERT INTO Students (stid, stname, major, age)
VALUES (862342342, 'Lauren Sinclair', 'CS', 22);
INSERT INTO Students (stid, stname, major, age)
VALUES (862324567, 'Kieran White', 'Art', 24);

DROP TABLE IF EXISTS Books CASCADE;
CREATE TABLE Books (docid NUMERIC (9, 0),
			title CHAR(40),
			publisher CHAR(20),
			year INTEGER,
			PRIMARY KEY(docid));

INSERT INTO Books (docid, title, publisher, year)
VALUES (225200414, 'No Longer Human', 'Penguin', 1948);
INSERT INTO Books (docid, title, publisher, year)
VALUES (225200928, 'Beast Under the Moonllight', 'Penguin', 1956);

DROP TABLE IF EXISTS Authors CASCADE;
CREATE TABLE Authors (aname CHAR(20),
			address CHAR(40),
			PRIMARY KEY(aname));

INSERT INTO Authors (aname, address)
VALUES ('Dazai Osamu', '1123 Kyoto, Japan');
INSERT INTO Authors (aname, address)
VALUES ('Atsushi', '2357 Davis, California');
INSERT INTO Authors (aname, address)
VALUES ('Jones', '7121 Davis, California');

--DROP TABLE IF EXISTS Decriptions CASCADE:
--CREATE TABLE Descriptions (keyword CHAR(10),
--				PRIMARY KEY(keyword));

DROP TABLE IF EXISTS borrows CASCADE;
CREATE TABLE borrows (docid NUMERIC (9, 0),
			stid NUMERIC (9, 0)
			bdate DATE,
			PRIMARY KEY(docid, stid)
			FOREIGN KEY (docid) REFERENCES Books(docid)
			FOREIGN KEY (stid) REFERENCES Students(stid));

DROP TABLE IF EXISTS has_written CASCADE;
CREATE TABLE has_written (docid NUMERIC (9, 0),
			aname CHAR(20),
			PRIMARY KEY (docid, aname),
			FOREIGN KEY (docid) REFERENCES Books(docid),
			FOREIGN KEY (aname) REFERENCES Authors(aname));

DROP TABLE IF EXISTS describes CASCADE;
CREATE TABLE describes (docid NUMERIC (9, 0),
			keyword CHAR(10),
			PRIMARY KEY (keyword),
			FOREIGN KEY (docid) REFERENCES Books(docid));


