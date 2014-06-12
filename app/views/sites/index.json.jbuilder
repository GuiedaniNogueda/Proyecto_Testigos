json.array!(@sites) do |site|
  json.extract! site, :id, :site_name
  json.url site_url(site, format: :json)
end
