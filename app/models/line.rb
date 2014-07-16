class Line < ActiveRecord::Base

	has_many :pages
	has_many :creatives, through: :pages
end
