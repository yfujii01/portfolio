json.extract! item, :id, :title, :url, :overview, :detail, :public, :created_at, :updated_at
json.url item_url(item, format: :json)
