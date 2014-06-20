class Creative < ActiveRecord::Base
	belongs_to :order

	has_many :images

	has_and_belongs_to_many :lines
end
