-- (1) total number of parts supplied by each supplier
SELECT COUNT(*)
FROM catalog C, parts P, suppliers S
WHERE C.pid = P.pid AND C.sid = S.sid
GROUP BY S.sid;

-- (2) total number of parts supplied by each supplier who supplies at least 3 parts
SELECT COUNT(*)
FROM catalog C, parts P, suppliers S
WHERE C.pid = P.pid AND C.sid = S.sid AND 2 < (SELECT COUNT(*) 
					       FROM catalog C, parts P
					       WHERE C.pid = P.pid AND C.sid = S.sid)
GROUP BY S.sid;

-- (3) For every supplier that supplies only green parts, print the name of the supplier 
--	& the total number of parts that he supplies
--SELECT S.address
--FROM catalog C, parts P, suppliers S
--WHERE C.pid = P.pid AND C.sid = S.sid AND P.pname = 'Fire Hydrant Cap';

-- (4) for ever supplier that supplies green parts & red parts print the name of the supplier
--	& the price of the most expensive part he supplies
--SELECT S.sname
--FROM catalog C, parts P, suppliers S
--WHERE C.pid = P.pid AND C.sid = S.sid AND P.color = 'Green';

