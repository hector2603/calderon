json.array!(@buscars) do |buscar|
  json.extract! buscar, :id
  json.url buscar_url(buscar, format: :json)
end
