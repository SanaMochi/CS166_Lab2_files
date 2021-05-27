-- Indexes of the tables
DROP INDEX IF EXISTS nyc;
DROP TABLE IF EXISTS sfo;
DROP TABLE IF EXISTS sup;
DROP TABLE IF EXISTS col;

CREATE INDEX nyc
ON part_nyc
USING BTREE
(on_hand);

CREATE INDEX sfo
ON part_sfo
USING BTREE
(on_hand);

CREATE INDEX sup
ON supplier
USING BTREE
(supplier_id);

CREATE INDEX COL
ON color
USING BTREE
(color_id);



