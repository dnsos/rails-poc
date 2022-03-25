require 'csv'

# headers: true because there is a header row present in the source CSV
# converters: %i[numeric] makes sure that any numeric value (integer or float) is casted from the default CSV entry string
# col_sep: ';' tells the parser which character separates the columns
CSV.foreach(
  Rails.root.join('lib/data/data.csv'),
  headers: true,
  converters: %i[numeric],
  col_sep: ';',
) do |row|
  # Create a new facility for every row in the CSV
  Facility.create(
    {
      title: row['Projekt'],
      provider: row['Zuwendungsempfänger'],
      service: row['Leistung'],
      address: row['Adresse'],
      postal_code: row['PLZ'],
      city: row['Ort'],
      phone: row['Telefonnummer'],
      email: row['EMail'],
      website: row['Website'],
      latitude: row['gc_ywert'],
      longitude: row['gc_xwert'],
      district: row['Bezirk'],
    },
  )
end

FocusGroup.insert_all(
  [
    { label: 'Erwachsene' },
    { label: 'Suchterkrankte' },
    { label: 'Geflüchtete' },
    { label: 'Migrationshintergrund' },
    { label: 'Kinder und Jugendliche' },
    { label: 'Essstörungen' },
    { label: 'Frauen' },
    { label: 'LSTBIQ' },
    { label: 'HIV/AIDS-Erkrankte' },
  ],
)
