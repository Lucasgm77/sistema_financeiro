class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :nome 
      t.string :cpf
      t.string :email
      t.string :endereco
      t.date :data_nascimento

      t.timestamps
    end
  end
end
