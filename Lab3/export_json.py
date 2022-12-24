import json
import psycopg2


conn = psycopg2.connect(
    dbname='VOLCANO_DB', user='kutsalaba93',
    password='9393', host='localhost',
    port='5432',
)


data = {}
with conn:
  cur = conn.cursor()
  TABLES = [
    'volcano',
    'eruption',
    'eruption_types'
  ]
  for i in TABLES:
    cur.execute('SELECT * FROM ' + i)
    rows = []
    fields = [x[0] for x in cur.description]
    for row in cur:
      rows.append(dict(zip(fields, row)))
    data[i] = rows

with open('Lab3/Kutsalaba_all.json', 'w') as json_out:
  json.dump(data, json_out, default=str)