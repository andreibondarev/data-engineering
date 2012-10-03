class Merchant < ActiveRecord::Base
	has_many :transaction_lines
	
	attr_accessible :name, :address

	validates :name, :address,
		:presence => true,
		:length => { :maximum => 250 }
end