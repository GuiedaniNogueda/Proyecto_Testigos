class Page < ActiveRecord::Base
	belongs_to :creative
	belongs_to :line
end
