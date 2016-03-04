json.array!(@pregames) do |pregame|
  json.extract! pregame, :id
  json.url pregame_url(pregame, format: :json)
end
