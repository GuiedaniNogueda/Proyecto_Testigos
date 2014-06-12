json.array!(@orders) do |order|
  json.extract! order, :id, :order_number, :campaign, :agency_id, :start_date, :end_date, :site_id
  json.url order_url(order, format: :json)
end
