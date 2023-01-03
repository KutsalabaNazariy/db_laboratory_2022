import csv
import psycopg2


csv_out = 'Lab3/csv-files/Kutsalaba_DB_{}.csv'

TABLES = [
    'volcano',
    'eruption',
    'eruption_types'
]

conn = psycopg2.connect(dbname='VOLCANO_DB', user='kutsalaba93', password='9393')


with conn:
    cur = conn.cursor()

    for i in TABLES:
        cur.execute('SELECT * FROM ' + i)
        fields = [x[0] for x in cur.description]
        with open(csv_out.format(i), 'w') as outfile:
            csv.writer(outfile).writerow(fields)
            for row in cur:
                csv.writer(outfile).writerow([str(x) for x in row])
