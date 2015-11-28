class Insurance < ActiveRecord::Base
	validates :nombre, :resumen, :descripcion, presence: true
	validates :nombre, length: { in: 1..30 , message: "debe tener entre 1 y 30 caracteres"}
	validates :resumen, length: { in: 1..100 , message: "debe tener entre 1 y 30 caracteres"}
	validates :descripcion, length: { in: 1..1000 , message: "debe tener entre 1 y 30 caracteres"}

	
	def self.search(busqueda)
		if busqueda
			where('nombre LIKE ?',"%#{busqueda}%")
		else
			all
		end
	end
end
