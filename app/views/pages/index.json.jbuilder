json.array!(@pages) do |page|
  json.extract! page, :id, :line_number, :creative_id
  json.url page_url(page, format: :json)
end
