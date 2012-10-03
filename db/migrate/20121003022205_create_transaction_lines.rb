class CreateTransactionLines < ActiveRecord::Migration
	def up
		create_table :transaction_lines do |t|
			t.integer :customer_id
			t.integer :merchant_id
			t.integer :item_id
			t.integer :quantity

			t.timestamps
		end
	end

	def down
		drop_table :transaction_lines
	end
end
