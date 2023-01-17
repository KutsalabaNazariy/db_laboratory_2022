-- procedure
CALL show_count_volcano('Submarine');
CALL show_count_volcano('Maar');

-- function
SELECT get_volcano_eruption_elevation('Milos');
     
INSERT INTO eruption
VALUES (210010, 1, 600),
       (210030, 3, 893),
       (210020, 2, 1464),
       (212040, 7, 367),
       (212030, 5, 751),
       (212051, 2, 180),
       (211020, 5, 1281),
       (211003, 4, 800),
       (212020, 1, 760),
       (211071, 7, 836);	 
SELECT * FROM eruption;

-- trigger
INSERT INTO VOLCANO(volc_number, volc_name, volc_country) VALUES ('214090','porak','Armenia-Azerbaijan');
INSERT INTO VOLCANO(volc_number, volc_name, volc_country) VALUES ('214050','samsari volcanic center','Georgia');
INSERT INTO VOLCANO(volc_number, volc_name, volc_country) VALUES ('213040','TENDURUK DAGI','Turkey')

SELECT * FROM volcano
