DROP TRIGGER IF EXISTS customer_insert ON customers;

-- The first step: creating a trigger function
CREATE OR REPLACE FUNCTION add_to_volcaudit() RETURNS trigger 
LANGUAGE 'plpgsql'
AS
$$
     BEGIN
          insert into volcanoes_audit(user_name, date, time_, volc_name)
          VALUES(user, CURRENT_DATE, CURRENT_TIMESTAMP(0), OLD.volc_name);
          RETURN OLD;
     END;
$$;

-- The second stage: creating a trigger
CREATE TRIGGER volcano_audit
AFTER DELETE OR UPDATE ON volcano
FOR EACH ROW EXECUTE FUNCTION add_to_volcaudit();


CREATE TABLE volcanoes_audit(
    id SERIAL PRIMARY KEY,
    user_name varchar(50) NOT NULL,
    date date,
    time_ time,
	volc_name varchar
);

--DELETE FROM volcano WHERE volc_name = 'Yali'

--SELECT * FROM volcanoes_audit

-- INSERT INTO volcano(volc_number, volc_name, volc_country, eruption_id)
-- VALUES(212051, 'Yali', 'Greece', NULL);