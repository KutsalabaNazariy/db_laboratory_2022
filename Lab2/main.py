import psycopg2
import matplotlib.pyplot as plt


query_1 = '''
SELECT TRIM(volc_country), COUNT(volc_name) AS volc_amount 
FROM volcano GROUP BY volc_country
'''

query_2 = '''
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
'''

query_3 = '''
SELECT TRIM(volc_country), elevation 
FROM volcano JOIN eruption USING(volc_number)
'''

conn = psycopg2.connect(
    dbname='VOLCANO_DB', user='kutsalaba93',
    password='9393', host='localhost',
    port='5432',
)

with conn:

    cur = conn.cursor()

    print('\nQuery 1:  ')
    cur.execute(query_1)
    for row in cur:
        print(row)

    print('\nQuery 2: ')
    cur.execute(query_2)
    for row in cur:
        print(row)

    print('\nQuery 3: ')
    cur.execute(query_3)
    for row in cur:
        print(row)

