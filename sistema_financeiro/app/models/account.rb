class Account < ActiveRecord::Base
	belongs_to :pessoa
	has_many :transactions	
end
