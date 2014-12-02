json.array!(@salesmen) do |salesman|
  json.extract! salesman, :id, :name, :address
  json.url salesman_url(salesman, format: :json)
end
