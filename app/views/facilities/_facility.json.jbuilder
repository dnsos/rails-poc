json.extract! facility, :id, :title, :provider, :service, :address, :postal_code, :city, :phone, :email,
              :website, :latitude, :longitude, :district, :created_at, :updated_at
json.url facility_url(facility, format: :json)
