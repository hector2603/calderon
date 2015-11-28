json.array!(@articles) do |article|
  json.extract! article, :id, :titulo, :resumen, :body
  json.url article_url(article, format: :json)
end
