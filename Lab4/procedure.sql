-- a procedure that outputs the name and type of a given volcano
CREATE OR REPLACE PROCEDURE volc_and_type(type_ varchar(50))
LANGUAGE 'plpgsql'
AS $$
DECLARE volcano_name volcano.volc_name%TYPE;
DECLARE volcano_type eruption_types.eruption_type%TYPE;

BEGIN
    SELECT volc_name, eruption_type INTO volcano_name, volcano_type FROM volcano JOIN eruption USING(volc_number) 
																	JOIN eruption_types USING(eruption_id)
	WHERE eruption_type = type_;
    RAISE INFO 'Volcano name: %,  Volcano type: %', TRIM(volcano_name), TRIM(volcano_type);
END;
$$;
--DROP PROCEDURE volc_and_type(varchar(50));

