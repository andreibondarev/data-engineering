class CreateUploads < ActiveRecord::Migration
	def up
		create_table :uploads do |t|
			t.timestamps
		end
		add_attachment :uploads, :file
	end

	def down
		drop_table :uploads
	end
end
