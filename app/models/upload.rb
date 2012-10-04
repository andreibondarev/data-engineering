class Upload
	require 'csv'

	include ActiveModel::Validations
	include ActiveModel::Conversion
	extend ActiveModel::Naming

	attr_accessor :file, :total_gross_revenue
	validates_presence_of :file

	class << self
		def all
			return []
		end
	end

	def initialize(attributes = {})
		if attributes.present?
			attributes.each do |name, value|
				send("#{name}=", value)
			end
		end
		@total_gross_revenue ||= 0
	end

	def parse_file
		parsed_array = CSV.open(self.file.original_filename, {:col_sep => "\t"}).read
		parsed_array.shift

		ActiveRecord::Base.transaction do
			parsed_array.each do |record|
				customer = Customer.find_or_create_by_first_name_and_last_name(record[0].split.first, record[0].split.second)
				item = Item.find_or_create_by_description_and_price(record[1], record[2])
				merchant = Merchant.find_or_create_by_name_and_address(record[5], record[4])

				## Does not prevent duplicate transaction lines
				transaction_line = TransactionLine.new(:customer => customer, :item => item, :quantity => record[3], :merchant => merchant)
				transaction_line.save

				self.total_gross_revenue += (transaction_line.quantity * item.price)
			end
		end
	end

	def persisted?
		false
	end
end
