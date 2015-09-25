json.array!(@categories) do |category|
  json.extract! category, :id, :title
  json.url admin_category_url(category, format: :json)
end
