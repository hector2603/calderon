json.array!(@contactos) do |contacto|
  json.extract! contacto, :id, :nombre, :asunto, :texto, :numero
  json.url contacto_url(contacto, format: :json)
end
