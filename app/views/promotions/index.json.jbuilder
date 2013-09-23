json.array!(@promotions) do |promotion|
  json.extract! promotion, :begin_date, :end_date, :description, :status
  json.url promotion_url(promotion, format: :json)
end
