json.array!(@providers) do |provider|
  json.extract! provider, :id, :company_name, :contact_first_name, :contact_last_name, :city, :phone, :email, :logo_url, :website, :active
  json.url provider_url(provider, format: :json)
end
