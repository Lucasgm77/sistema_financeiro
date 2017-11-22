class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.decimal :saldo
      t.string :senha

      t.timestamps
    end
  end
end
