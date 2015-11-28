json.array!(@services) do |service|
  json.extract! service, :id, :type_id, :nombre, :resumen, :descripcion
  json.url service_url(service, format: :json)
end
