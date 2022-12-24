CREATE VIEW VOLCANO_AMOUNT AS
SELECT TRIM(volc_country), count(volc_name) AS volc_amount 
FROM volcano GROUP BY volc_country

CREATE VIEW ELEVATION_ERUPTION AS
SELECT (eruption_type), elevation 
FROM eruption_types JOIN eruption USING(eruption_id) 
WHERE eruption_type <> 'Maar' 
UNION (SELECT (eruption_type), max(elevation)
   FROM eruption_types JOIN eruption USING (eruption_id) 
   WHERE eruption_type IN (SELECT eruption_type
   FROM eruption_types JOIN eruption USING (eruption_id) 
   GROUP BY eruption_type
   HAVING COUNT(*) > 1)
   GROUP BY eruption_type)

   
CREATE VIEW COUNTRY_HIGH_ELEVATION AS 
SELECT TRIM(volc_country), elevation 
FROM volcano JOIN eruption USING (volc_number)