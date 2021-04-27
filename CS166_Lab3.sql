--University Database--

DROP TABLE IF EXISTS Professor CASCADE;
CREATE TABLE Professor (ssn NUMERIC (9, 0),
			name CHAR(20),
			age INTEGER,
			rank INTEGER,
			specialty CHAR(20),
			PRIMARY KEY(ssn));

INSERT INTO Professor(ssn, name, age, rank, specialty)
VALUES (862342342, 'Lauren Sinclair', 22, 1, 'Forensics');
INSERT INTO Professor(ssn, name, age, rank, specialty)
VALUES (862324567, 'Kieran White', 24, 2, 'Contemporary Art');

DROP TABLE IF EXISTS Project_Manages CASCADE;
CREATE TABLE Project_Manages (pno NUMERIC (9, 0),
			ssn NUMERIC (9, 0), --Prof ssn
			sponsor CHAR(20),
			start_date DATE,
			end_date DATE,
			budget INTEGER,
			PRIMARY KEY(pno), 
			FOREIGN KEY (ssn) REFERENCES Professor(ssn) -- Prof manages
			ON DELETE CASCADE); -- participation constraint

INSERT INTO Project_Manages(pno, ssn, sponsor, start_date, end_date, budget)
VALUES (000000001, 862342342, 'APD', '1890-12-20', '1892-03-12', 800);

DROP TABLE IF EXISTS Dept_Runs CASCADE;
CREATE TABLE Dept_Runs (dno NUMERIC (9, 0),
			ssn NUMERIC (9, 0),
			dname CHAR(30),
			office CHAR(20),
			PRIMARY KEY(dno),
			FOREIGN KEY (ssn) REFERENCES Professor(ssn) -- Prof runs
			ON DELETE CASCADE); -- Participation constraint

INSERT INTO Dept_Runs(dno, ssn, dname, office)
VALUES (100000000, 862342342, 'phantom scythe', 'homicide');

DROP TABLE IF EXISTS Graduate_Major CASCADE;
CREATE TABLE Graduate_Major (gssn NUMERIC (9, 0),
			dno NUMERIC (9, 0),	-- Dept ID
			gname CHAR(30) NOT NULL,
			age INTEGER,
			deg_pg CHAR(20),
			PRIMARY KEY(gssn),
			FOREIGN KEY (dno) REFERENCES Dept_Runs(dno)	-- Major
			ON DELETE CASCADE);	-- participation consraint

DROP TABLE IF EXISTS work_in CASCADE;
CREATE TABLE work_in (ssn NUMERIC (9, 0),
			pno NUMERIC (9, 0),
			PRIMARY KEY (ssn, pno),
			FOREIGN KEY (ssn) REFERENCES Professor(ssn),
			FOREIGN KEY (pno) REFERENCES Project_Manages(pno));

DROP TABLE IF EXISTS work_dept CASCADE;
CREATE TABLE work_dept (ssn NUMERIC (9, 0),
			dno NUMERIC (9, 0),
			time_pc INTEGER,
			PRIMARY KEY (ssn, dno),
			FOREIGN KEY (ssn) REFERENCES Professor(ssn),
			FOREIGN KEY (dno) REFERENCES Dept_Runs(dno));

DROP TABLE IF EXISTS work_proj_supervise_manage_advise CASCADE;	--aggregate
CREATE TABLE work_proj_supervise_manage_advise (ssn NUMERIC (9, 0),
			gssn NUMERIC (9, 0),
			pno NUMERIC (9, 0),
			since CHAR(10),
			PRIMARY KEY (ssn, gssn, pno),
			FOREIGN KEY (ssn) REFERENCES Professor(ssn),
			FOREIGN KEY (gssn) REFERENCES Graduate_Major(gssn),
			FOREIGN KEY (pno) REFERENCES Project_Manages(pno)
			ON DELETE CASCADE); -- participation constratraint

DROP TABLE IF EXISTS Advise CASCADE; -- advisor (graduate self-relation)
CREATE TABLE Advise (advisor_ssn NUMERIC (9, 0),
			advisee_ssn NUMERIC (9, 0),
			PRIMARY KEY (advisor_ssn, advisee_ssn),
			FOREIGN KEY(advisor_ssn) REFERENCES Graduate_Major(gssn),
			FOREIGN KEY(advisee_ssn) REFERENCES Graduate_Major(gssn));
			

--Notown Database--

DROP TABLE IF EXISTS Musician CASCADE;
CREATE TABLE Musician (ssn NUMERIC (9, 0),
			name CHAR(30),
			PRIMARY KEY(ssn));

DROP TABLE IF EXISTS Album_Producer CASCADE;
CREATE TABLE Album_Producer (albumid NUMERIC (9, 0),
			ssn NUMERIC (9, 0),	-- Musician ssn
			copyright_date DATE,
			speed INTEGER,
			title CHAR(20),
			PRIMARY KEY(albumid),
			FOREIGN KEY(ssn) REFERENCES Musician(ssn));	--Producer reation

DROP TABLE IF EXISTS Instrument CASCADE;
CREATE TABLE Instrument (instrid NUMERIC (9, 0),
				dname CHAR(20),
				key CHAR(20),
				PRIMARY KEY(instrid));

DROP TABLE IF EXISTS Place CASCADE;
CREATE TABLE Place (address CHAR(30),
			PRIMARY KEY(address));

DROP TABLE IF EXISTS Telephone_Home CASCADE;
CREATE TABLE Telephone_Home (phone_no CHAR(11),
			address CHAR(30),
			PRIMARY KEY(phone_no),
			FOREIGN KEY(address) REFERENCES Place(address));

DROP TABLE IF EXISTS Songs_Appears CASCADE;
CREATE TABLE Songs_Appears (songid NUMERIC (9, 0),
			albumid NUMERIC (9, 0),	-- Album id
			title CHAR(20),
			author CHAR(20),
			PRIMARY KEY(songid),
			FOREIGN KEY(albumid) REFERENCES Album_Producer(albumid));	--Appears relation

DROP TABLE IF EXISTS Plays CASCADE;
CREATE TABLE Plays (ssn NUMERIC (9, 0),
			instrid NUMERIC (9, 0),
			PRIMARY KEY(ssn, instrid),
			FOREIGN KEY(ssn) REFERENCES Musician(ssn),
			FOREIGN KEY(instrid) REFERENCES Instrument(instrid));

DROP TABLE IF EXISTS Perform CASCADE;
CREATE TABLE Perform (ssn NUMERIC (9, 0),
			songid NUMERIC (9, 0),
			PRIMARY KEY(ssn, songid),
			FOREIGN KEY(ssn) REFERENCES Musician(ssn),
			FOREIGN KEY(songid) REFERENCES Songs_Appears(songid));

DROP TABLE IF EXISTS Lives CASCADE;
CREATE TABLE Lives (ssn NUMERIC (9, 0),
			address CHAR(30),
			phone_no CHAR(11),
			PRIMARY KEY(ssn),
			FOREIGN KEY(ssn) REFERENCES Musician(ssn),
			FOREIGN KEY(address) REFERENCES Place(address),
			FOREIGN KEY(phone_no) REFERENCES Telephone_Home(phone_no));






