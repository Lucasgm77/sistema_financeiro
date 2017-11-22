class AddPessoaIdToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :pessoa_id, :integer
  end
end
