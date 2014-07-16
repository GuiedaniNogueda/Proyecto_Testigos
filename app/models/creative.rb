class Creative < ActiveRecord::Base
	belongs_to :order

	has_many :images
 
	has_many :pages
	has_many :lines, through: :pages
end
