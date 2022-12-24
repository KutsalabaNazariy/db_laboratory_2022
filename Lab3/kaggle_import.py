import csv
import psycopg2


INPUT_CSV_FILE = 'Lab3/volcano_db.csv'

query_0 = '''
create table volcanic (
    volc_number int PRIMARY KEY NOT NULL,
    volc_name character varying(40) NULL,
    volc_country character varying(50) NULL
)
'''

query_1 = '''
DELETE FROM volcanic
'''

query_2 = '''
INSERT INTO volcanic (volc_number, volc_name, volc_country) VALUES (%s, %s, %s)
'''

conn = psycopg2.connect(
    dbname='VOLCANO_DB', user='kutsalaba93',
    password='9393', host='localhost',
    port='5432',
)


with conn:
    cur = conn.cursor()
    cur.execute('drop table if exists volcanic')
    cur.execute(query_0)
    cur.execute(query_1)
    with open(INPUT_CSV_FILE, 'r') as inf:
        reader = csv.DictReader(inf)
        for idx, row in enumerate(reader):
            values = (row['Number'], row['Name'], row['Country'])
            cur.execute(query_2, values)
    conn.commit()