json.array!(@images) do |image|
  json.extract! image, :id, :file_id, :creative_id
  json.url image_url(image, format: :json)
end
