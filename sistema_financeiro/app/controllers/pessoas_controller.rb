class PessoasController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@pessoas = Pessoa.all
	end 

	def new 
		@pessoa = Pessoa.new
	end

	def create
		@pessoa = Pessoa.new(pessoa_params)
		if @pessoa.save
			redirect_to @pessoa, notice: 'Cadastro criado com sucesso.'
		else
			render :new	
		end
	end 

	def show
		@pessoa = Pessoa.find(params[:id])	
	end

	def destroy
		@pessoa = Pessoa.find(params[:id])
		if @pessoa.destroy
			redirect_to @pessoa, notice: 'Pesseoa deletada com sucesso.'
		else
			redirect_to @pessoa, notice: 'Não foi possivel deletar a pessoa.'
		end
	end

	def edit
		@pessoa = Pessoa.find(params[:id])
	end

	def update
		@pessoa = Pessoa.find(params[:id])
		if @pessoa.update(pessoa_params)
			redirect_to pessoas_url, notice: 'Pessoa atualizada com sucesso.'
		else
			redirect_to pessoas_url, notice: 'Não foi possivel atualizar a pessoa.'
		end
	end

	private

	def pessoa_params
		params.require(:pessoa).permit(:nome,:cpf,:email,:endereco,:data_nascimento)
	end	

end

