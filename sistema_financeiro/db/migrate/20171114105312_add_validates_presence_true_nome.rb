class AddValidatesPresenceTrueNome < ActiveRecord::Migration
  	def up
  		change_column :pessoas, :nome, :string, :null => false
  	end

  	def down
  		change_column :pessoas, :nome, :string, :null => true
 	 end
end
