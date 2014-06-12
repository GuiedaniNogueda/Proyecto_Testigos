json.array!(@formats) do |format|
  json.extract! format, :id, :format_name
  json.url format_url(format, format: :json)
end
