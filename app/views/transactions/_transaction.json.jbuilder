json.extract! transaction, :id, :title, :amount, :category_id, :user_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
