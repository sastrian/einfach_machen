json.array!(@discussions) do |discussion|
  json.extract! discussion, :id, :title, :firstpost, :user_id, :forum_id
  json.url discussion_url(discussion, format: :json)
end
