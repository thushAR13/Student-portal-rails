json.extract! forum, :id, :author_id, :title, :content, :created_at, :updated_at
json.url forum_url(forum, format: :json)
