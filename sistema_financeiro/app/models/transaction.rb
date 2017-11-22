	class Transaction < ActiveRecord::Base
	belongs_to :account
	before_validation :atualiza_valor_final
	validate :valida_valor_final
	after_save :atualiza_saldo_conta

	private
	
	def atualiza_valor_final
    	self.valor_final =  valor - (valor*desconto) + (valor*multa)
	end

	def valida_valor_final
		errors.add :valor_final,'é negativo' if valor_final && valor_final < 0
	end  

	def atualiza_saldo_conta
			account.update_columns(saldo: account.transactions.to_a.sum do |transaction|
					if transaction.tipo == 'Deposito'
						transaction.valor_final
					else
						-transaction.valor_final
					end
			 end)
	end

end
