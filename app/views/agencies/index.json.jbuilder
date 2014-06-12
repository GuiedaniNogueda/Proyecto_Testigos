json.array!(@agencies) do |agency|
  json.extract! agency, :id, :agency_name
  json.url agency_url(agency, format: :json)
end
