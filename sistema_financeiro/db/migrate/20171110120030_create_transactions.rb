class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :tipo
      t.text :origem
      t.decimal :valor
      t.decimal :desconto
      t.decimal :multa
      t.decimal :valor_final
      t.datetime :data_hora
      t.integer :account_id

      t.timestamps
    end
  end
end
