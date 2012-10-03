class CreateCustomers < ActiveRecord::Migration
	def up
		create_table :customers do |t|
			t.string :first_name
			t.string :last_name

			t.timestamps
		end
	end

	def down
		drop_table :customers
	end
end
