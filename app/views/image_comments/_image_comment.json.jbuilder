json.extract! image_comment, :id, :user_id, :image_id, :comment, :created_at, :updated_at
json.url image_comment_url(image_comment, format: :json)
