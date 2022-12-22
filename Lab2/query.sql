SELECT TRIM(volc_country), COUNT(volc_name) AS volc_amount 
FROM volcano GROUP BY volc_country


SELECT eruption_type, elevation 
FROM eruption_types JOIN eruption USING(eruption_id) 
WHERE eruption_type <> 'Maar' 
UNION (
   SELECT eruption_type, MAX(elevation)
      FROM eruption_types JOIN eruption USING(eruption_id) 
      WHERE eruption_type IN (
         SELECT eruption_type
         FROM eruption_types JOIN eruption USING (eruption_id) 
         GROUP BY eruption_type
         HAVING COUNT(*) > 1)
         GROUP BY eruption_type)


SELECT TRIM(volc_country), elevation 
FROM volcano JOIN eruption USING(volc_number)