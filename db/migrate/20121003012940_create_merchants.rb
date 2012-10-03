class CreateMerchants < ActiveRecord::Migration
	def up
		create_table :merchants do |t|
			t.string :name
			t.string :address

			t.timestamps
		end
	end

	def down
		drop_table :merchants
	end
end
