json.array!(@soat_privates) do |soat_private|
  json.extract! soat_private, :id, :vehiculo, :clase, :prima, :contribucion, :tasa
  json.url soat_private_url(soat_private, format: :json)
end
