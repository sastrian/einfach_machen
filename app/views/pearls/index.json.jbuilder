json.array!(@pearls) do |pearl|
  json.extract! pearl, :id, :user_id, :body, :title, :image
  json.url pearl_url(pearl, format: :json)
end
