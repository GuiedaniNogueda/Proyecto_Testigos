json.array!(@lines) do |line|
  json.extract! line, :id, :line_number, :format_id, :start_date, :end_date
  json.url line_url(line, format: :json)
end
