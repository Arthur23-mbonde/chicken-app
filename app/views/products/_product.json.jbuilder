json.extract! product, :id, :name, :description, :current_price, :disponibility, :evaluation, :race_id, :category_id, :created_at, :updated_at
json.url product_url(product, format: :json)
