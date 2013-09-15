json.array!(@stores) do |store|
  json.extract! store, :name, :address, :description, :note, :pos_x, :pos_y
  json.url store_url(store, format: :json)
end
