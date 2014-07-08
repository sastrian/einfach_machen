json.array!(@pearls) do |pearl|
  json.extract! forum, :id, :body, :title, :image
  json.url pearl_url(pearl, format: :json)
end
