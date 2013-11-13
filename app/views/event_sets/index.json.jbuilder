json.array!(@event_sets) do |event_set|
  json.extract! event_set, 
  json.url event_set_url(event_set, format: :json)
end
