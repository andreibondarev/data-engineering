class Upload < ActiveRecord::Base
	attr_accessible :file
	has_attached_file :file
end
