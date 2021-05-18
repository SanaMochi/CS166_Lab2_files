-- (1) total number of parts supplied by each supplier
SELECT S.sid, COUNT(*)
FROM catalog C, parts P, suppliers S
WHERE C.pid = P.pid AND C.sid = S.sid
GROUP BY S.sid;

-- (2) total number of parts supplied by each supplier who supplies at least 3 parts
SELECT S.sid, COUNT(*)
FROM catalog C, parts P, suppliers S
WHERE C.pid = P.pid AND C.sid = S.sid AND 2 < (SELECT COUNT(*) 
					       FROM catalog C, parts P
					       WHERE C.pid = P.pid AND C.sid = S.sid)
GROUP BY S.sid;

-- (3) For every supplier that supplies only green parts, print the name of the supplier 
--	& the total number of parts that he supplies
SELECT S.sname, COUNT(*)
FROM catalog C, parts P, suppliers S
WHERE C.pid = P.pid AND C.sid = S.sid AND NOT EXISTS (SELECT *
							FROM catalog C2, parts P2, suppliers S2
							WHERE C2.pid = P2.pid AND C2.sid = S2.sid AND S.sid = S2.sid AND P2.color != 'Green')
GROUP BY S.sname, S.sid;

-- (4) For ever supplier that supplies green parts & red parts print the name of the supplier
--	& the price of the most expensive part he supplies
SELECT S.sname, MAX(C.cost)
FROM catalog C, parts P, suppliers S
WHERE C.pid = P.pid AND C.sid = S.sid AND EXISTS (SELECT *
						  FROM catalog C2, parts P2, suppliers S2
						  WHERE C2.pid = P2.pid AND C2.sid = S2.sid AND S.sid = S2.sid AND P2.color = 'Green')
				      AND EXISTS (SELECT *
						  FROM catalog C3, parts P3, suppliers S3
						  WHERE C3.pid = P3.pid AND C3.sid = S3.sid AND S.sid = S3.sid AND P3.color = 'Red')
GROUP BY S.sname, S.sid;

