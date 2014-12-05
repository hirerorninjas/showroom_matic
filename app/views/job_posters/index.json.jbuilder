json.array!(@job_posters) do |job_poster|
  json.extract! job_poster, :id, :Headline, :Details
  json.url job_poster_url(job_poster, format: :json)
end
