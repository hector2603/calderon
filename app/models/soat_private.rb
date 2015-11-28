class SoatPrivate < ActiveRecord::Base
	validates :vehiculo, :clase, :prima, :contribucion,:tasa, presence: true
end
