import psycopg2
import matplotlib.pyplot as plt


query_1 = '''CREATE VIEW VOLCANO_AMOUNT AS
SELECT TRIM(volc_country), count(volc_name) AS volc_amount 
FROM volcano GROUP BY volc_country;
'''

query_2 = '''CREATE VIEW ELEVATION_ERUPTION AS
SELECT (eruption_type), elevation 
FROM eruption_types JOIN eruption USING(eruption_id) 
WHERE eruption_type <> 'Maar' 
UNION (SELECT (eruption_type), max(elevation)
   FROM eruption_types JOIN eruption USING (eruption_id) 
   WHERE eruption_type IN (SELECT eruption_type
   FROM eruption_types JOIN eruption USING (eruption_id) 
   GROUP BY eruption_type
   HAVING COUNT(*) > 1)
   GROUP BY eruption_type);
'''

query_3 = '''CREATE VIEW COUNTRY_HIGH_ELEVATION AS 
SELECT TRIM(volc_country), elevation 
FROM volcano JOIN eruption USING (volc_number);
'''

conn = psycopg2.connect(
    dbname='VOLCANO_DB', user='kutsalaba93',
    password='9393', host='localhost',
    port='5432',
)

with conn:
  cur = conn.cursor()
  cur.execute('DROP VIEW IF EXISTS VOLCANO_AMOUNT')
  cur.execute(query_1)
  cur.execute('SELECT * FROM VOLCANO_AMOUNT')
  countries = []
  amount = []
  for row in cur:
    print(row)
    countries.append(row[0])
    amount.append(row[1])
  figure, (bar_ax, pie_ax, bar_2_ax) = plt.subplots(1, 3, figsize=(16, 10))
  figure.subplots_adjust(wspace=0.4, bottom=0.25)
  pie_ax.pie(amount, labels=countries, autopct='%1.1f%%')
  pie_ax.set_title('Number of volcanoes in each country')


  cur.execute('DROP VIEW IF EXISTS ELEVATION_ERUPTION')
  cur.execute(query_2)
  cur.execute('SELECT * FROM ELEVATION_ERUPTION')
  eruption_type = []
  elevation = []
  for row in cur:
    print(row)
    eruption_type.append(row[0])
    elevation.append(abs(row[1]))

  bar_ax.bar(eruption_type, elevation, width=0.4)
  bar_ax.set_xticklabels(eruption_type, rotation=65, rotation_mode='anchor')
  bar_ax.set_title(
      'The dependence of the height of the eruption \non the type of volcanic eruption')
  bar_ax.set_xlabel('Type of eruption', weight='bold')
  bar_ax.set_ylabel('Eruption height', weight='bold')


  cur.execute('DROP VIEW IF EXISTS COUNTRY_HIGH_ELEVATION')
  cur.execute(query_3)
  cur.execute('SELECT * FROM COUNTRY_HIGH_ELEVATION')
  country = []
  elevation = []
  for row in cur:
    print(row)
    country.append(row[0])
    elevation.append(abs(row[1]))

  bar_2_ax.bar(country, elevation, width=0.5)
  bar_2_ax.set_title(
      'The connection of the country \nand the height of the eruption')
  bar_2_ax.set_xlabel('Countries', weight='bold')
  bar_2_ax.set_ylabel('Eruption height', weight='bold')

  plt.savefig('Lab3/new_graphs.png')
  plt.show()