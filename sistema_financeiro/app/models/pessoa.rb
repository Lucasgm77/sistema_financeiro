class Pessoa < ActiveRecord::Base
	has_many :accounts
	validates :nome, presence: true, length: { minimum: 2 }
	validates :email, presence: true
end
