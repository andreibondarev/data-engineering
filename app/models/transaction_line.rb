class TransactionLine < ActiveRecord::Base
	belongs_to :item
	belongs_to :merchant
	belongs_to :customer

	validates_presence_of :item, :merchant, :customer, :quantity
end