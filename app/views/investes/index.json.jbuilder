json.array!(@investes) do |investe|
  json.extract! investe, :id, :Company, :Opportunity_Headline, :Description
  json.url investe_url(investe, format: :json)
end
