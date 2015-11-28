class Type < ActiveRecord::Base
	has_many :services
	validates :nombre, presence: true
end
