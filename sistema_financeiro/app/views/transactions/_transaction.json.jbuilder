json.extract! transaction, :id, :tipo, :origem, :valor, :desconto, :multa, :valor_final, :data_hora, :account_id, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
