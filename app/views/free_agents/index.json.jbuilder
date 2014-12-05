json.array!(@free_agents) do |free_agent|
  json.extract! free_agent, :id, :Headline, :Details
  json.url free_agent_url(free_agent, format: :json)
end
