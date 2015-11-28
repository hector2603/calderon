json.array!(@insurances) do |insurance|
  json.extract! insurance, :id, :nombre, :resumen, :descripcion
  json.url insurance_url(insurance, format: :json)
end
