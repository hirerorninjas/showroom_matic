json.array!(@investors) do |investor|
  json.extract! investor, :id, :Company, :Equity_Investment, :Revenue, :EBITDA
  json.url investor_url(investor, format: :json)
end
