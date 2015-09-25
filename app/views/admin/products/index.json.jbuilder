json.array!(@products) do |product|
  json.extract! product, :id, :title, :description, :provider_id, :category_id, :active
  json.url product_url(product, format: :json)
end
