json.extract! account, :id, :saldo, :senha, :created_at, :updated_at
json.url account_url(account, format: :json)
