class Contacto < ActiveRecord::Base
	validates :nombre, :asunto, :texto, :numero, presence: true
end
