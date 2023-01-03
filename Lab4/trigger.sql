--  a trigger that when a new row is inserted into the volcano table
-- writes the name of the volcano, each word begins with a capital letter

CREATE TRIGGER inserting_volc_name 
AFTER INSERT ON volcano
FOR EACH ROW EXECUTE FUNCTION make_capital()

CREATE OR REPLACE FUNCTION make_capital() RETURNS trigger AS
$$
     BEGIN
          UPDATE Volcano 
          SET volc_name = INITCAP(volc_name) WHERE VOLCANO.volc_name = NEW.volc_name; 
		  RETURN NULL; -- result is ignored since this is an AFTER trigger
     END;
$$ LANGUAGE 'plpgsql';

