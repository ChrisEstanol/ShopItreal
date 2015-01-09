json.array!(@stores) do |store|
  json.extract! store, :id, :name, :city_id, :facebook, :twitter
  json.url store_url(store, format: :json)
end
