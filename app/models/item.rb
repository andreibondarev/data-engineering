class Item < ActiveRecord::Base
	has_many :transaction_lines

	attr_accessible :name, :description, :price

	validates :name,
		:presence => true,
		:length => { :maximum => 250 },
		:allow_blank => true

	validates :description,
		:presence => true,
		:length => { :maximum => 250 },
		:allow_blank => true		

	validates :price,
		:presence => true,
		:numericality => true
end