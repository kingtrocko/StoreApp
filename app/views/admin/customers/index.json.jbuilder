json.array!(@customers) do |customer|
  json.extract! customer, :id, :store_name, :first_name, :last_name, :email, :phone, :address, :city, :active
  json.url customer_url(customer, format: :json)
end
