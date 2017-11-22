class AddDefaultValueToSaldo < ActiveRecord::Migration
  	def up
  		change_column :accounts, :saldo, :integer, default: 0
 	end

 	def down
 		change_column :accounts, :saldo, :integer, default: nil
 	end 
end