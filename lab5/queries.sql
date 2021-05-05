-- (1) pid of parts with costs lower than 10
SELECT C.pid
FROM catalog C
WHERE C.cost < 10;

-- (2) name of parts with costs lower than 10
SELECT P.pname
FROM catalog C, parts P
WHERE C.pid = P.pid AND C.cost < 10;

-- (3) address of suppliers who supply part "Fire Hydrant Cap"
SELECT S.address
FROM catalog C, parts P, suppliers S
WHERE C.pid = P.pid AND C.sid = S.sid AND P.pname = 'Fire Hydrant Cap';

-- (4) name of suppliers who supply green parts
SELECT S.sname
FROM catalog C, parts P, suppliers S
WHERE C.pid = P.pid AND C.sid = S.sid AND P.color = 'Green';

-- (5) for each supplier, list supplier's name along with all parts' name that it supply
SELECT S.sname, P.pname
FROM catalog C, parts P, suppliers S
WHERE C.pid = P.pid AND C.sid = S.sid AND 


