class Customer < ActiveRecord::Base
	has_many :transaction_lines
	
	attr_accessible :first_name, :last_name

	validates :first_name, :last_name,
		:presence => true,
		:length => { :maximum => 250 }
end