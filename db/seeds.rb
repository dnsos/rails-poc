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
      title: row[0], # Projekt
      provider: row[1], # Zuwendungsempfänger
      service: row[5], # Leistung
      address: row[7], # Adresse
      postal_code: row[8], # PLZ
      city: row[9], # Ort
      phone: row[10], # Telefonnummer
      email: row[11], # EMail
      website: row[12], # Website
      latitude: row[14], # gc_ywert
      longitude: row[13], # gc_xwert
      district: row[6], # Bezirk
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
