-- (1) Count how many parts in NYC have more than 70 parts on_hand
SELECT COUNT(N.on_hand)
FROM part_nyc N
WHERE N.on_hand > 70;

-- (2) Count how many total parts on hand in both NYC and SFO are Red
--SELECT SUM(N.on_hand)
--FROM part_nyc N, part_sfo S
--WHERE N.color = (SELECT color_id FROM color C WHERE C.color_name = 'Red')  
--UNION
--SELECT SUM(S.on_hand) 
--FROM part_sfo 
--WHERE S.color = (SELECT color_id FROM color C WHERE C.color_name = 'Red');

-- (3) List all the suppliers that have more total on_hand parts in NYC than they do in SFO
--SELECT N.supplier
--FROM part_nyc N, part_sfo S
--WHERE N.part_number = S.part_number AND 
--	(SELECT SUM(N2.on_hand) FROM part_nyc N2 WHERE N.supplier = N2.supplier) > 
--	(SELECT SUM(S2.on_hand) FROM part_sfo S2 WHERE S.supplier = S2.supplier);

-- (4) List all suppliers that supply parts in NYC that aren't supplied by anyone in SFO
SELECT N.supplier
FROM part_nyc N
WHERE N.supplier NOT IN (SELECT S.supplier FROM part_sfo S WHERE N.part_number = S.part_number);

-- (5) Update all of the NYC on_hand values - 10
UPDATE part_nyc
SET on_hand = on_hand - 10;

-- (6) Delete all parts from NYC which have less than 30 parts on_hand
DELETE
FROM part_nyc
WHERE on_hand < 30;

