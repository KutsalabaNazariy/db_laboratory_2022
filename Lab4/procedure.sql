-- showing numbers of volcanoes in the country

CREATE OR REPLACE PROCEDURE show_count_volcano(IN country_name varchar, INOUT x integer DEFAULT 0)
LANGUAGE 'plpgsql'
AS $$
BEGIN
   SELECT COUNT(*) FROM volcano INTO x
   GROUP BY volc_country 
   HAVING volc_country = country_name;
END;
$$;

-- DROP PROCEDURE show_count_volcano(varchar);

-- CALL show_count_volcano('Greece');


