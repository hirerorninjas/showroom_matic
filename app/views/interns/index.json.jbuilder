json.array!(@interns) do |intern|
  json.extract! intern, :id, :Headline, :Details
  json.url intern_url(intern, format: :json)
end
