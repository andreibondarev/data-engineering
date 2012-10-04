class Item < ActiveRecord::Base
	has_many :transaction_lines

	attr_accessible :description, :price

	validates :description,
		:presence => true,
		:length => { :maximum => 250 }

	validates :price,
		:presence => true,
		:numericality => true
end