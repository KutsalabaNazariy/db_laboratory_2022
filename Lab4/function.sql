-- show eruption elevation information about the volcano

CREATE OR REPLACE FUNCTION get_volcano_eruption_elevation(volc_arg varchar) 
    RETURNS TABLE (volcano_name varchar, volc_elevation integer)
    LANGUAGE 'plpgsql'
AS $$
BEGIN
    RETURN QUERY
		SELECT volc_name::varchar, elevation::integer
		FROM volcano
			INNER JOIN eruption 
			USING(volc_number)
		WHERE volc_name = volc_arg;
END;
$$


SELECT * FROM get_volcano_eruption_elevation('Milos');




