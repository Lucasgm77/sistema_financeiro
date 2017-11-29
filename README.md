O nosso sistema tem 3 classes Pessoa, que pode ter n Accounts, que pode ter n Transactions.
Para isso, nos modelos usamos a seguinte relação:

- Pessoa has_many Account
- Account belongs_to Pessoa
- Transaction belongs_to Account
- Account has_many Transactions 

Para gerar Controllers, Views, Models e as Tabelas no Banco de Dados(Postgres) utilizamos o comando Scaffold para cada uma das classes.
Esse comando gera praticamente tudo. Actions index, show, new, create, edit, update, destroy nos Controllers e as suas rescpetivas views.
Após usar o Scaffold, precisavamos usar o rake db:migrate para atualizar as mudanças.
Criamos relações(foreign keys) chamadas de account_id em Transaction e pessoa_id em Account.
Usamos também outras migrações para completar os dados, como adicionar um valor padrão(default) para saldo R$0 para conta e impedir que 
o sistema salve pessoas sem o campo nome preenchido.

Até ai, o básico do nosso sistema já está criado. Podemos cadastrar, editar, mostrar, destruir Pessoas, Accounts e Transactions.

A partir dos Models, começamos a implementar as regras de negócio do nosso sistema. Em transactions model, usamos before_validation para o metodo atualiza_valor_final
para podermos alterar o valor_final de cada transaction, o valor_final é o valor - (valor*desconto) + (valor*multa). E validate valida_valor_final
para impedir que o valor_final seje salvo se ele for negativo. after_save def atualiza_saldo_conta, serve para preencher o saldo da conta da 
transaction criada, basicamente saldo de uma conta é a soma das transactions daquela conta. Assim como saldo_total, que é um atributo de 
Pessoa, é a soma dos saldos das contas daquela pessoa. 

Para fazer autenticação de usuário utilizamos uma gem chamada Devise. Ela gem, após instalada faz praticamente todo o trabalho bruto.
Basicamente só tivemos que adicionar nos Controllers o metodo before_action :authenticate_user! que impede qualquer ação daquele
Controller de ser executada sem autenticação.

Para fazer os formularios de pesquisa usamos outra gem chamada Ransack. Fazemos alterações nos Controlers para que eles mostrem a buscas
feitas pelos formularios que criamos nas views com search_form_for e partir dos comandos sql podemos criar filtros para achar o que quisermos.

A maior dificuldade que tivemos nesse projeto foi principalmente no inicio, em entender como a arquitetura MVC funciona. Tivemos dificuldade 
na parte de routes e como podiamos usa-las 



