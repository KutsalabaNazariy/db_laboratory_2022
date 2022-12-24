	   
INSERT INTO volcano
VALUES (210010, 'West Eifel Volcanic Field','Germany'),
       (210030, 'Olot Volcanic Field','Spain'),
       (212020, 'Methana', 'Greece'),
       (212040, 'Santorini', 'Greece'),
       (212030, 'Milos', 'Greece'),
       (212051, 'Yali', 'Greece'),
       (210020, 'Chaine des Puys', 'France'),
       (211003, 'Vulsini','Italy'),
       (211020, 'Vesuvius','Italy'),
       (211071, 'Pantelleria', 'Italy');

INSERT INTO eruption_types
VALUES (1, 'Maar'),
       (2, 'Lava dome'),
       (3, 'Pyroclastic cone'),
       (4, 'Caldera'),
       (5, 'Stratovolcano'),
       (6, 'Submarine'),
       (7, 'Shield');

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